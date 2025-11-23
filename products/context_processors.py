from .models import Category

def categories(request):
    # Lấy tất cả categories cha (không phải sub)
    main_categories = Category.objects.filter(is_sub=False).prefetch_related('subcategories')
    return {'categories': main_categories}

