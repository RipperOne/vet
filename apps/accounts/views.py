from apps.users import forms
from django.urls import reverse_lazy
from django.views import generic
from apps.users.models import User


class SignUp(generic.CreateView):
    form_class = forms.UserCreationForm
    model = User
    template_name = '../templates/allauth/account/signup.html'
    success_url = reverse_lazy('account_login')
    success_message = 'Usuario creado exitosamente'
