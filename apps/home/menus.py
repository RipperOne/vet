from django.urls import reverse
from menu import Menu, MenuItem


Menu.add_item('main', MenuItem('Inicio', reverse('home:home2'), weight=100, icon='fa fa-home'))
