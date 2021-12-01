from django.contrib.gis.db import models

from apps.utils.models import Base
from apps.users.models import User

SEXO_CHOICES = (
    (1, 'Macho'), (2, 'Hembra'),
)

OPCION_CHOICES = (
    (1, 'Perdido'), (2, 'En Adopción'),
)

TAMANHO_CHOICES = (
    (1, 'Pequeño'), (2, 'Mediano'), (3, 'Grande')
)

ESTERELIZACION_CHOICES = (
    (1, 'Si'), (2, 'No'),
)

SERVICE_CHOICES = (
    (1, 'Busco a mi Dueño'), (2, 'Busco a mi Mascota'), (3, 'Adopta una Mascota'),
)


class Especie(Base):
    nombre = models.CharField(max_length=255, unique=True)
    estado = models.BooleanField(default=True)

    class Meta:
        verbose_name = 'Tipo'
        verbose_name_plural = 'Tipos'

    def __str__(self):
        return self.nombre


class Tratamiento(Base):
    nombre = models.CharField(verbose_name='Comuna', max_length=255)
    descripcion = models.TextField(max_length=500)
    estado = models.BooleanField(default=True)

    class Meta:
        verbose_name = 'Tratamiento'
        verbose_name_plural = 'Tratamientos'

    def __str__(self):
        return self.nombre


class Animal(Base):
    nombre = models.CharField(verbose_name='Nombre Animal', max_length=255, unique=False)
    especie = models.ForeignKey(Especie, verbose_name='Especie', on_delete=models.CASCADE)
    adoptante = models.ForeignKey(User, verbose_name='Adoptante', on_delete=models.CASCADE, null=True)
    tratamiento = models.ManyToManyField(Tratamiento, verbose_name='Tratamientos', blank=True)
    fecha_nac = models.DateField(verbose_name='Fecha de Nacimiento Estimada', blank=True, null=True)
    sexo = models.IntegerField(verbose_name='Sexo', choices=SEXO_CHOICES, default=1)
    tamanho = models.IntegerField(verbose_name='Tamaño', choices=TAMANHO_CHOICES, default=1)
    peso = models.DecimalField(max_digits=10, decimal_places=2, null=True)
    descripcion = models.TextField(max_length=500)
    foto_perfil = models.ImageField(upload_to='animal', null=True)
    esterilizado = models.SmallIntegerField(verbose_name='Esterilizado', choices=ESTERELIZACION_CHOICES, default=1)
    fecha_lleg = models.DateField(verbose_name='Fecha de LLegada', blank=True, null=True)
    estado_animal = models.IntegerField(verbose_name='Estado Animal', choices=OPCION_CHOICES, default=1)
    estado = models.BooleanField(default=True)

    class Meta:
        verbose_name = 'Mascota'
        verbose_name_plural = 'Mascotas'

    def __str__(self):
        return '{} {} {} {} {}'.format(self.nombre, '/', self.especie, '/', str(self.esterilizado,))


class Comuna(Base):
    nombre = models.CharField(verbose_name='Comuna', max_length=255)
    estado = models.BooleanField(default=True)

    class Meta:
        verbose_name = 'Comuna'
        verbose_name_plural = 'Comunas'

    def __str__(self):
        return self.nombre


class Provincia(Base):
    nombre = models.CharField(verbose_name='Provincia', max_length=255)
    comunas = models.ManyToManyField(Comuna, verbose_name='Comunas', blank=True)
    estado = models.BooleanField(default=True)

    class Meta:
        verbose_name = 'Provincia'
        verbose_name_plural = 'Provincias'

    def __str__(self):
        return self.nombre


class Region(Base):
    nombre = models.CharField(max_length=255)
    provincias = models.ManyToManyField(Provincia, verbose_name='Provincias', blank=True)
    estado = models.BooleanField(default=True)

    class Meta:
        verbose_name = 'Region'
        verbose_name_plural = 'Regiones'

    def __str__(self):
        return self.nombre


class Servicio(Base):
    nombre = models.CharField(max_length=100,)
    descripcion = models.TextField(verbose_name='Descripcion', blank=True)
    estado = models.BooleanField(default=True)

    class Meta:
        verbose_name = 'Servicio'
        verbose_name_plural = 'Servicios'

    def __str__(self):
        return self.nombre


class Veterinaria(Base):
    nombre = models.CharField(max_length=255)
    servicios = models.ManyToManyField(Servicio, verbose_name='Servicios', blank=True)
    telefono = models.CharField(max_length=11, verbose_name='Teléfono', null=True)
    direccion = models.CharField(max_length=300, verbose_name='Dirección')
    comuna = models.ForeignKey(Comuna, verbose_name='Comuna donde se encuentra la Veterinaria', on_delete=models.CASCADE, null=True)
    geom = models.PointField(srid=32718, null=True, verbose_name='Ubicación de la Veterinaria')
    estado = models.BooleanField(default=True)

    class Meta:
        verbose_name = 'Veterinaria'
        verbose_name_plural = 'Veterinarias'

    def __str__(self):
        return self.nombre


class Publicacion(Base):
    nombre = models.CharField(max_length=255, verbose_name='Nombre y Apellido')
    email = models.EmailField('Correo electrónico', null=True, unique=True)
    telefono = models.CharField(max_length=11, verbose_name='Teléfono', null=True)
    direccion = models.CharField(max_length=300, verbose_name='Dirección del Suceso')
    fecha = models.DateField(verbose_name='Fecha del Suceso', blank=True, null=True)
    nombre_mascota = models.CharField(max_length=255)
    especie = models.ForeignKey(Especie, verbose_name='Especie', on_delete=models.CASCADE)
    tamanho = models.IntegerField(verbose_name='Tamaño', choices=TAMANHO_CHOICES)
    sexo = models.IntegerField(verbose_name='Sexo', choices=SEXO_CHOICES)
    microchip = models.IntegerField(verbose_name='Microchip', null=True)
    servicio = models.IntegerField(verbose_name='Servicio', choices=SERVICE_CHOICES)
    fotografia = models.ImageField(upload_to='publicacion', null=True)
    mensaje = models.TextField(max_length=500)
    estado = models.BooleanField(default=True)

    class Meta:
        verbose_name = 'Publicacion'
        verbose_name_plural = 'Publicaciones'

    def __str__(self):
        return '{} {} {} {} {}'.format(self.nombre, '/', self.nombre_mascota, '/', str(self.servicio,))
