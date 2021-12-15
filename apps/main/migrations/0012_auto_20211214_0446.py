# Generated by Django 2.2.4 on 2021-12-14 07:46

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0011_auto_20211214_0337'),
    ]

    operations = [
        migrations.AlterField(
            model_name='adopcion',
            name='mascota',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='main.Animal', verbose_name='Mascotas disponibles'),
        ),
        migrations.AlterField(
            model_name='animal',
            name='adoptante',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='Adoptante'),
        ),
        migrations.AlterField(
            model_name='animal',
            name='especie',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='main.Especie', verbose_name='Especie'),
        ),
        migrations.AlterField(
            model_name='animal',
            name='estado_animal',
            field=models.CharField(choices=[('Perdido', 'Perdido'), ('En Adopción', 'En Adopción'), ('Adoptado', 'Adoptado')], max_length=50, verbose_name='Estado Animal'),
        ),
        migrations.AlterField(
            model_name='animal',
            name='fecha_lleg',
            field=models.DateField(blank=True, null=True, verbose_name='Fecha de Llegada'),
        ),
        migrations.AlterField(
            model_name='publicacion',
            name='especie',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='main.Especie', verbose_name='Especie'),
        ),
        migrations.AlterField(
            model_name='veterinaria',
            name='comuna',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='main.Comuna', verbose_name='Comuna donde se encuentra la Veterinaria'),
        ),
    ]