from apps.users import forms
from django.urls import reverse_lazy
from django.views import generic
from apps.users.models import User
from django.shortcuts import render_to_response, render


class SignUp(generic.CreateView):
    form_class = forms.UserCreationForm
    model = User
    template_name = '../templates/allauth/account/signup.html'
    success_url = reverse_lazy('account_login')
    success_message = 'Usuario creado exitosamente'

    def post(self, request, *args, **kwargs):
        form = forms.UserCreationForm()
        if form.is_bound and form.is_valid():
            self.object = form.save(commit=False)
            self.object.groups = 'Publico'
            self.object.is_active = False
            self.object.save()
        return render(request, "account/login.html")
