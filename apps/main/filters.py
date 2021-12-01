import django_filters as filters

from . import models


class EspecieFilter(filters.FilterSet):
    class Meta:
        model = models.Especie
        fields = {
            'nombre': ['icontains'],
        }


class TratamientoFilter(filters.FilterSet):
    class Meta:
        model = models.Tratamiento
        fields = {
            'nombre': ['icontains'],
        }


class AnimalFilter(filters.FilterSet):
    class Meta:
        model = models.Animal
        fields = {
            'nombre': ['icontains'],
            'especie': ['exact'],
            'adoptante': ['exact'],
            'tratamiento': ['exact'],
            'fecha_nac': ['icontains'],
            'sexo': ['exact'],
            'tamanho': ['exact'],
            'esterilizado': ['exact'],
            'estado_animal': ['exact'],
        }


class RegionFilter(filters.FilterSet):
    class Meta:
        model = models.Region
        fields = {
            'nombre': ['icontains'],
            'provincias': ['exact'],
        }


class ProvinciaFilter(filters.FilterSet):
    class Meta:
        model = models.Provincia
        fields = {
            'nombre': ['icontains'],
            'comunas': ['exact'],
        }


class ComunaFilter(filters.FilterSet):
    class Meta:
        model = models.Comuna
        fields = {
            'nombre': ['icontains'],
        }


class ServicioFilter(filters.FilterSet):
    class Meta:
        model = models.Servicio
        fields = {
            'nombre': ['icontains'],
        }


class VeterinariaFilter(filters.FilterSet):
    class Meta:
        model = models.Veterinaria
        fields = {
            'nombre': ['icontains'],
            'servicios': ['exact'],
            'comuna': ['exact'],
        }


class PublicacionFilter(filters.FilterSet):
    class Meta:
        model = models.Publicacion
        fields = {
            'nombre': ['icontains'],
            'email': ['icontains'],
            'telefono': ['icontains'],
            'especie': ['exact'],
            'tamanho': ['exact'],
            'sexo': ['exact'],
            'microchip': ['exact'],
        }
