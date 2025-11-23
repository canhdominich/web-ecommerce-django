# MiniShop - Django E-commerce Project

Dự án web e-commerce được xây dựng bằng Django với cơ sở dữ liệu MySQL.

## Cấu trúc Project

```
MiniShop/
│── media/                    # Thư mục chứa file media (hình ảnh sản phẩm)
│── MiniShop/                 # Thư mục cấu hình chính của Django
│    ├── __pycache__/
│    ├── __init__.py
│    ├── asgi.py
│    ├── settings.py          # Cấu hình project (database, apps, ...)
│    ├── urls.py              # URL routing chính
│    └── wsgi.py
│
│── orders/                   # App quản lý đơn hàng
│   ├── models.py             # Cart, Payment, OrderPlaced
│   ├── admin.py
│   ├── views.py
│   └── urls.py
│
│── page/                     # App trang chủ và các trang tĩnh
│   ├── views.py
│   └── urls.py
│
│── products/                 # App quản lý sản phẩm
│   ├── models.py             # Category, Product, Wishlist
│   ├── admin.py
│   ├── views.py
│   └── urls.py
│
│── static/app/               # Thư mục chứa static files (CSS, JS, images)
│── templates/app/            # Thư mục chứa templates HTML
│
│── users/                    # App quản lý người dùng
│   ├── models.py             # Customer
│   ├── admin.py
│   ├── views.py
│   └── urls.py
│
│── db.sqlite3                # SQLite database (backup/development)
│── manage.py                 # Django management script
│── requirements.txt          # Python dependencies
│── README.md                 # File này
```

## Cài đặt

### 1. Tạo virtual environment

```bash
python3 -m venv myenv
source myenv/bin/activate  # Linux/Mac
# hoặc
myenv\Scripts\activate  # Windows
```

### 2. Cài đặt dependencies

```bash
pip install -r requirements.txt
```

### 3. Cấu hình MySQL Database

Tạo database MySQL:

```sql
CREATE DATABASE minishop_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

Cập nhật thông tin database trong `MiniShop/settings.py`:

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'minishop_db',
        'USER': 'root',          # Thay đổi theo MySQL user của bạn
        'PASSWORD': '',          # Thay đổi theo MySQL password của bạn
        'HOST': 'localhost',
        'PORT': '3306',
    }
}
```

### 4. Chạy migrations

```bash
python manage.py makemigrations
python manage.py migrate
```

### 5. Tạo superuser

```bash
python manage.py createsuperuser
```

### 6. Chạy server

```bash
python manage.py runserver
```

Truy cập: http://127.0.0.1:8000/

## Cấu trúc Database

Project sử dụng 8 bảng chính:

1. **auth_user** - Người dùng (Django default)
2. **users_customer** - Thông tin khách hàng mở rộng
3. **products_category** - Danh mục sản phẩm
4. **products_product** - Sản phẩm
5. **products_wishlist** - Danh sách yêu thích
6. **orders_cart** - Giỏ hàng
7. **orders_payment** - Thanh toán
8. **orders_orderplaced** - Đơn hàng đã đặt

## Chức năng chính

- Đăng ký, đăng nhập, đăng xuất
- Quản lý profile và địa chỉ giao hàng
- Xem danh mục và sản phẩm
- Thêm/xóa sản phẩm vào giỏ hàng
- Quản lý wishlist
- Đặt hàng và thanh toán
- Theo dõi đơn hàng
- Admin panel để quản lý sản phẩm, đơn hàng

## Lưu ý

- Đảm bảo đã cài đặt MySQL và MySQL client
- Seed database Category trước khi thêm Product
- Product bắt buộc phải thuộc một Category
- Order phải có Payment
- OrderPlaced luôn dùng user_id + customer_id song song

