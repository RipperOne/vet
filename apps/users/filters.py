import django_filters as filters
from django.contrib.auth import get_user_model


User = get_user_model()


class UserFilter(filters.FilterSet):
    class Meta:
        model = User
        fields = {
            'email': ['icontains'],
            'username': ['icontains'],
            'is_active': ['exact'],
        }
