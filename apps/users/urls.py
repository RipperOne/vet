from django.urls import path

from . import views


app_name = 'users'

urlpatterns = [
    path('create/', views.UserCreateView.as_view(), name='user_create'),
    path('update/<int:pk>/', views.UserUpdateView.as_view(), name='user_update'),
    path('delete/<int:pk>/', views.UserDeleteView.as_view(), name='user_delete'),
    path('password/<int:pk>/', views.UserPasswordChangeView.as_view(), name='password'),
    path('account/', views.UserAccountView.as_view(), name='account'),
    path('activate/<uidb64>/<token>/', views.UserActivationView.as_view(), name='activate'),
    path('', views.UserListView.as_view(), name='user_list'),
]
