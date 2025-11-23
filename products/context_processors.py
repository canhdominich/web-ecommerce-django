from .models import Category

def categories(request):
    categories = Category.objects.filter(is_sub=False)
    return {'categories': categories}

