from django.contrib.gis import forms
from . import models
from django.contrib.admin.widgets import AdminDateWidget
from leaflet.forms.widgets import LeafletWidget


class EspecieForm(forms.ModelForm):
    class Meta:
        model = models.Especie
        fields = ('nombre',)


class TratamientoForm(forms.ModelForm):

    class Meta:
        model = models.Tratamiento
        fields = ('nombre', 'descripcion')


class CuidadosForm(forms.ModelForm):

    class Meta:
        model = models.Cuidados
        fields = ('nombre', 'descripcion')


class AnimalForm(forms.ModelForm):
    m2m_fields = ('#id_tratamiento',)
    search_fields = ('#id_especie',)

    class Meta:
        model = models.Animal
        fields = ('nombre', 'especie', 'adoptante', 'tratamiento', 'fecha_nac', 'sexo', 'tamanho', 'peso', 'descripcion',
                  'foto_perfil', 'esterilizado', 'fecha_lleg', 'estado_animal')
        widgets = {
            'fecha_nac': AdminDateWidget(),
            'fecha_lleg': AdminDateWidget(),
        }


class RegionForm(forms.ModelForm):
    m2m_fields = ('#id_provincias',)

    class Meta:
        model = models.Region
        fields = ('nombre', 'provincias')


class ProvinciaForm(forms.ModelForm):
    m2m_fields = ('#id_comunas',)

    class Meta:
        model = models.Provincia
        fields = ('nombre', 'comunas')


class ComunaForm(forms.ModelForm):

    class Meta:
        model = models.Comuna
        fields = ('nombre',)


class ServicioForm(forms.ModelForm):
    class Meta:
        model = models.Servicio
        fields = ('nombre', 'descripcion')


class VeterinariaForm(forms.ModelForm):
    m2m_fields = ('#id_servicios',)

    class Meta:
        model = models.Veterinaria
        fields = ('nombre', 'servicios', 'telefono', 'direccion', 'comuna', 'geom')
        widgets = {
            'geom': LeafletWidget(),
        }


class PublicacionForm(forms.ModelForm):

    class Meta:
        model = models.Publicacion
        fields = ('nombre', 'email', 'telefono', 'direccion', 'fecha', 'nombre_mascota', 'especie', 'tamanho'
                  , 'sexo', 'microchip', 'servicio', 'fotografia', 'mensaje')
        widgets = {
            'fecha': AdminDateWidget(),
        }


class AdopcionForm(forms.ModelForm):

    class Meta:
        model = models.Adopcion
        fields = ('nombre', 'email', 'telefono', 'direccion', 'mascota', 'mensaje')
        widgets = {
            'fecha': AdminDateWidget(),
        }
