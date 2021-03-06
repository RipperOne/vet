# Generated by Django 2.2.4 on 2021-12-27 23:00

import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0018_auto_20211220_2231'),
    ]

    operations = [
        migrations.AlterField(
            model_name='adopcion',
            name='telefono',
            field=models.CharField(max_length=9, null=True, validators=[django.core.validators.RegexValidator('^[0-9]+$', 'Ingresar solo numeros en el campo')], verbose_name='Teléfono'),
        ),
        migrations.AlterField(
            model_name='publicacion',
            name='microchip',
            field=models.CharField(max_length=15, null=True, validators=[django.core.validators.RegexValidator('^[0-9]+$', 'Ingresar solo numeros en el campo')], verbose_name='Microchip'),
        ),
        migrations.AlterField(
            model_name='publicacion',
            name='telefono',
            field=models.CharField(max_length=9, null=True, validators=[django.core.validators.RegexValidator('^[0-9]+$', 'Ingresar solo numeros en el campo')], verbose_name='Teléfono'),
        ),
        migrations.AlterField(
            model_name='veterinaria',
            name='telefono',
            field=models.CharField(max_length=9, null=True, validators=[django.core.validators.RegexValidator('^[0-9]+$', 'Ingresar solo numeros en el campo')], verbose_name='Teléfono'),
        ),
    ]
