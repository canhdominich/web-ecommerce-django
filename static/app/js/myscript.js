// Custom JavaScript for MiniShop

// Auto-hide messages after 5 seconds
document.addEventListener('DOMContentLoaded', function() {
    var messages = document.querySelectorAll('#message');
    messages.forEach(function(message) {
        setTimeout(function() {
            message.style.transition = 'opacity 0.5s';
            message.style.opacity = '0';
            setTimeout(function() {
                message.remove();
            }, 500);
        }, 5000);
    });
});

// Smooth scroll
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            target.scrollIntoView({
                behavior: 'smooth',
                block: 'start'
            });
        }
    });
});

// Nested Dropdown Menu (Menu 2 cấp)
document.addEventListener('DOMContentLoaded', function() {
    // Xử lý dropdown menu 2 cấp
    var dropdownElements = document.querySelectorAll('.dropdown.dropend');
    
    dropdownElements.forEach(function(element) {
        var submenu = element.querySelector('.submenu');
        var submenuTrigger = element.querySelector('.submenu-trigger');
        
        if (submenu) {
            // Hover để mở submenu
            element.addEventListener('mouseenter', function() {
                submenu.classList.add('show');
            });
            
            element.addEventListener('mouseleave', function() {
                submenu.classList.remove('show');
            });
            
            // Click vào icon để mở submenu trên mobile
            if (submenuTrigger) {
                submenuTrigger.addEventListener('click', function(e) {
                    if (window.innerWidth <= 991) {
                        e.preventDefault();
                        e.stopPropagation();
                        submenu.classList.toggle('show');
                    }
                });
            }
        }
    });
    
    // Đóng tất cả submenu khi click bên ngoài
    document.addEventListener('click', function(e) {
        if (!e.target.closest('.dropdown.dropend')) {
            document.querySelectorAll('.submenu.show').forEach(function(menu) {
                menu.classList.remove('show');
            });
        }
    });
});

