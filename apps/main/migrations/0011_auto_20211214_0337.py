# Generated by Django 2.2.4 on 2021-12-14 06:37

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0010_publicacion_aprobado'),
    ]

    operations = [
        migrations.AlterField(
            model_name='publicacion',
            name='especie',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='main.Especie', verbose_name='Especie'),
        ),
    ]