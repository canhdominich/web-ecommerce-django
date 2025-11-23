from django.contrib import admin
from .models import Cart, Payment, OrderPlaced

# Register your models here.

@admin.register(Cart)
class CartModelAdmin(admin.ModelAdmin):
    list_display = ['id', 'user', 'product', 'quantity']
    list_filter = ['user']

@admin.register(Payment)
class PaymentModelAdmin(admin.ModelAdmin):
    list_display = ['id', 'user', 'amount', 'paid', 'payment_method', 'payment_status', 'created_at']
    list_filter = ['payment_method', 'payment_status', 'created_at']
    search_fields = ['user__username', 'transaction_id']

@admin.register(OrderPlaced)
class OrderPlacedModelAdmin(admin.ModelAdmin):
    list_display = ['id', 'user', 'customer', 'product', 'quantity', 'status', 'ordered_date']
    list_filter = ['status', 'ordered_date', 'payment__payment_status']
    search_fields = ['user__username', 'product__title', 'customer__name']
    readonly_fields = ['ordered_date']
    
    fieldsets = (
        ('Thông tin đơn hàng', {
            'fields': ('user', 'customer', 'product', 'quantity', 'status', 'ordered_date')
        }),
        ('Thanh toán', {
            'fields': ('payment',)
        }),
    )
