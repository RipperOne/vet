import csv

from django.core.management.base import AppCommand
from django.db import connection
from django.db.models.fields.related import (
    ManyToOneRel, ManyToManyRel, ManyToManyField,
)


class Command(AppCommand):
    def handle_app_config(self, app_config, **options):
        fieldnames = ['Tabla', 'Columnas', 'Tipo de dato']
        with open('%s_models.csv' % app_config.label, 'w') as out:
            writer = csv.DictWriter(out, fieldnames=fieldnames)
            writer.writeheader()
            for model in app_config.get_models(include_auto_created=True):
                # writer.writerow({
                #     'Tabla': model._meta.verbose_name,
                # })
                for i, f in enumerate(p for p in model._meta.get_fields()
                                      if not isinstance(p, (ManyToOneRel,
                                                            ManyToManyField,
                                                            ManyToManyRel))):
                    t = f.db_type(connection) or ('!' + str(type(f)))
                    data = {
                        'Columnas': f.name,
                        'Tipo de dato': t,
                    }
                    if i == 0:
                        data['Tabla'] = model._meta.verbose_name
                    writer.writerow(data)
                writer.writerow({})
                for i, f in enumerate(p for p in model._meta.get_fields()
                                      if isinstance(p, ManyToManyField)):
                    writer.writerow({
                        'Columnas': f.db_table or f.m2m_db_table() or str(f.__dict__),
                        # 'Descripcion': getattr(f, 'verbose_name', ''),
                    })
