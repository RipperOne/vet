from apps.utils.tables import ModelTable
from .models import User


class UserTable(ModelTable):
    class Meta:
        model = User
        sequence = ('id', 'email', 'username', 'is_active', 'date_joined', 'last_login', 'options')
        exclude = ('password', 'first_name', 'last_name', 'is_superuser', 'is_staff')

    update_url = 'users:user_update'
    delete_url = 'users:user_delete'
