from django.contrib import admin
from .models import *

# Register your models here.


class ComunaAdmin(admin.ModelAdmin):
    model = Comuna


class ProvinciaAdmin(admin.ModelAdmin):
    model = Provincia


class RegionAdmin(admin.ModelAdmin):
    model = Region


class EspecieAdmin(admin.ModelAdmin):
    model = Especie


class TratamientoAdmin(admin.ModelAdmin):
    model = Tratamiento


class CuidadosAdmin(admin.ModelAdmin):
    model = Cuidados


class AnimalAdmin(admin.ModelAdmin):
    model = Animal


class ServicioAdmin(admin.ModelAdmin):
    model = Servicio


class VeterinariaAdmin(admin.ModelAdmin):
    model = Veterinaria


class PublicacionAdmin(admin.ModelAdmin):
    model = Publicacion


class AdopcionAdmin(admin.ModelAdmin):
    model = Adopcion


class GaleriaAdmin(admin.ModelAdmin):
    model = Galeria


admin.site.register(Comuna, ComunaAdmin),
admin.site.register(Provincia, ProvinciaAdmin),
admin.site.register(Region, RegionAdmin),
admin.site.register(Especie, EspecieAdmin),
admin.site.register(Tratamiento, TratamientoAdmin),
admin.site.register(Cuidados, CuidadosAdmin),
admin.site.register(Animal, AnimalAdmin),
admin.site.register(Servicio, ServicioAdmin),
admin.site.register(Veterinaria, VeterinariaAdmin),
admin.site.register(Publicacion, PublicacionAdmin),
admin.site.register(Adopcion, AdopcionAdmin),
admin.site.register(Galeria, GaleriaAdmin),
