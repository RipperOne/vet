import django_tables2 as tables
from apps.utils.tables import ModelTable, LIST_SEPARATOR
from . import models
from django.utils.safestring import mark_safe, SafeText
from django.urls import reverse, reverse_lazy


class EspecieTable(ModelTable):

    class Meta:
        model = models.Especie
        sequence = ('id', 'nombre', 'created_at', 'updated_at')
        exclude = ('estado',)

    update_url = 'main:especie_update'
    delete_url = 'main:especie_delete'


class TratamientoTable(ModelTable):

    class Meta:
        model = models.Tratamiento
        sequence = ('id', 'nombre', 'descripcion', 'created_at', 'updated_at')
        exclude = ('estado',)

    update_url = 'main:tratamiento_update'
    delete_url = 'main:tratamiento_delete'


class AnimalTable(ModelTable):
    tratamiento = tables.ManyToManyColumn(transform=lambda obj: obj.nombre, separator=LIST_SEPARATOR)

    class Meta:
        model = models.Animal
        sequence = ('id', 'nombre', 'especie', 'adoptante', 'tratamiento', 'fecha_nac', 'sexo', 'tamanho', 'peso',
                    'descripcion', 'foto_perfil', 'esterilizado', 'fecha_lleg', 'estado_animal', 'created_at',
                    'updated_at')
        exclude = ('estado',)

    update_url = 'main:animal_update'
    delete_url = 'main:animal_delete'


class RegionTable(ModelTable):
    provincias = tables.ManyToManyColumn(transform=lambda obj: obj.nombre, separator=LIST_SEPARATOR)

    class Meta:
        model = models.Region
        sequence = ('id', 'nombre', 'provincias', 'created_at', 'updated_at')
        exclude = ('estado',)

    update_url = 'main:region_update'
    delete_url = 'main:region_delete'


class ProvinciaTable(ModelTable):
    comunas = tables.ManyToManyColumn(transform=lambda obj: obj.nombre, separator=LIST_SEPARATOR)

    class Meta:
        model = models.Provincia
        sequence = ('id', 'nombre', 'comunas', 'created_at', 'updated_at')
        exclude = ('estado',)

    update_url = 'main:provincia_update'
    delete_url = 'main:provincia_delete'


class ComunaTable(ModelTable):

    class Meta:
        model = models.Comuna
        sequence = ('id', 'nombre', 'created_at', 'updated_at')
        exclude = ('estado',)

    update_url = 'main:comuna_update'
    delete_url = 'main:comuna_delete'


class ServicioTable(ModelTable):

    class Meta:
        model = models.Servicio
        sequence = ('id', 'nombre', 'descripcion', 'created_at', 'updated_at')
        exclude = ('estado',)

    update_url = 'main:servicio_update'
    delete_url = 'main:servicio_delete'


class VeterinariaTable(ModelTable):
    servicios = tables.ManyToManyColumn(transform=lambda obj: obj.nombre, separator=LIST_SEPARATOR)

    options = tables.Column(verbose_name='Opciones',
                            orderable=False,
                            empty_values=(),
                            attrs={
                                'td': {'class': 'text-center'},
                                'th': {"class": "text-center col-md-2"}})

    class Meta:
        model = models.Veterinaria
        template = 'django_tables2/bootstrap.html'
        sequence = ('id', 'nombre', 'servicios', 'telefono', 'direccion', 'comuna', 'created_at', 'updated_at')
        exclude = ('geom', 'estado',)

    def __init__(self, *args, **kwargs):
        super(VeterinariaTable, self).__init__(*args, **kwargs)
        self.edit_text = 'Editar'
        self.delete_text = 'Eliminar'
        self.options = 'Mostrar Mapa'

    def render_options(self, value, record):
        return mark_safe(
            '''
            <div class="btn-group-vertical">
            <a href="{0}" class="btn btn-sm btn-success tooltip-link"
                data-original-title="{1}">
                <i class="glyphicon glyphicon-pencil"></i> {1}
            </a>
            <a href="{2}" class="btn btn-sm btn-danger tooltip-link"
                data-original-title="{3}">
                <i class="glyphicon glyphicon-remove"></i> {3}
            </a>
            <a href="{4}" class="btn btn-sm btn-primary tooltip-link"
                data-original-title="{5}">
                <i class="glyphicon glyphicon-globe"></i> {5}
            </a>
            </div>
            '''.format(
                reverse_lazy('main:veterinaria_update', kwargs={'pk': record.pk}),
                'Editar',
                reverse_lazy('main:veterinaria_delete', kwargs={'pk': record.pk}),
                'Eliminar',
                reverse_lazy('main:veterinaria_mapa') + str('?pk=') + str(record.pk),
                'Mostrar Mapa'
            )
        )


class PublicacionTable(ModelTable):

    class Meta:
        model = models.Publicacion
        sequence = ('id', 'nombre', 'email', 'telefono', 'direccion', 'fecha', 'nombre_mascota', 'especie', 'tamanho',
                    'sexo', 'microchip', 'servicio', 'fotografia', 'mensaje', 'created_at', 'updated_at')
        exclude = ('estado',)

    update_url = 'main:publicacion_update'
    delete_url = 'main:publicacion_delete'
