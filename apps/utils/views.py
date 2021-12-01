from django.views.generic import (
    DeleteView as DjangoDeleteView, CreateView as DjangoCreateView, UpdateView as DjangoUpdateView,
    TemplateView as DjangoTemplateView
)
from django.contrib.messages.views import SuccessMessageMixin
from django.core.exceptions import PermissionDenied
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.urls import reverse_lazy
from django.contrib.admin.utils import NestedObjects
from django.utils.text import capfirst
from django.utils.encoding import force_text
from django.utils.decorators import method_decorator
from django_filters.views import FilterView
from django_tables2 import SingleTableView

from .mixins import JSONResponseMixin


def get_deleted_objects(objs):
    collector = NestedObjects(using='default')
    collector.collect(objs)

    def format_callback(obj):
        opts = obj._meta
        return '%s: %s' % (capfirst(opts.verbose_name), force_text(obj))

    to_delete = collector.nested(format_callback)
    protected = [format_callback(obj) for obj in collector.protected]
    model_count = {model._meta.verbose_name_plural: len(objs) for model, objs in collector.model_objs.items()}
    return to_delete, model_count, protected


def get_success_route(model):
    app_name = model._meta.app_label
    model_name = str(model.__name__).lower()
    return reverse_lazy('{0}:{1}_list'.format(app_name, model_name))


def get_plural_name(model):
    return model._meta.verbose_name_plural.title()


def get_singular_name(model):
    return model._meta.verbose_name.title()


class PermissionsRequiredMixin(object):
    required_permissions = ()

    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs):
        if not request.user.has_perms(self.required_permissions):
            messages.error(request,
                           'No tienes los permisos necesarios para realizar la operacion requerida.')
            raise PermissionDenied
        return super(PermissionsRequiredMixin, self).dispatch(request, *args, **kwargs)


class TemplateView(PermissionsRequiredMixin, DjangoTemplateView):
    required_permissions = ()


class DetailView(PermissionsRequiredMixin, DjangoTemplateView):
    required_permissions = ()


class ListView(PermissionsRequiredMixin, FilterView, SingleTableView):
    required_permissions = ()
    template_name = 'generic/list.html'
    change_permission = None
    delete_permission = None
    add_permission = None
    paginate_by = 20
    order_by = 'id'
    add_url = None

    def get_table(self, **kwargs):
        table = super().get_table(**kwargs)

        if self.change_permission and self.request.user.has_perm(self.change_permission):
            table.can_edit = True

        if self.delete_permission and self.request.user.has_perm(self.delete_permission):
            table.can_delete = True

        return table

    def is_excel_request(self):
        if self.request.GET.get('excel'):
            return True
        return False

    def has_perm(self, name):
        return self.request.user.has_perm(name)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        if hasattr(self.model, '_meta'):
            context['model_name'] = self.model._meta.verbose_name_plural.title()
        context['can_add'] = self.has_perm(self.add_permission) if self.add_permission else False
        context['add_url'] = self.add_url
        return context


class CreateView(PermissionsRequiredMixin, SuccessMessageMixin, DjangoCreateView):
    template_name = 'generic/form.html'
    required_permissions = ()
    back_url = '#'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['form_title'] = self.form_title
        context['success_url'] = self.success_url
        context['back_url'] = self.back_url
        return context

    @property
    def success_message(self):
        if not self.model:
            raise NotImplementedError('Define a model')
        model_name = get_singular_name(self.model)
        return '{} creado exitosamente'.format(model_name)

    @property
    def form_title(self):
        if not self.model:
            raise NotImplementedError('Define a model')
        model_name = get_singular_name(self.model)
        return 'Formulario de {}'.format(model_name)

    @property
    def success_url(self):
        return get_success_route(self.model)


class UpdateView(PermissionsRequiredMixin, SuccessMessageMixin, DjangoUpdateView):
    template_name = 'generic/form.html'
    required_permissions = ()
    back_url = '#'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['form_title'] = self.form_title
        context['success_url'] = self.success_url
        context['back_url'] = self.back_url
        return context

    @property
    def form_title(self):
        model_name = get_singular_name(self.model)
        return 'Actualizar Formulario de {}'.format(model_name)

    @property
    def success_message(self):
        model_name = get_singular_name(self.model)
        return '{} actualizado exitosamente.'.format(model_name)

    @property
    def success_url(self):
        return get_success_route(self.model)


class DeleteView(PermissionsRequiredMixin, DjangoDeleteView):
    template_name = 'generic/confirm_delete.html'
    required_permissions = ()
    send_message = True

    def delete(self, request, *args, **kwargs):
        if self.send_message:
            messages.success(self.request, self.success_message)
        return super().delete(request, *args, **kwargs)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['delete_title'] = self.delete_title
        context['success_url'] = self.success_url
        (deleted_objects, model_count, protected) = get_deleted_objects([self.object])
        context.update({
            'deleted_objects': deleted_objects,
            'model_count': dict(model_count).items(),
            'protected': protected,
        })
        return context

    @property
    def delete_title(self):
        model_name = get_singular_name(self.model)
        return 'Eliminar {} '.format(model_name)

    @property
    def success_message(self):
        model_name = get_singular_name(self.model)
        return '{} eliminado exitosamente'.format(model_name)

    @property
    def success_url(self):
        return get_success_route(self.model)


class JsonView(PermissionsRequiredMixin, JSONResponseMixin, DjangoTemplateView):
    required_permissions = ()

    def render_to_response(self, context, **response_kwargs):
        return self.render_to_json_response(context, **response_kwargs)
