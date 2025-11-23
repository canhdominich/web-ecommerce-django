// Cart functionality with enhanced UI
var updateBtns = document.getElementsByClassName('update-cart')

for (i = 0; i < updateBtns.length; i++) {
    updateBtns[i].addEventListener('click', function(){
        var productId = this.dataset.product
        var action = this.dataset.action
        var button = this
        
        // Add loading state
        button.disabled = true
        var originalHTML = button.innerHTML
        button.innerHTML = '<span class="spinner-border spinner-border-sm me-2"></span>Đang xử lý...'

        if (user === 'AnonymousUser'){
            button.disabled = false
            button.innerHTML = originalHTML
            // Show beautiful alert
            showNotification('Vui lòng đăng nhập để thêm sản phẩm vào giỏ hàng!', 'warning')
        }else{
            updateUserOrder(productId, action, button, originalHTML)
        }
    })
}

function showNotification(message, type) {
    // Create notification element
    var notification = document.createElement('div')
    notification.className = 'alert alert-' + type + ' alert-dismissible fade show position-fixed top-0 start-50 translate-middle-x mt-3'
    notification.style.zIndex = '9999'
    notification.style.minWidth = '300px'
    notification.innerHTML = '<i class="fas fa-info-circle me-2"></i>' + message + 
        '<button type="button" class="btn-close" data-bs-dismiss="alert"></button>'
    document.body.appendChild(notification)
    
    // Auto remove after 3 seconds
    setTimeout(function() {
        notification.remove()
    }, 3000)
}

function updateUserOrder(productId, action, button, originalHTML){
    console.log('User is authenticated, sending data...')

    var url = '/orders/update-cart/'

    fetch(url, {
        method:'POST',
        headers:{
            'Content-Type':'application/json',
            'X-CSRFToken':csrftoken,
        },
        body:JSON.stringify({'productId': productId, 'action':action})
    })
    .then((response) => {
        return response.json();
    })
    .then((data) => {
        console.log('data:', data)
        // Update cart total in navbar
        var cartTotal = document.getElementById('cart-total')
        if (cartTotal) {
            if (data.cartItems > 0) {
                cartTotal.textContent = data.cartItems
                cartTotal.style.display = 'inline-flex'
            } else {
                cartTotal.style.display = 'none'
            }
        }
        // Show success message
        showNotification('Đã cập nhật giỏ hàng!', 'success')
        // Reload page after short delay
        setTimeout(function() {
            location.reload()
        }, 500)
    })
    .catch((error) => {
        console.error('Error:', error)
        button.disabled = false
        button.innerHTML = originalHTML
        showNotification('Có lỗi xảy ra. Vui lòng thử lại!', 'danger')
    });
}

