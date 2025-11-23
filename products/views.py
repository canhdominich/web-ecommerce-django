from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from .models import Product, Category, Wishlist
from orders.models import Cart

# Create your views here.

def products(request):
    products = Product.objects.all()
    categories = Category.objects.filter(is_sub=False)
    context = {'products': products, 'categories': categories}
    return render(request, 'app/products.html', context)

def category(request):
    category_slug = request.GET.get('category')
    if category_slug:
        category_obj = get_object_or_404(Category, slug=category_slug)
        products = Product.objects.filter(category=category_obj)
    else:
        products = Product.objects.all()
        category_obj = None
    
    categories = Category.objects.filter(is_sub=False)
    context = {
        'products': products,
        'category': category_obj,
        'categories': categories
    }
    return render(request, 'app/category.html', context)

def product_detail(request, pk):
    product = get_object_or_404(Product, pk=pk)
    in_wishlist = False
    if request.user.is_authenticated:
        in_wishlist = Wishlist.objects.filter(user=request.user, product=product).exists()
    
    context = {
        'product': product,
        'in_wishlist': in_wishlist
    }
    return render(request, 'app/product_detail.html', context)

@login_required
def add_to_wishlist(request, pk):
    product = get_object_or_404(Product, pk=pk)
    wishlist_item, created = Wishlist.objects.get_or_create(user=request.user, product=product)
    
    if created:
        messages.success(request, 'Đã thêm vào danh sách yêu thích!')
    else:
        messages.info(request, 'Sản phẩm đã có trong danh sách yêu thích!')
    
    return redirect('product_detail', pk=pk)

@login_required
def remove_from_wishlist(request, pk):
    product = get_object_or_404(Product, pk=pk)
    Wishlist.objects.filter(user=request.user, product=product).delete()
    messages.success(request, 'Đã xóa khỏi danh sách yêu thích!')
    return redirect('wishlist')

@login_required
def wishlist(request):
    wishlist_items = Wishlist.objects.filter(user=request.user)
    context = {'wishlist_items': wishlist_items}
    return render(request, 'app/wishlist.html', context)
