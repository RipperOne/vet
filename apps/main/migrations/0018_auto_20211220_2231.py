# Generated by Django 2.2.4 on 2021-12-21 01:31

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0017_auto_20211219_2010'),
    ]

    operations = [
        migrations.AlterField(
            model_name='adopcion',
            name='email',
            field=models.EmailField(max_length=254, null=True, verbose_name='Correo electrónico'),
        ),
        migrations.AlterField(
            model_name='publicacion',
            name='email',
            field=models.EmailField(max_length=254, null=True, verbose_name='Correo electrónico'),
        ),
    ]
