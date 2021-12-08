from django.urls import path
from .views import *
from django.conf.urls import url

app_name = 'home'

urlpatterns = [
    path('login', account_login, name='Login'),
    path('', Home.as_view(), name='home'),
    path('home2/', home2, name='home2'),
    url(r'^$', HomeMapaAll.as_view(), name='home_mapa'),
    url(r'^$', HomeDatosAll.as_view(), name='home_data'),
]
