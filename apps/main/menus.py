from django.urls import reverse
from menu import Menu, MenuItem


localidades = [
    MenuItem('Regiones',
             reverse('main:region_list'),
             check=lambda request: request.user.has_perm('main.view_region'),
             icon='fa fa-globe'),
    MenuItem('Provincias',
             reverse('main:provincia_list'),
             check=lambda request: request.user.has_perm('main.view_provincia'),
             icon='fa fa-globe'),
    MenuItem('Comunas',
             reverse('main:comuna_list'),
             check=lambda request: request.user.has_perm('main.view_comuna'),
             icon='fa fa-globe'),
]

animal = [
    MenuItem('Animal',
             reverse('main:animal_list'),
             check=lambda request: request.user.has_perm('main.view_animal'),
             icon='fa fa-leaf'),
    MenuItem('Especie',
             reverse('main:especie_list'),
             check=lambda request: request.user.has_perm('main.view_especie'),
             icon='fa fa-leaf'),
    MenuItem('Tratamiento',
             reverse('main:tratamiento_list'),
             check=lambda request: request.user.has_perm('main.view_tratamiento'),
             icon='fa fa-leaf'),
    MenuItem('Cuidados',
             reverse('main:cuidados_list'),
             check=lambda request: request.user.has_perm('main.view_cuidados'),
             icon='fa fa-leaf'),
    MenuItem('Adopcion',
             reverse('main:adopcion_list'),
             check=lambda request: request.user.has_perm('main.view_adopcion'),
             icon='fa fa-leaf'),
]

Menu.add_item('main', MenuItem('Animal', '#', weight=900, icon='fa fa-globe', children=animal))
Menu.add_item('main', MenuItem('Localidades', '#', weight=1000, icon='fa fa-map-marker', children=localidades))
Menu.add_item('main', MenuItem('Servicios', reverse('main:servicio_list'), weight=1100, icon='fa fa-tree'))
Menu.add_item('main', MenuItem('Veterinarias', reverse('main:veterinaria_list'), weight=1100, icon='fa fa-tree'))
Menu.add_item('main', MenuItem('Publicaciones', reverse('main:publicacion_list'), weight=1100, icon='fa fa-tree'))
