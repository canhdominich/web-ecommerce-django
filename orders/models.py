from django.db import models
from django.contrib.auth.models import User
from products.models import Product
from users.models import Customer

# Create your models here.

class Cart(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.PositiveIntegerField(default=1)

    @property
    def total_cost(self):
        return self.quantity * self.product.discounted_price

    def __str__(self):
        return f"{self.user.username} - {self.product.title} - {self.quantity}"

STATUS_CHOICES = (
    ('pending', 'Chờ xử lý'),
    ('accepted', 'Đã chấp nhận'),
    ('packed', 'Đã đóng gói'),
    ('on_the_way', 'Đang giao hàng'),
    ('delivered', 'Đã giao hàng'),
    ('cancelled', 'Đã hủy'),
)

PAYMENT_METHOD_CHOICES = (
    ('cod', 'Thanh toán khi nhận hàng'),
    ('online', 'Thanh toán online'),
)

PAYMENT_STATUS_CHOICES = (
    ('pending', 'Chờ thanh toán'),
    ('success', 'Thanh toán thành công'),
    ('failed', 'Thanh toán thất bại'),
)

class Payment(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    amount = models.FloatField()
    paid = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)
    payment_method = models.CharField(max_length=20, choices=PAYMENT_METHOD_CHOICES, default='cod')
    payment_status = models.CharField(max_length=100, choices=PAYMENT_STATUS_CHOICES, default='pending')
    transaction_id = models.CharField(max_length=100, blank=True, null=True)

    def __str__(self):
        return f"{self.user.username} - {self.amount}"

class OrderPlaced(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.PositiveIntegerField(default=1)
    ordered_date = models.DateTimeField(auto_now_add=True)
    status = models.CharField(max_length=50, choices=STATUS_CHOICES, default='pending')
    payment = models.ForeignKey(Payment, on_delete=models.CASCADE)

    @property
    def total_cost(self):
        return self.quantity * self.product.discounted_price

    def __str__(self):
        return f"{self.user.username} - {self.product.title} - {self.status}"
