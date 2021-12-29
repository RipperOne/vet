from django.urls import path
from .views import *
from django.conf.urls import url
from django.contrib.gis import admin

app_name = 'home'

admin.autodiscover()

urlpatterns = [
    path('login', account_login, name='Login'),
    path('', Home.as_view(), name='home'),
    path('home2/', HomeTemplateView.as_view(), name='home2'),
]
