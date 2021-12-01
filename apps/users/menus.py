from django.urls import reverse
from menu import Menu, MenuItem


Menu.add_item('main', MenuItem('Usuarios', reverse('users:user_list'), weight=2000, icon='fa fa-user'))
