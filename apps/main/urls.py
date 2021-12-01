from django.urls import path, include
from django.conf.urls import url
from django.contrib.gis import admin
from .views import (
    localidades, animal, views
)

app_name = 'main'

admin.autodiscover()

urlpatterns = [

    path('region/crear/', localidades.RegionCreateView.as_view(), name='region_create'),
    path('region/actualizar/<int:pk>/', localidades.RegionUpdateView.as_view(), name='region_update'),
    path('region/eliminar/<int:pk>/', localidades.RegionDeleteView.as_view(), name='region_delete'),
    path('region/', localidades.RegionListView.as_view(), name='region_list'),
    path('provincia/crear/', localidades.ProvinciaCreateView.as_view(), name='provincia_create'),
    path('provincia/actualizar/<int:pk>/', localidades.ProvinciaUpdateView.as_view(), name='provincia_update'),
    path('provincia/eliminar/<int:pk>/', localidades.ProvinciaDeleteView.as_view(), name='provincia_delete'),
    path('provincia/', localidades.ProvinciaListView.as_view(), name='provincia_list'),
    path('comuna/crear/', localidades.ComunaCreateView.as_view(), name='comuna_create'),
    path('comuna/actualizar/<int:pk>/', localidades.ComunaUpdateView.as_view(), name='comuna_update'),
    path('comuna/eliminar/<int:pk>/', localidades.ComunaDeleteView.as_view(), name='comuna_delete'),
    path('comuna/', localidades.ComunaListView.as_view(), name='comuna_list'),

    path('especie/crear/', animal.EspecieCreateView.as_view(), name='especie_create'),
    path('especie/actualizar/<int:pk>/', animal.EspecieUpdateView.as_view(), name='especie_update'),
    path('especie/eliminar/<int:pk>/', animal.EspecieDeleteView.as_view(), name='especie_delete'),
    path('especie/', animal.EspecieListView.as_view(), name='especie_list'),

    path('tratamiento/crear/', animal.TratamientoCreateView.as_view(), name='tratamiento_create'),
    path('tratamiento/actualizar/<int:pk>/', animal.TratamientoUpdateView.as_view(), name='tratamiento_update'),
    path('tratamiento/eliminar/<int:pk>/', animal.TratamientoDeleteView.as_view(), name='tratamiento_delete'),
    path('tratamiento/', animal.TratamientoListView.as_view(), name='tratamiento_list'),

    path('animal/crear/', animal.AnimalCreateView.as_view(), name='animal_create'),
    path('animal/actualizar/<int:pk>/', animal.AnimalUpdateView.as_view(), name='animal_update'),
    path('animal/eliminar/<int:pk>/', animal.AnimalDeleteView.as_view(), name='animal_delete'),
    path('animal/', animal.AnimalListView.as_view(), name='animal_list'),

    path('servicio/crear/', views.ServicioCreateView.as_view(), name='servicio_create'),
    path('servicio/actualizar/<int:pk>/', views.ServicioUpdateView.as_view(), name='servicio_update'),
    path('servicio/eliminar/<int:pk>/', views.ServicioDeleteView.as_view(), name='servicio_delete'),
    path('servicio/', views.ServicioListView.as_view(), name='servicio_list'),

    path('veterinaria/crear/', views.VeterinariaCreateView.as_view(), name='veterinaria_create'),
    path('veterinaria/actualizar/<int:pk>/', views.VeterinariaUpdateView.as_view(), name='veterinaria_update'),
    path('veterinaria/eliminar/<int:pk>/', views.VeterinariaDeleteView.as_view(), name='veterinaria_delete'),
    path('veterinaria/', views.VeterinariaListView.as_view(), name='veterinaria_list'),
    url(r'^veterinaria/SIG/map/$', views.VeterinariaSigMapa.as_view(), name='veterinaria_mapa'),
    url(r'^veterinaria/SIG/center/$', views.VeterinariaSigMapa.center, name='veterinaria_center'),
    url(r'^veterinaria/SIG/data/$', views.VeterinariaSigDatos.as_view(), name='veterinaria_datos'),
    url(r'^veterinaria/SIG/all/map/$', views.VeterinariasMapaAll.as_view(), name='veterinaria_mapa_all'),
    url(r'^veterinaria/SIG/all/data/$', views.VeterinariasDatosAll.as_view(), name='veterinaria_datos_all'),

    path('publicacion/crear/', views.PublicacionCreateView.as_view(), name='publicacion_create'),
    path('publicacion/actualizar/<int:pk>/', views.PublicacionUpdateView.as_view(), name='publicacion_update'),
    path('publicacion/eliminar/<int:pk>/', views.PublicacionDeleteView.as_view(), name='publicacion_delete'),
    path('publicacion/', views.PublicacionListView.as_view(), name='publicacion_list'),
]
