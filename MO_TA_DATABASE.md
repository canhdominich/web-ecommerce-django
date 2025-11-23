# Cơ sở dữ liệu & Chức năng nghiệp vụ -- MiniShop (Django)
------------------------------------------------------------------------

# 1. Sơ đồ các bảng trong CSDL (theo ERD)

Gồm 8 bảng chính:

-   **auth_user**
-   **users_customer**
-   **products_category**
-   **products_product**
-   **products_wishlist**
-   **orders_cart**
-   **orders_payment**
-   **orders_orderplaced**

------------------------------------------------------------------------

# 2. Chi tiết từng bảng (đúng theo ERD)

------------------------------------------------------------------------

## 2.1. auth_user

Bảng người dùng mặc định của Django, dùng cho đăng nhập.

  Field          Kiểu
  -------------- --------------
  id             int(11)
  password       varchar(128)
  last_login     datetime(6)
  is_superuser   tinyint(1)
  username       varchar(150)
  first_name     varchar(150)
  last_name      varchar(150)
  email          varchar(254)
  is_staff       tinyint(1)
  is_active      tinyint(1)
  date_joined    datetime(6)

------------------------------------------------------------------------

## 2.2. users_customer

Mở rộng thông tin người dùng (User profile).

  Field                         Kiểu
  ----------------------------- --------------
  id                            bigint(20)
  name                          varchar(200)
  locality                      varchar(200)
  city                          varchar(100)
  mobile                        varchar(15)
  zipcode                       int(11)
  user_id (FK → auth_user.id)   int(11)

------------------------------------------------------------------------

## 2.3. products_category

Danh mục sản phẩm.

  Field                                         Kiểu
  --------------------------------------------- --------------
  id                                            bigint(20)
  name                                          varchar(200)
  slug                                          varchar(200)
  is_sub                                        tinyint(1)
  sub_category_id (FK → products_category.id)   bigint(20)

------------------------------------------------------------------------

## 2.4. products_product

Sản phẩm.

  Field                                     Kiểu
  ----------------------------------------- --------------
  id                                        bigint(20)
  title                                     varchar(100)
  selling_price                             double
  discounted_price                          double
  description                               longtext
  composition                               longtext
  prodapp                                   longtext
  product_image                             varchar(100)
  category_id (FK → products_category.id)   bigint(20)

------------------------------------------------------------------------

## 2.5. products_wishlist

Danh sách yêu thích.

  Field                                   Kiểu
  --------------------------------------- ------------
  id                                      bigint(20)
  product_id (FK → products_product.id)   bigint(20)
  user_id (FK → auth_user.id)             int(11)

------------------------------------------------------------------------

## 2.6. orders_cart

Giỏ hàng.

  Field                                   Kiểu
  --------------------------------------- ------------------
  id                                      bigint(20)
  quantity                                int(10) unsigned
  product_id (FK → products_product.id)   bigint(20)
  user_id (FK → auth_user.id)             int(11)

------------------------------------------------------------------------

## 2.7. orders_payment

Thông tin thanh toán.

  Field                         Kiểu
  ----------------------------- --------------
  id                            bigint(20)
  amount                        double
  paid                          tinyint(1)
  user_id (FK → auth_user.id)   int(11)
  created_at                    datetime(6)
  payment_method                varchar(20)
  payment_status                varchar(100)
  transaction_id                varchar(100)

------------------------------------------------------------------------

## 2.8. orders_orderplaced

Đơn hàng.

  Field                                   Kiểu
  --------------------------------------- ------------------
  id                                      bigint(20)
  quantity                                int(10) unsigned
  ordered_date                            datetime(6)
  status                                  varchar(50)
  customer_id (FK → users_customer.id)    bigint(20)
  product_id (FK → products_product.id)   bigint(20)
  user_id (FK → auth_user.id)             int(11)
  payment_id (FK → orders_payment.id)     bigint(20)

------------------------------------------------------------------------

# 3. Chức năng nghiệp vụ (Business Logic)

------------------------------------------------------------------------

## 3.1. Người dùng

-   Đăng ký\
-   Đăng nhập\
-   Đăng xuất\
-   Quên mật khẩu\
-   Đổi mật khẩu\
-   Xem & cập nhật profile\
-   Quản lý nhiều địa chỉ giao hàng

------------------------------------------------------------------------

## 3.2. Danh mục & sản phẩm

-   Xem danh mục\
-   Xem sản phẩm theo danh mục\
-   Xem chi tiết sản phẩm

------------------------------------------------------------------------

## 3.3. Giỏ hàng (Cart)

-   Thêm vào giỏ\
-   Tăng giảm số lượng\
-   Xóa khỏi giỏ\
-   Tính tổng tiền theo real-time

------------------------------------------------------------------------

## 3.4. Wishlist (sản phẩm yêu thích)

-   Thêm vào danh sách yêu thích\
-   Xóa khỏi danh sách yêu thích\
-   Xem danh sách yêu thích

------------------------------------------------------------------------

## 3.5. Đặt hàng (Order)

### Hai phương thức:

#### 1. Mua ngay (Buy now)

-   Chọn 1 sản phẩm → checkout ngay

#### 2. Đặt hàng từ giỏ

-   Lấy toàn bộ giỏ hàng → hình thành nhiều OrderPlaced

------------------------------------------------------------------------

## 3.6. Thanh toán (Payment)

-   Chọn phương thức thanh toán\
-   Tạo Payment record\
-   Gán Payment vào OrderPlaced\
-   Kiểm tra trạng thái thanh toán

------------------------------------------------------------------------

## 3.7. Theo dõi đơn hàng

-   Xem tất cả đơn hàng\
-   Xem chi tiết đơn hàng\
-   Xem trạng thái (pending, shipped, delivered, cancelled...)

------------------------------------------------------------------------

## 3.8. Admin

-   CRUD sản phẩm\
-   CRUD danh mục\
-   Quản lý khách hàng\
-   Quản lý đơn hàng\
-   Quản lý thanh toán

------------------------------------------------------------------------

# 4. Ghi chú kỹ thuật cho lập trình bằng Cursor AI

-   Mỗi bảng tương ứng một Django Model\
-   Quan hệ theo đúng ERD\
-   Phải seed database Category trước\
-   Product bắt buộc thuộc 1 Category\
-   Order phải có Payment\
-   OrderPlaced luôn dùng user_id + customer_id song song
------------------------------------------------------------------------

