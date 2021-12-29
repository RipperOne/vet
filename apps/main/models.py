from django.contrib.gis.db import models

from apps.utils.models import Base
from apps.users.models import User
from django.core.validators import RegexValidator

alphanumeric = RegexValidator(r'^[A-Za-z\sáéíóú]+$', 'Ingresar solo Letras en el campo')
alphanumeric1 = RegexValidator(r'^[A-Za-z\sáéíóú01234567890]+$', 'Ingresar solo letras y numeros en el campo')
numeric = RegexValidator(r'^[0-9]+$', 'Ingresar solo numeros en el campo')
numeric1 = RegexValidator(r'^[0-9\,]+$', 'Este es un campo decimal. Debe ingresar numeros seguidos de una coma y 2 decimales')

SEXO_CHOICES = (
    ('Macho', 'Macho'), ('Hembra', 'Hembra'),
)

OPCION_CHOICES = (
    ('Perdido', 'Perdido'), ('En Adopción', 'En Adopción'), ('Adoptado', 'Adoptado')
)

TAMANHO_CHOICES = (
    ('Pequeño', 'Pequeño'), ('Mediano', 'Mediano'), ('Grande', 'Grande')
)

ESTERELIZACION_CHOICES = (
    ('Si', 'Si'), ('No', 'No'),
)

SERVICE_CHOICES = (
    ('Busco a mi Dueño', 'Busco a mi Dueño'), ('Busco a mi Mascota', 'Busco a mi Mascota'),
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


class Cuidados(Base):
    nombre = models.CharField(verbose_name='Cuidados', max_length=255)
    descripcion = models.TextField(max_length=500)
    estado = models.BooleanField(default=True)

    class Meta:
        verbose_name = 'Cuidado'
        verbose_name_plural = 'Cuidados'

    def __str__(self):
        return self.nombre


class Animal(Base):
    nombre = models.CharField(verbose_name='Nombre Animal', max_length=255, unique=False)
    especie = models.ForeignKey(Especie, verbose_name='Especie', on_delete=models.CASCADE, null=True, blank=True)
    adoptante = models.ForeignKey(User, verbose_name='Adoptante', on_delete=models.CASCADE, null=True, blank=True)
    tratamiento = models.ManyToManyField(Tratamiento, verbose_name='Tratamientos', blank=True)
    fecha_nac = models.DateField()
    sexo = models.CharField(max_length=50, verbose_name='Sexo', choices=SEXO_CHOICES, default=1)
    tamanho = models.CharField(max_length=50, verbose_name='Tamaño', choices=TAMANHO_CHOICES, default=1)
    peso = models.DecimalField(max_digits=10, decimal_places=2, null=True)
    descripcion = models.TextField(max_length=500)
    foto_perfil = models.ImageField(upload_to='animal', null=True, default='animal/sin-imagen.jpg')
    esterilizado = models.CharField(max_length=50, verbose_name='Esterilizado', choices=ESTERELIZACION_CHOICES)
    fecha_lleg = models.DateField()
    estado_animal = models.CharField(max_length=50, verbose_name='Estado Animal', choices=OPCION_CHOICES)
    estado = models.BooleanField(default=True)

    class Meta:
        verbose_name = 'Mascota'
        verbose_name_plural = 'Mascotas'

    def __str__(self):
        return '{} {} {} {} {} {}'.format('Nombre:', self.nombre, '| Especie:', self.especie, '| Esterilizado:', str(self.esterilizado,))


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
    telefono = models.CharField(validators=[numeric], max_length=9, verbose_name='Teléfono', null=True)
    direccion = models.CharField(max_length=300, verbose_name='Dirección')
    comuna = models.ForeignKey(Comuna, verbose_name='Comuna donde se encuentra la Veterinaria', on_delete=models.CASCADE, null=True, blank=True)
    imagen = models.ImageField(upload_to='veterinaria', null=True, default='veterinaria/sin-imagen.jpg')
    geom = models.PointField(srid=32718, null=True, verbose_name='Ubicación de la Veterinaria')
    estado = models.BooleanField(default=True)

    class Meta:
        verbose_name = 'Veterinaria'
        verbose_name_plural = 'Veterinarias'

    def __str__(self):
        return self.nombre


class Publicacion(Base):
    nombre = models.CharField(max_length=255, verbose_name='Nombre y Apellido', unique=False)
    email = models.EmailField('Correo electrónico', null=True, unique=False)
    telefono = models.CharField(verbose_name='Teléfono', null=True, validators=[numeric], max_length=9, unique=False)
    direccion = models.CharField(max_length=300, verbose_name='Dirección del Suceso', unique=False)
    fecha = models.DateField(verbose_name='Fecha del Suceso', blank=True, null=True, unique=False)
    nombre_mascota = models.CharField(max_length=255, unique=False)
    especie = models.ForeignKey(Especie, verbose_name='Especie', on_delete=models.CASCADE, null=True, blank=True)
    tamanho = models.CharField(max_length=50, verbose_name='Tamaño', choices=TAMANHO_CHOICES)
    sexo = models.CharField(max_length=50, verbose_name='Sexo', choices=SEXO_CHOICES)
    microchip = models.CharField(verbose_name='Microchip', null=True, validators=[numeric], max_length=15, unique=False, blank=True)
    servicio = models.CharField(max_length=50, verbose_name='Servicio', choices=SERVICE_CHOICES)
    fotografia = models.ImageField(upload_to='publicacion', null=True, default='publicacion/sin-imagen.jpg')
    mensaje = models.TextField(max_length=500)
    aprobado = models.BooleanField(default=False, null=True, blank=True)
    estado = models.BooleanField(default=True)

    class Meta:
        verbose_name = 'Publicacion'
        verbose_name_plural = 'Publicaciones'

    def __str__(self):
        return '{} {} {} {} {} {}'.format('Nombre: ', self.nombre, '| Mascota: ', self.nombre_mascota, '| Servicio: ', str(self.servicio,))


class Adopcion(Base):
    adoptante = models.ForeignKey(User, verbose_name='Adoptante', on_delete=models.CASCADE, null=True, blank=True, unique=False)
    email = models.EmailField('Correo electrónico', null=True, unique=False)
    telefono = models.CharField(verbose_name='Teléfono', null=True, validators=[numeric], max_length=9, unique=False)
    direccion = models.CharField(max_length=300, verbose_name='Dirección', unique=False)
    mascota = models.ForeignKey(Animal, verbose_name='Mascotas disponibles', on_delete=models.CASCADE, null=True, blank=True)
    mensaje = models.TextField(max_length=500, verbose_name='Déjenos un mensaje explicando su interés')
    aprobado = models.BooleanField(default=False)
    estado = models.BooleanField(default=True)

    class Meta:
        verbose_name = 'Adopcion'
        verbose_name_plural = 'Adopciones'

    def __str__(self):
        return '{} {} {} {} {} {}'.format('Adoptante: ', self.adoptante, '| Email: ', self.email, '| Mascota: ', str(self.mascota,))


class Galeria(Base):
    imagen = models.ImageField(upload_to='gallery', null=True, default='gallery/sin-imagen.jpg')
    estado = models.BooleanField(default=True)

    class Meta:
        verbose_name = 'Galeria'
        verbose_name_plural = 'Galerias'

    def __str__(self):
        return self.id
