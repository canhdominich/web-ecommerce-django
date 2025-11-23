from django import forms
from .models import Customer

class CustomerProfileForm(forms.ModelForm):
    class Meta:
        model = Customer
        fields = ['name', 'locality', 'city', 'mobile', 'zipcode']
        widgets = {
            'name': forms.TextInput(attrs={'class': 'form-control'}),
            'locality': forms.TextInput(attrs={'class': 'form-control'}),
            'city': forms.TextInput(attrs={'class': 'form-control'}),
            'mobile': forms.TextInput(attrs={'class': 'form-control'}),
            'zipcode': forms.NumberInput(attrs={'class': 'form-control'}),
        }
        labels = {
            'name': 'Họ tên',
            'locality': 'Địa chỉ',
            'city': 'Thành phố',
            'mobile': 'Số điện thoại',
            'zipcode': 'Mã bưu điện (tùy chọn)',
        }
    
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        # Thêm placeholder sau khi form đã được khởi tạo
        self.fields['name'].widget.attrs['placeholder'] = 'Nhập họ tên'
        self.fields['locality'].widget.attrs['placeholder'] = 'Nhập địa chỉ'
        self.fields['city'].widget.attrs['placeholder'] = 'Nhập thành phố'
        self.fields['mobile'].widget.attrs['placeholder'] = 'Nhập số điện thoại'
        self.fields['zipcode'].widget.attrs['placeholder'] = 'Nhập mã bưu điện (tùy chọn)'

