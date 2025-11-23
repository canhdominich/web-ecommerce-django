from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.contrib.auth.forms import UserCreationForm, PasswordResetForm
from django.contrib.auth.views import (
    PasswordResetView, 
    PasswordResetDoneView, 
    PasswordResetConfirmView, 
    PasswordResetCompleteView
)
from django.urls import reverse_lazy
from .models import Customer
from .forms import CustomerProfileForm

# Create your views here.

def register(request):
    if request.user.is_authenticated:
        return redirect('home')
    
    form = UserCreationForm()
    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            messages.success(request, f'Tài khoản {username} đã được tạo thành công!')
            return redirect('login')
    
    context = {'form': form}
    return render(request, 'app/register.html', context)

def login_view(request):
    if request.user.is_authenticated:
        return redirect('home')
    
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            return redirect('home')
        else:
            messages.error(request, 'Tên đăng nhập hoặc mật khẩu không đúng!')
    
    return render(request, 'app/login.html')

def logout_view(request):
    logout(request)
    return redirect('home')

@login_required
def profile(request):
    # Lấy Customer đầu tiên của user (hoặc tạo mới nếu chưa có)
    customer = Customer.objects.filter(user=request.user).first()
    
    if not customer:
        # Nếu chưa có Customer nào, tạo mới
        customer = Customer.objects.create(
            user=request.user,
            name='',
            locality='',
            city='',
            mobile='',
            zipcode=None
        )
    
    if request.method == 'POST':
        # Cập nhật thông tin từ POST data
        customer.name = request.POST.get('name', '')
        customer.locality = request.POST.get('locality', '')
        customer.city = request.POST.get('city', '')
        customer.mobile = request.POST.get('mobile', '')
        zipcode_str = request.POST.get('zipcode', '')
        customer.zipcode = int(zipcode_str) if zipcode_str and zipcode_str.isdigit() else None
        customer.save()
        messages.success(request, 'Thông tin đã được cập nhật!')
        return redirect('profile')
    
    # Tạo form để hiển thị labels (không dùng để render input)
    form = CustomerProfileForm(instance=customer)
    
    context = {'form': form, 'customer': customer}
    return render(request, 'app/profile.html', context)

@login_required
def address(request):
    addresses = Customer.objects.filter(user=request.user)
    
    if request.method == 'POST':
        name = request.POST.get('name', '')
        locality = request.POST.get('locality', '')
        city = request.POST.get('city', '')
        mobile = request.POST.get('mobile', '')
        zipcode_str = request.POST.get('zipcode', '')
        
        # Convert zipcode to int or None
        zipcode = int(zipcode_str) if zipcode_str and zipcode_str.isdigit() else None
        
        Customer.objects.create(
            user=request.user,
            name=name,
            locality=locality,
            city=city,
            mobile=mobile,
            zipcode=zipcode
        )
        messages.success(request, 'Đã thêm địa chỉ mới!')
        return redirect('address')
    
    context = {'addresses': addresses}
    return render(request, 'app/address.html', context)

# Password Reset Views
class CustomPasswordResetView(PasswordResetView):
    template_name = 'app/password_reset.html'
    email_template_name = 'app/password_reset_email.html'
    subject_template_name = 'app/password_reset_subject.txt'
    success_url = reverse_lazy('password_reset_done')

class CustomPasswordResetDoneView(PasswordResetDoneView):
    template_name = 'app/password_reset_done.html'

class CustomPasswordResetConfirmView(PasswordResetConfirmView):
    template_name = 'app/password_reset_confirm.html'
    success_url = reverse_lazy('password_reset_complete')

class CustomPasswordResetCompleteView(PasswordResetCompleteView):
    template_name = 'app/password_reset_complete.html'
