from django.contrib.gis import forms
from .models import *
from django.contrib.admin import widgets
from leaflet.forms.widgets import LeafletWidget


class EspecieForm(forms.ModelForm):
    class Meta:
        model = Especie
        fields = ('nombre',)


class TratamientoForm(forms.ModelForm):

    class Meta:
        model = Tratamiento
        fields = ('nombre', 'descripcion')


class CuidadosForm(forms.ModelForm):

    class Meta:
        model = Cuidados
        fields = ('nombre', 'descripcion')


class AnimalForm(forms.ModelForm):
    m2m_fields = ('#id_tratamiento',)
    search_fields = ('#id_especie',)

    class Meta:
        model = Animal
        fields = ('nombre', 'especie', 'adoptante', 'tratamiento', 'fecha_nac', 'sexo', 'tamanho', 'peso', 'descripcion',
                  'foto_perfil', 'esterilizado', 'fecha_lleg', 'estado_animal')
        widgets = {
            'fecha_nac': widgets.AdminDateWidget(),
            'fecha_lleg': widgets.AdminDateWidget(),
        }


class RegionForm(forms.ModelForm):
    m2m_fields = ('#id_provincias',)

    class Meta:
        model = Region
        fields = ('nombre', 'provincias')


class ProvinciaForm(forms.ModelForm):
    m2m_fields = ('#id_comunas',)

    class Meta:
        model = Provincia
        fields = ('nombre', 'comunas')


class ComunaForm(forms.ModelForm):

    class Meta:
        model = Comuna
        fields = ('nombre',)


class ServicioForm(forms.ModelForm):
    class Meta:
        model = Servicio
        fields = ('nombre', 'descripcion')


class VeterinariaForm(forms.ModelForm):
    m2m_fields = ('#id_servicios',)

    class Meta:
        model = Veterinaria
        fields = ('nombre', 'servicios', 'telefono', 'direccion', 'comuna', 'imagen', 'geom')
        widgets = {
            'geom': LeafletWidget(),
        }


class PublicacionForm(forms.ModelForm):
    fotografia = forms.ImageField(label='Fotografia', required=False)

    class Meta:
        model = Publicacion
        fields = ('nombre', 'email', 'telefono', 'direccion', 'fecha', 'nombre_mascota', 'especie', 'tamanho'
                  , 'sexo', 'microchip', 'servicio', 'fotografia', 'mensaje', 'aprobado')
        widgets = {
            'fecha': widgets.AdminDateWidget(),
        }


class AdopcionForm(forms.ModelForm):

    def __init__(self, *args, **kwargs):
        super(AdopcionForm, self).__init__(*args, **kwargs)
        self.fields['mascota'].queryset = Animal.objects.filter(adoptante__isnull=True)

    class Meta:
        model = Adopcion
        fields = ('adoptante', 'email', 'telefono', 'direccion', 'mascota', 'mensaje', 'aprobado')


# GALERIA

class GaleriaForm(forms.ModelForm):
    imagen = forms.ImageField(label='Imagen', required=True)

    class Meta:
        model = Galeria
        fields = ('imagen',)
