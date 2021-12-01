from django import forms
from django.contrib.auth.models import Group
from django.contrib.auth.forms import (
    UserCreationForm as DjangoUserCreationForm, UsernameField, AdminPasswordChangeForm
)

from apps.users.models import User


class UserCreationForm(DjangoUserCreationForm):
    first_name = forms.CharField(label='Nombres', required=False)
    last_name = forms.CharField(label='Apellidos', required=False)
    email = forms.CharField(
        label='Email',
        widget=forms.EmailInput,
        help_text='Requerido ingrese un email valido',
        required=True
    )
    groups = forms.ModelMultipleChoiceField(
        label='Grupos',
        widget=forms.CheckboxSelectMultiple,
        queryset=Group.objects.all(),
        required=False,
    )

    class Meta:
        model = User
        fields = ('username', 'first_name', 'last_name', 'email', 'password1', 'password2', 'is_active')
        field_classes = {'username': UsernameField}

    def save(self, commit=True):
        user = super().save(commit=False)
        user.set_password(self.cleaned_data['password1'])
        user.is_active = self.cleaned_data['is_active']
        user.email = self.cleaned_data['email']
        user.first_name = self.cleaned_data['first_name']
        user.last_name = self.cleaned_data['last_name']

        if not commit:
            return user

        user.save()
        user.groups.set(self.cleaned_data['groups'])
        return user


class UpdateForm(forms.ModelForm):
    email = forms.CharField(
        label='Email',
        widget=forms.EmailInput,
        help_text='Requerido ingrese un email valido',
        required=True
    )
    groups = forms.ModelMultipleChoiceField(
        label='Grupos',
        widget=forms.CheckboxSelectMultiple,
        queryset=Group.objects.all(),
        required=False,
    )

    class Meta:
        model = User
        fields = ('username', 'first_name', 'last_name', 'email', 'is_active', 'groups')
        field_classes = {'username': UsernameField}


class NewPasswordChangeForm(object):
    pass
