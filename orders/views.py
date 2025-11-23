from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.http import JsonResponse
from django.views.decorators.http import require_POST
import json
from .models import Cart, Payment, OrderPlaced
from products.models import Product
from users.models import Customer

# Create your views here.

@login_required
def cart(request):
    user = request.user
    cart_items = Cart.objects.filter(user=user)
    total = sum(item.total_cost for item in cart_items)
    cart_items_count = sum(item.quantity for item in cart_items)
    
    context = {
        'items': cart_items,
        'order': {'get_cart_total': total, 'get_cart_items': cart_items_count}
    }
    return render(request, 'app/cart.html', context)

@login_required
@require_POST
def update_cart(request):
    data = json.loads(request.body)
    product_id = data['productId']
    action = data['action']
    
    user = request.user
    product = get_object_or_404(Product, id=product_id)
    cart_item, created = Cart.objects.get_or_create(user=user, product=product)
    
    if action == 'add':
        cart_item.quantity += 1
        cart_item.save()
    elif action == 'remove':
        cart_item.quantity -= 1
        if cart_item.quantity <= 0:
            cart_item.delete()
        else:
            cart_item.save()
    
    cart_items = Cart.objects.filter(user=user)
    total = sum(item.total_cost for item in cart_items)
    cart_items_count = sum(item.quantity for item in cart_items)
    
    return JsonResponse({
        'total': total,
        'cartItems': cart_items_count
    })

@login_required
def checkout(request):
    user = request.user
    cart_items = Cart.objects.filter(user=user)
    
    if not cart_items.exists():
        messages.warning(request, 'Giỏ hàng của bạn đang trống!')
        return redirect('cart')
    
    customers = Customer.objects.filter(user=user)
    total = sum(item.total_cost for item in cart_items)
    cart_items_count = sum(item.quantity for item in cart_items)
    
    if request.method == 'POST':
        customer_id = request.POST.get('customer')
        payment_method = request.POST.get('payment_method', 'cod')
        
        if not customer_id:
            messages.error(request, 'Vui lòng chọn địa chỉ giao hàng!')
            return redirect('checkout')
        
        customer = get_object_or_404(Customer, id=customer_id, user=user)
        
        # Tạo Payment
        payment = Payment.objects.create(
            user=user,
            amount=total,
            payment_method=payment_method,
            payment_status='pending'
        )
        
        # Tạo OrderPlaced cho từng sản phẩm trong giỏ
        for cart_item in cart_items:
            OrderPlaced.objects.create(
                user=user,
                customer=customer,
                product=cart_item.product,
                quantity=cart_item.quantity,
                payment=payment,
                status='pending'
            )
        
        # Xóa giỏ hàng
        cart_items.delete()
        
        messages.success(request, 'Đặt hàng thành công!')
        return redirect('orders')
    
    context = {
        'items': cart_items,
        'customers': customers,
        'order': {'get_cart_total': total, 'get_cart_items': cart_items_count}
    }
    return render(request, 'app/checkout.html', context)

@login_required
def buy_now(request, pk):
    product = get_object_or_404(Product, pk=pk)
    user = request.user
    customers = Customer.objects.filter(user=user)
    
    if request.method == 'POST':
        customer_id = request.POST.get('customer')
        payment_method = request.POST.get('payment_method', 'cod')
        quantity = int(request.POST.get('quantity', 1))
        
        if not customer_id:
            messages.error(request, 'Vui lòng chọn địa chỉ giao hàng!')
            return redirect('buy_now', pk=pk)
        
        customer = get_object_or_404(Customer, id=customer_id, user=user)
        total = product.discounted_price * quantity
        
        # Tạo Payment
        payment = Payment.objects.create(
            user=user,
            amount=total,
            payment_method=payment_method,
            payment_status='pending'
        )
        
        # Tạo OrderPlaced
        OrderPlaced.objects.create(
            user=user,
            customer=customer,
            product=product,
            quantity=quantity,
            payment=payment,
            status='pending'
        )
        
        messages.success(request, 'Đặt hàng thành công!')
        return redirect('orders')
    
    context = {
        'product': product,
        'customers': customers
    }
    return render(request, 'app/buy_now.html', context)

@login_required
def orders(request):
    orders = OrderPlaced.objects.filter(user=request.user).order_by('-ordered_date')
    context = {'orders': orders}
    return render(request, 'app/orders.html', context)

@login_required
def order_detail(request, pk):
    order = get_object_or_404(OrderPlaced, pk=pk, user=request.user)
    context = {'order': order}
    return render(request, 'app/order_detail.html', context)
