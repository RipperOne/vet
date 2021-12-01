from django.contrib.gis.db import models


class Base(models.Model):
    created_at = models.DateTimeField(verbose_name='Creado el', auto_now_add=True)
    updated_at = models.DateTimeField(verbose_name='Actualizado el', auto_now=True)

    class Meta:
        abstract = True
