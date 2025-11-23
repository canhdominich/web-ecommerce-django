from django import forms
from .models import Customer

class CustomerProfileForm(forms.ModelForm):
    class Meta:
        model = Customer
        fields = ['name', 'locality', 'city', 'mobile', 'zipcode']
        widgets = {
            'name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Nhập họ tên'}),
            'locality': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Nhập địa chỉ'}),
            'city': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Nhập thành phố'}),
            'mobile': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Nhập số điện thoại'}),
            'zipcode': forms.NumberInput(attrs={'class': 'form-control', 'placeholder': 'Nhập mã bưu điện (tùy chọn)'}),
        }
        labels = {
            'name': 'Họ tên',
            'locality': 'Địa chỉ',
            'city': 'Thành phố',
            'mobile': 'Số điện thoại',
            'zipcode': 'Mã bưu điện (tùy chọn)',
        }

