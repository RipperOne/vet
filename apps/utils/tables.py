from django.utils.safestring import mark_safe, SafeText
from django.urls import reverse

import django_tables2 as tables


LIST_SEPARATOR = SafeText('<br>')


class ResponsiveTable(object):
    """Mixin para hacer las tablas responsivas."""

    class Meta:
        template = 'django_tables2/bootstrap-responsive.html'


class ModelTable(tables.Table):
    options = tables.Column(verbose_name='Opciones',
                            orderable=False,
                            empty_values=(),
                            attrs={
                                'td': {'class': 'text-center'},
                                'th': {"class": "text-center col-md-2"}})
    can_edit = False
    can_delete = False
    edit_text = 'Editar'
    edit_icon = 'fa fa-pencil-square-o'
    delete_text = 'Eliminar'
    delete_icon = 'fa fa-times'
    update_url = None
    delete_url = None

    def reverse_update(self, record):
        if self.update_url:
            return reverse(self.update_url, kwargs={'pk': record.pk})
        raise NotImplementedError('Debes implementar el metodo reverse_update.')

    def reverse_delete(self, record):
        if self.delete_url:
            return reverse(self.delete_url, kwargs={'pk': record.pk})
        raise NotImplementedError('Debes implementar el metodo reverse_delete.')

    def edit_option(self, url):
        if not self.can_edit:
            return ''

        return '''
            <a href="{0}" class="btn btn-sm btn-success tooltip-link"
                data-original-title="{1}">
                <i class="{2}"></i> {1}
            </a>
        '''.format(url, self.edit_text, self.edit_icon)

    def delete_option(self, url):
        if not self.can_delete:
            return ''

        return '''
        <a href="{0}" class="btn btn-sm btn-danger tooltip-link" data-original-title="{1}">
            <i class="{2}"></i> {1}
        </a>
        '''.format(url, self.delete_text, self.delete_icon)

    def render_options(self, value, record):
        return mark_safe(
            self.edit_option(self.reverse_update(record)) +
            self.delete_option(self.reverse_delete(record))
        )
