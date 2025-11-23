from django.urls import path
from . import views

urlpatterns = [
    path('', views.products, name='products'),
    path('category/', views.category, name='category'),
    path('<int:pk>/', views.product_detail, name='product_detail'),
    path('wishlist/', views.wishlist, name='wishlist'),
    path('wishlist/add/<int:pk>/', views.add_to_wishlist, name='add_to_wishlist'),
    path('wishlist/remove/<int:pk>/', views.remove_from_wishlist, name='remove_from_wishlist'),
]
