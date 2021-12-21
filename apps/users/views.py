from django.views.generic import FormView
from django.contrib.messages.views import SuccessMessageMixin
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth import logout
from django.utils.translation import ugettext_lazy as _
from django.urls import reverse_lazy
from django.http import Http404

from apps.utils.views import CreateView, UpdateView, ListView, DeleteView
from apps.users import forms
from apps.users.tables import UserTable
from apps.users.filters import UserFilter
from apps.users.models import User
from django.contrib.auth.models import Group


class UserListView(ListView):
    table_class = UserTable
    filterset_class = UserFilter
    model = User
    paginate_by = 30
    #required_permissions = ('auth.add_user',)
    change_permission = 'auth.change_user'
    delete_permission = 'auth.delete_user'
    add_permission = 'auth.add_user'
    add_url = reverse_lazy('users:user_create')
    ordering = ['id']
    UserGroup1 = "Publico"

    def get_queryset(self):
        id_ = self.request.user.id
        if self.request.user.is_superuser:
            return User.objects.get_queryset().order_by('id')
        return User.objects.get_queryset().filter(id=id_).order_by('id')

    def get_context_data(self, **kwargs):
        context = super(UserListView, self).get_context_data(**kwargs)
        context['q'] = self.request.GET.get('q', '')
        return context


class UserCreateView(CreateView):
    template_name = 'users/create.html'
    model = User
    form_class = forms.UserCreationForm
    success_url = reverse_lazy('users:user_list')
    success_message = 'Usuario creado exitosamente'
    required_permissions = ('auth.add_user',)
    back_url = reverse_lazy('users:user_list')


class UserUpdateView(UpdateView):
    template_name = 'users/update.html'
    model = User
    form_class = forms.UpdateForm
    success_url = reverse_lazy('users:user_list')
    success_message = 'Usuario actualizado exitosamente'
    required_permissions = ('auth.change_user',)
    back_url = reverse_lazy('users:user_list')


class UserDeleteView(DeleteView):
    model = User
    success_url = reverse_lazy('users:user_list')
    success_message = 'Usuario eliminado exitosamente'
    required_permissions = ('auth.delete_user',)


class UserPasswordChangeView(LoginRequiredMixin, UpdateView):
    template_name = 'users/password.html'
    model = User
    form_class = forms.NewPasswordChangeForm
    success_url = reverse_lazy('users:user_list')


class UserAccountView(UpdateView):
    template_name = 'users/account.html'
    model = User
    fields = ['first_name', 'last_name']
    success_url = reverse_lazy('users:account')
    success_message = 'Cuenta actualizada exitosamente'

    def get_object(self):
        return self.request.user


class UserActivationView(SuccessMessageMixin, FormView):
    template_name = 'users/account_activation.html'
    success_url = reverse_lazy('accounts:login')
    form_class = forms.NewPasswordChangeForm
    success_message = _('Your account has been activated successfully,'
                        'now you can login with your username and password')

    def get(self, request, *args, **kwargs):
        logout(request)

        try:
            response = super(UserActivationView, self).get(self, request, *args, **kwargs)
        except:
            raise Http404(_('Invalid link'))

        return response

    def get_form_kwargs(self):
        kwargs = super(UserActivationView, self).get_form_kwargs()
        # self.user = get_user(
        #     self.kwargs.get('uidb64'),
        #     self.kwargs.get('token')
        # )
        kwargs['instance'] = self.user
        return kwargs

    def form_valid(self, form):
        self.user.is_active = True
        self.user.groups = 'Publico'
        self.user.save()
        form.save()
        return super(UserActivationView, self).form_valid(form)
