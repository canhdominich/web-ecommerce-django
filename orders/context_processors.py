from .models import Cart

def cart_items_count(request):
    cart_items_count = 0
    if request.user.is_authenticated:
        cart_items = Cart.objects.filter(user=request.user)
        cart_items_count = sum(item.quantity for item in cart_items)
    return {'cartItems': cart_items_count}

