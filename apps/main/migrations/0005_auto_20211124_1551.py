# Generated by Django 2.2.4 on 2021-11-24 18:51

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('main', '0004_veterinaria_telefono'),
    ]

    operations = [
        migrations.AddField(
            model_name='animal',
            name='adoptante',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='Adoptante'),
        ),
        migrations.CreateModel(
            name='Publicacion',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Creado el')),
                ('updated_at', models.DateTimeField(auto_now=True, verbose_name='Actualizado el')),
                ('nombre', models.CharField(max_length=255)),
                ('email', models.EmailField(max_length=254, null=True, unique=True, verbose_name='Correo electrónico')),
                ('telefono', models.CharField(max_length=11, null=True, verbose_name='Teléfono')),
                ('direccion', models.CharField(max_length=300, verbose_name='Dirección del Suceso')),
                ('fecha', models.DateField(blank=True, null=True, verbose_name='Fecha del Suceso')),
                ('nombre_mascota', models.CharField(max_length=255)),
                ('tamanho', models.IntegerField(choices=[(1, 'Pequeño'), (2, 'Mediano'), (3, 'Grande')], verbose_name='Tamaño')),
                ('sexo', models.IntegerField(choices=[(1, 'Macho'), (2, 'Hembra')], verbose_name='Sexo')),
                ('microchip', models.IntegerField(null=True, verbose_name='Microchip')),
                ('servicio', models.IntegerField(choices=[(1, 'Busco a mi Dueño'), (2, 'Busco a mi Mascota'), (3, 'Adopta una Mascota')], verbose_name='Servicio')),
                ('fotografia', models.ImageField(null=True, upload_to='publicacion')),
                ('mensaje', models.TextField(max_length=500)),
                ('estado', models.BooleanField(default=True)),
                ('especie', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='main.Especie', verbose_name='Especie')),
            ],
            options={
                'verbose_name': 'Publicacion',
                'verbose_name_plural': 'Publicaciones',
            },
        ),
    ]
