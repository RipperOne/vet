# Generated by Django 2.2.4 on 2021-12-12 08:20

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0008_auto_20211212_0316'),
    ]

    operations = [
        migrations.AddField(
            model_name='veterinaria',
            name='imagen',
            field=models.ImageField(null=True, upload_to='veterinaria'),
        ),
    ]
