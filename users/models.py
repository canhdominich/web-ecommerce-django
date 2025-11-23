from django.db import models
from django.contrib.auth.models import User

# Create your models here.

class Customer(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    name = models.CharField(max_length=200, blank=True, default='')
    locality = models.CharField(max_length=200, blank=True, default='')
    city = models.CharField(max_length=100, blank=True, default='')
    mobile = models.CharField(max_length=15, blank=True, default='')
    zipcode = models.IntegerField(null=True, blank=True, default=None)

    def __str__(self):
        return str(self.id)
