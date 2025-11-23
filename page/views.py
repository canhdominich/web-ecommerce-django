from django.shortcuts import render, redirect
from products.models import Product, Category
from orders.models import Cart

# Create your views here.

def home(request):
    products = Product.objects.all()[:8]  # Hiển thị 8 sản phẩm đầu tiên
    categories = Category.objects.filter(is_sub=False)
    
    # Tính số lượng sản phẩm trong giỏ hàng
    cart_items_count = 0
    if request.user.is_authenticated:
        cart_items = Cart.objects.filter(user=request.user)
        cart_items_count = sum(item.quantity for item in cart_items)
    
    # Không cần thêm ImageURL nữa vì template sẽ dùng product_image.url trực tiếp
    
    context = {
        'products': products,
        'categories': categories,
        'cartItems': cart_items_count
    }
    return render(request, 'app/home.html', context)

def search(request):
    if request.method == 'POST':
        searched = request.POST.get('searched', '')
        products = Product.objects.filter(title__icontains=searched)
        
        # Không cần thêm ImageURL nữa vì template sẽ dùng product_image.url trực tiếp
        
        categories = Category.objects.filter(is_sub=False)
        cart_items_count = 0
        if request.user.is_authenticated:
            cart_items = Cart.objects.filter(user=request.user)
            cart_items_count = sum(item.quantity for item in cart_items)
        
        context = {
            'searched': searched,
            'keys': products,
            'categories': categories,
            'cartItems': cart_items_count
        }
        return render(request, 'app/search.html', context)
    else:
        return redirect('home')
