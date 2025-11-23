# Mô tả chi tiết chức năng Client và Admin

## 1. Chức năng Client

### Đăng ký -- Đăng nhập -- Quên mật khẩu

-   Tạo tài khoản mới, kiểm tra dữ liệu hợp lệ (email, mật khẩu, xác
    nhận).
-   Đăng nhập để sử dụng chức năng đặt hàng, xem đơn hàng.
-   Quên mật khẩu sử dụng bộ PasswordReset của Django:
    PasswordResetView, PasswordResetDoneView, PasswordResetConfirmView,
    PasswordResetCompleteView.

### Cập nhật thông tin cá nhân & Quản lý địa chỉ

-   Thêm/chỉnh sửa họ tên, địa chỉ, số điện thoại, thành phố, mã bưu
    điện.
-   Hiển thị và chỉnh sửa danh sách địa chỉ đã lưu.
-   Xử lý qua ProfileView (GET/POST).

### Xem danh sách sản phẩm

-   Hiển thị danh sách sản phẩm.
-   Lọc theo danh mục → danh mục con.
-   Xem trang chi tiết từng sản phẩm.

### Sản phẩm yêu thích (Wishlist)

-   Thêm vào danh sách yêu thích.
-   Lưu lại các sản phẩm quan tâm.
-   Xem danh sách yêu thích.

### Tìm kiếm sản phẩm

-   Tìm kiếm theo tên sản phẩm.
-   Trả về danh sách phù hợp với từ khóa.

### Giỏ hàng (Cart)

-   Thêm sản phẩm vào giỏ, tự động tăng số lượng nếu sản phẩm đã có.
-   Hiển thị chi tiết giỏ hàng: hình ảnh, tên, số lượng, đơn giá, thành
    tiền.
-   Cập nhật số lượng bằng Ajax.
-   Xóa sản phẩm khỏi giỏ.
-   Tính tổng tiền giỏ hàng.

### Đặt hàng & Thanh toán

-   Mua ngay 1 sản phẩm (không cần thêm vào giỏ).
-   Đặt hàng toàn bộ giỏ hàng.
-   Chọn địa chỉ giao hàng, phương thức thanh toán.
-   Xử lý qua create_payment() và view payment_done.
-   Tạo đơn hàng theo 2 trường hợp: mua ngay hoặc giỏ hàng.

### Xem đơn hàng

-   Xem danh sách đơn hàng đã đặt.
-   Xem chi tiết đơn hàng: sản phẩm, giá, số lượng, phương thức thanh
    toán, trạng thái.

## 2. Chức năng Admin, chú ý dựa vào template mà Django đã cung cấp sẵn cho mục admin

### Quản lý sản phẩm (CRUD)

-   Thêm mới sản phẩm.
-   Chỉnh sửa sản phẩm.
-   Xóa sản phẩm.
-   Quản lý ảnh, giá, mô tả.

### Quản lý danh mục (Category)

-   Thêm danh mục.
-   Chỉnh sửa danh mục.
-   Xóa danh mục.
-   Tổ chức danh mục cha → con.

### Quản lý người dùng

-   Xem danh sách tài khoản.
-   Chỉnh sửa thông tin người dùng.
-   Khóa / vô hiệu hóa tài khoản.
-   Xem lịch sử mua hàng.

### Quản lý đơn hàng

-   Xem danh sách đơn hàng từ toàn hệ thống.
-   Xem chi tiết đơn hàng.
-   Cập nhật trạng thái đơn hàng.

### Quản lý giỏ hàng & Wishlist

-   Xem toàn bộ bản ghi Cart.
-   Xem và chỉnh sửa bản ghi Wishlist.

### Quản lý thanh toán

-   Xem danh sách thanh toán (Payment).
-   Cập nhật trạng thái giao dịch.