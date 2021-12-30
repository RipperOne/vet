from django.shortcuts import render, reverse, redirect
from django.urls import reverse_lazy
from django.http import HttpResponseRedirect, HttpResponseNotFound, HttpResponse
from django.contrib.auth.mixins import LoginRequiredMixin, PermissionRequiredMixin
from django.contrib import messages
from reportlab.lib.units import cm

from apps.utils.views import ListView, CreateView, UpdateView, DeleteView
from django.views.generic import View
from apps.main.models import Animal, Especie, Tratamiento, Cuidados, Adopcion, Galeria
from apps.main.tables import AnimalTable, EspecieTable, TratamientoTable, CuidadosTable, AdopcionTable, GaleriaTable
from apps.main.filters import AnimalFilter, EspecieFilter, TratamientoFilter, CuidadosFilter, AdopcionFilter, GaleriaFilter
from apps.main.forms import AnimalForm, EspecieForm, TratamientoForm, CuidadosForm, AdopcionForm, GaleriaForm
from reportlab.lib import colors
from reportlab.lib.pagesizes import letter
from reportlab.platypus import Table, TableStyle
from reportlab.pdfgen import canvas
from django.conf import settings
from io import BytesIO

from django.contrib.auth import get_user_model

User = get_user_model()


class EspecieListView(ListView, LoginRequiredMixin, PermissionRequiredMixin):
    table_class = EspecieTable
    filterset_class = EspecieFilter
    model = Especie
    add_permission = 'main.add_especie'
    add_url = reverse_lazy('main:especie_create')
    change_permission = 'main.change_especie'
    delete_permission = 'main.delete_especie'
    ordering = ['id']

    def get_queryset(self):
        return Especie.objects.get_queryset().order_by('id').filter(estado=True)

    def get_context_data(self, **kwargs):
        context = super(EspecieListView, self).get_context_data(**kwargs)
        return context


class EspecieCreateView(CreateView, LoginRequiredMixin, PermissionRequiredMixin):
    model = Especie
    form_class = EspecieForm
    back_url = reverse_lazy('main:especie_list')


class EspecieUpdateView(UpdateView, LoginRequiredMixin, PermissionRequiredMixin):
    model = Especie
    form_class = EspecieForm
    back_url = reverse_lazy('main:especie_list')


class EspecieDeleteView(DeleteView, LoginRequiredMixin, PermissionRequiredMixin):
    model = Especie
    success_message = 'Especie eliminada exitosamente'

    def delete(self, request, *args, **kwargs):
        pk = self.kwargs['pk']
        try:
            especie = Especie.objects.get(id=pk)
        except Especie.DoesNotExist:
            return HttpResponseNotFound()

        if request.method == "GET":
            return render(request, "generic/confirm_delete.html", {'especie': especie})
        elif request.method == "POST":
            if request.POST["confirm"] == "1":
                especie.estado = False
                especie.save()
                messages.success(self.request, self.success_message)
            return HttpResponseRedirect('/vet/especie/')


class TratamientoListView(ListView, LoginRequiredMixin, PermissionRequiredMixin):
    table_class = TratamientoTable
    filterset_class = TratamientoFilter
    model = Tratamiento
    add_permission = 'main.add_tratamiento'
    add_url = reverse_lazy('main:tratamiento_create')
    change_permission = 'main.change_tratamiento'
    delete_permission = 'main.delete_tratamiento'
    ordering = ['id']

    def get_queryset(self):
        return Tratamiento.objects.get_queryset().order_by('id').filter(estado=True)

    def get_context_data(self, **kwargs):
        context = super(TratamientoListView, self).get_context_data(**kwargs)
        return context


class TratamientoCreateView(CreateView, LoginRequiredMixin, PermissionRequiredMixin):
    model = Tratamiento
    form_class = TratamientoForm
    back_url = reverse_lazy('main:tratamiento_list')


class TratamientoUpdateView(UpdateView, LoginRequiredMixin, PermissionRequiredMixin):
    model = Tratamiento
    form_class = TratamientoForm
    back_url = reverse_lazy('main:tratamiento_list')


class TratamientoDeleteView(DeleteView, LoginRequiredMixin, PermissionRequiredMixin):
    model = Tratamiento
    success_message = 'Tratamiento eliminado exitosamente'

    def delete(self, request, *args, **kwargs):
        pk = self.kwargs['pk']
        try:
            tratamiento = Tratamiento.objects.get(id=pk)
        except Tratamiento.DoesNotExist:
            return HttpResponseNotFound()

        if request.method == "GET":
            return render(request, "generic/confirm_delete.html", {'tratamiento': tratamiento})
        elif request.method == "POST":
            if request.POST["confirm"] == "1":
                tratamiento.estado = False
                tratamiento.save()
                messages.success(self.request, self.success_message)
            return HttpResponseRedirect('/vet/tratamiento/')


class CuidadosListView(ListView, LoginRequiredMixin, PermissionRequiredMixin):
    table_class = CuidadosTable
    filterset_class = CuidadosFilter
    model = Cuidados
    add_permission = 'main.add_cuidados'
    add_url = reverse_lazy('main:cuidados_create')
    change_permission = 'main.change_cuidados'
    delete_permission = 'main.delete_cuidados'
    ordering = ['id']

    def get_queryset(self):
        return Cuidados.objects.get_queryset().order_by('id').filter(estado=True)

    def get_context_data(self, **kwargs):
        context = super(CuidadosListView, self).get_context_data(**kwargs)
        return context


class CuidadosCreateView(CreateView, LoginRequiredMixin, PermissionRequiredMixin):
    model = Cuidados
    form_class = CuidadosForm
    back_url = reverse_lazy('main:cuidados_list')


class CuidadosUpdateView(UpdateView, LoginRequiredMixin, PermissionRequiredMixin):
    model = Cuidados
    form_class = CuidadosForm
    back_url = reverse_lazy('main:cuidados_list')


class CuidadosDeleteView(DeleteView, LoginRequiredMixin, PermissionRequiredMixin):
    model = Cuidados
    success_message = 'Cuidado eliminado exitosamente'

    def delete(self, request, *args, **kwargs):
        pk = self.kwargs['pk']
        try:
            cuidados = Cuidados.objects.get(id=pk)
        except Cuidados.DoesNotExist:
            return HttpResponseNotFound()

        if request.method == "GET":
            return render(request, "generic/confirm_delete.html", {'cuidados': cuidados})
        elif request.method == "POST":
            if request.POST["confirm"] == "1":
                cuidados.estado = False
                cuidados.save()
                messages.success(self.request, self.success_message)
            return HttpResponseRedirect('/vet/cuidados/')


class AnimalListView(ListView, LoginRequiredMixin, PermissionRequiredMixin):
    table_class = AnimalTable
    filterset_class = AnimalFilter
    model = Animal
    add_permission = 'main.add_animal'
    add_url = reverse_lazy('main:animal_create')
    change_permission = 'main.change_animal'
    delete_permission = 'main.delete_animal'
    ordering = ['id']

    def get_queryset(self):
        return Animal.objects.get_queryset().order_by('id').filter(estado=True)

    def get_context_data(self, **kwargs):
        context = super(AnimalListView, self).get_context_data(**kwargs)
        return context


class AnimalCreateView(CreateView, LoginRequiredMixin, PermissionRequiredMixin):
    model = Animal
    form_class = AnimalForm
    back_url = reverse_lazy('main:animal_list')


class AnimalUpdateView(UpdateView, LoginRequiredMixin, PermissionRequiredMixin):
    model = Animal
    form_class = AnimalForm
    back_url = reverse_lazy('main:animal_list')


class AnimalDeleteView(DeleteView, LoginRequiredMixin, PermissionRequiredMixin):
    model = Animal
    success_message = 'Animal eliminado exitosamente'

    def delete(self, request, *args, **kwargs):
        pk = self.kwargs['pk']
        try:
            animal = Animal.objects.get(id=pk)
        except Animal.DoesNotExist:
            return HttpResponseNotFound()

        if request.method == "GET":
            return render(request, "generic/confirm_delete.html", {'animal': animal})
        elif request.method == "POST":
            if request.POST["confirm"] == "1":
                animal.estado = False
                animal.save()
                messages.success(self.request, self.success_message)
            return HttpResponseRedirect('/vet/animal/')


class AdopcionListView(ListView, LoginRequiredMixin, PermissionRequiredMixin):
    table_class = AdopcionTable
    filterset_class = AdopcionFilter
    model = Adopcion
    add_permission = 'main.add_adopcion'
    add_url = reverse_lazy('main:adopcion_create')
    change_permission = 'main.change_adopcion'
    delete_permission = 'main.delete_adopcion'
    ordering = ['id']

    def get_queryset(self):
        id_ = self.request.user.id
        if self.request.user.is_superuser:
            return Adopcion.objects.get_queryset().order_by('id').filter(estado=True)
        return Adopcion.objects.get_queryset().filter(adoptante=id_, aprobado=True).order_by('id')

    def get_context_data(self, **kwargs):
        context = super(AdopcionListView, self).get_context_data(**kwargs)
        return context


class AdopcionCreateView(CreateView, LoginRequiredMixin, PermissionRequiredMixin):
    model = Adopcion
    form_class = AdopcionForm
    back_url = reverse_lazy('main:adopcion_list')


class AdopcionUpdateView(UpdateView, LoginRequiredMixin, PermissionRequiredMixin):
    model = Adopcion
    form_class = AdopcionForm
    back_url = reverse_lazy('main:adopcion_list')


class AdopcionDeleteView(DeleteView, LoginRequiredMixin, PermissionRequiredMixin):
    model = Adopcion
    success_message = 'Adopcion eliminada exitosamente'

    def delete(self, request, *args, **kwargs):
        pk = self.kwargs['pk']
        try:
            adopcion = Adopcion.objects.get(id=pk)
        except Adopcion.DoesNotExist:
            return HttpResponseNotFound()

        if request.method == "GET":
            return render(request, "generic/confirm_delete.html", {'adopcion': adopcion})
        elif request.method == "POST":
            if request.POST["confirm"] == "1":
                adopcion.estado = False
                adopcion.save()
                messages.success(self.request, self.success_message)
            return HttpResponseRedirect('/vet/adopcion/')


# GALERIA

class GaleriaListView(ListView, LoginRequiredMixin, PermissionRequiredMixin):
    table_class = GaleriaTable
    filterset_class = GaleriaFilter
    model = Galeria
    required_permissions = 'main.view_galeria'
    add_permission = 'main.add_galeria'
    add_url = reverse_lazy('main:galeria_create')
    change_permission = 'main.change_galeria'
    delete_permission = 'main.delete_galeria'
    ordering = ['id']

    def get_queryset(self):
        return Galeria.objects.get_queryset().order_by('id').filter(estado=True)

    def get_context_data(self, **kwargs):
        context = super(GaleriaListView, self).get_context_data(**kwargs)
        return context


class GaleriaCreateView(CreateView, LoginRequiredMixin, PermissionRequiredMixin):
    model = Galeria
    form_class = GaleriaForm
    required_permissions = 'main.add_galeria'
    back_url = reverse_lazy('main:galeria_list')


class GaleriaUpdateView(UpdateView, LoginRequiredMixin, PermissionRequiredMixin):
    model = Galeria
    form_class = GaleriaForm
    required_permissions = 'main.change_galeria'
    back_url = reverse_lazy('main:galeria_list')


class GaleriaDeleteView(DeleteView, LoginRequiredMixin, PermissionRequiredMixin):
    model = Galeria
    required_permissions = ('main.delete_galeria',)
    success_message = 'Foto eliminada exitosamente'

    def delete(self, request, *args, **kwargs):
        pk = self.kwargs['pk']
        try:
            galeria = Galeria.objects.get(id=pk)
        except Galeria.DoesNotExist:
            return HttpResponseNotFound()

        if request.method == "GET":
            return render(request, "generic/confirm_delete.html", {'galeria': galeria})
        elif request.method == "POST":
            if request.POST["confirm"] == "1":
                galeria.estado = False
                galeria.save()
                messages.success(self.request, self.success_message)
            return HttpResponseRedirect('/vet/galeria/')


class AdopcionContrato(PermissionRequiredMixin, LoginRequiredMixin, View):
    permission_required = ('main.view_adopcion',)

    def cabecera(self, pdf):
        imagen = settings.MEDIA_ROOT + '/favicon.png'
        pdf.drawImage(imagen, 10, 700, 120, 90, preserveAspectRatio=True)
        pdf.setFont("Helvetica", 16)
        pdf.drawString(160, 750, u"CONTRATO DE ADOPCION")
        pdf.setFont("Helvetica", 14)
        pdf.drawString(120, 735, u"ADOPCION DE MASCOTAS HUELLITASAPP")
        pdf.setFont("Helvetica", 10)
        pdf.drawString(220, 720, u"INACAP")

    def get(self, request, *args, **kwargs):
        response = HttpResponse(content_type='application/pdf')
        # response['Content-Disposition']='attachment; filename="%s"'
        buffer = BytesIO()
        pdf = canvas.Canvas(buffer)
        self.cabecera(pdf)
        y = 800
        self.tabla(pdf, y)
        pdf.showPage()
        pdf.save()
        pdf = buffer.getvalue()
        buffer.close()
        response.write(pdf)
        return response

    def tabla(self, pdf, y):
        pk = self.kwargs.get('pk', 0)
        pk1 = Adopcion.objects.get(id=pk)
        usuario = pk1.adoptante

        Adopcion1 = Adopcion

        encabezadosF = ('N°', 'Fecha', '', '')

        detallesF = [(pk1.id, pk1.updated_at)

                    for Adopcion1 in Adopcion1.objects.filter(id=pk, estado=True)]

        detalle_ordenF = Table([encabezadosF] + detallesF, colWidths=[1 * cm, 5 * cm, 0 * cm, 0 * cm])

        detalle_ordenF.setStyle(TableStyle(
            [
                ('ALIGN', (0, 0), (0, 0), 'CENTER'),
                ('GRID', (0, 0), (12, -1), 0.5, colors.darkolivegreen),
                ('FONTSIZE', (0, 0), (-1, -1), 8),
            ]
        ))

        pdf.setFont("Helvetica", 11)
        pdf.drawString(30, 680, u"1 TIPO DE SOLICITUD:             CONTRATO DE ADOPCION")

        pdf.setFont("Helvetica", 11)
        pdf.drawString(30, 660, u"2 INTERESADO/A")

        User1 = User

        encabezados1 = ('Usuario:', 'Primer Nombre:', 'Apellido:', '', '', '')

        detalles1 = [(User1.username, User1.first_name, User1.last_name)

                    for User1 in User1.objects.filter(id=usuario.id)]

        detalle_orden1 = Table([encabezados1] + detalles1, colWidths=[5 * cm, 7.5 * cm, 7.5 * cm, 0 * cm, 0 * cm, 0 * cm])

        detalle_orden1.setStyle(TableStyle(
            [
                ('ALIGN', (0, 0), (3, 0), 'LEFT'),
                ('GRID', (0, 0), (14, -1), 0.5, colors.black),
                ('BACKGROUND', (0, 0), (-1, 0), colors.lightslategray),
                ('FONTSIZE', (0, 0), (-1, -1), 10),

            ]
        ))

        encabezados11 = ('Email:', 'Telefono:', 'Dirección:', '')

        detalles11 = [(Adopcion1.email, Adopcion1.telefono, Adopcion1.direccion)

                      for Adopcion1 in Adopcion1.objects.filter(id=pk, estado=True)]

        detalle_orden11 = Table([encabezados11] + detalles11, colWidths=[5 * cm, 5 * cm, 10 * cm, 0 * cm])

        detalle_orden11.setStyle(TableStyle(
            [
                ('ALIGN', (0, 0), (3, 0), 'LEFT'),
                ('GRID', (0, 0), (14, -1), 0.5, colors.black),
                ('BACKGROUND', (0, 0), (-1, 0), colors.lightslategray),
                ('FONTSIZE', (0, 0), (-1, -1), 10),

            ]
        ))
        Animal1 = Animal

        print(pk)
        print(pk1)
        print(usuario.first_name)
        print(pk1.mascota.id)
        prueba = Animal.objects.filter(id=pk1.mascota.id)
        print(prueba)

        pdf.setFont("Helvetica", 11)
        pdf.drawString(30, 560, u"3 MASCOTA")

        encabezados111 = ('Mascota:', 'Especie:', 'Fecha Nacimiento:', '')

        detalles111 = [(Animal1.nombre, Animal1.especie, Animal1.fecha_nac)

                       for Animal1 in Animal1.objects.filter(id=pk1.mascota.id)]

        detalle_orden111 = Table([encabezados111] + detalles111, colWidths=[5 * cm, 5 * cm, 10 * cm, 0 * cm])

        detalle_orden111.setStyle(TableStyle(
            [
                ('ALIGN', (0, 0), (3, 0), 'LEFT'),
                ('GRID', (0, 0), (14, -1), 0.5, colors.black),
                ('BACKGROUND', (0, 0), (-1, 0), colors.lightslategray),
                ('FONTSIZE', (0, 0), (-1, -1), 10),

            ]
        ))

        encabezados1111 = ('Sexo:', 'Tamaño:', 'Peso:', 'Esterilizado:')

        detalles1111 = [(Animal1.sexo, Animal1.tamanho, Animal1.peso, Animal1.esterilizado)

                       for Animal1 in Animal1.objects.filter(id=pk1.mascota.id)]

        detalle_orden1111 = Table([encabezados1111] + detalles1111, colWidths=[5 * cm, 5 * cm, 5 * cm, 5 * cm])

        detalle_orden1111.setStyle(TableStyle(
            [
                ('ALIGN', (0, 0), (3, 0), 'LEFT'),
                ('GRID', (0, 0), (14, -1), 0.5, colors.black),
                ('BACKGROUND', (0, 0), (-1, 0), colors.lightslategray),
                ('FONTSIZE', (0, 0), (-1, -1), 10),

            ]
        ))
        imagen = settings.MEDIA_ROOT + '/favicon.png'

        pdf.setFont("Helvetica", 11)
        pdf.drawString(30, 450, u"En Chillán, a: " + str(pk1.created_at) + ", entre don/ña: " + str(pk1.adoptante.first_name) + " " +str(pk1.adoptante.last_name) + ", con domicilio en: ")
        pdf.drawString(30, 438, u""+ str(pk1.direccion) + ", en adelante 'El Adoptante' y HuellitasAPP, han acordado este contrato de adopción")
        pdf.drawString(30, 426, u"de la mascota: " + str(pk1.mascota.nombre) + ".")
        pdf.drawString(30, 414, u"El Adoptante y HuellitasAPP, reconociendose mutuamente capacidad legal suficiente para contratar y obligarse")
        pdf.drawString(30, 402, u"en representación que actúan, y siendo responsables de la veracidad de sus manifestaciones, han convenido el ")
        pdf.drawString(30, 390, u"siguiente contrato de adopción:")
        pdf.drawString(30, 370, u"1.- OBJETO DEL CONTRATO.")
        pdf.drawString(30, 350, u"Por medio del presente instrumento las Partes acuerdan celebrar un contrato de adopcion, en virtud del cual")
        pdf.drawString(30, 338, u"HuellitasApp entrega a " + str(pk1.adoptante.first_name) + " " +str(pk1.adoptante.last_name) + " la custodia total de la mascota "+ str(pk1.mascota.nombre) + ", quien se compromete al cuidado total,")
        pdf.drawString(30, 326, u"tratamientos, vacunas, veterinarios, (esterilización si amerita) y todo lo que sea necesario para el perfecto")
        pdf.drawString(30, 314, u"estado y cuidado de la mascota entregada.")
        pdf.drawString(30, 290, u"Se hace entrega de la mascota y alimento para 1 mes. En caso de que la mascota requiera una jaula o casa,")
        pdf.drawString(30, 278, u"es el adoptante quien tiene que hacerse cargo de estos gastos y recibir a su nueva mascota en un hogar bien")
        pdf.drawString(30, 266, u"acondicionado para el perfecto cuidado de la misma.")
        pdf.drawString(30, 242, u"2.- EN CASO DE RETRACTO.")
        pdf.drawString(30, 218, u"El adoptante tiene el derecho y deber de, en caso de retractarse de este contrato y por ende del cuidado de la")
        pdf.drawString(30, 206, u"mascota entregada, a devolver dicha mascota a HuellitasAPP con todos los implementos entregados al momento")
        pdf.drawString(30, 194, u"de la entrega. La mascota debe estar en perfectas condiciones y será revisada por especialistas, quienes en caso de")
        pdf.drawString(30, 182, u"detectar signos de maltrato físico o alimenticio de la mascota, informarán a HuellitasAPP quien tendrá la facultad")
        pdf.drawString(30, 170, u"completa de demandar al Adoptante por daños, perjuicios e incumplimiento del contrato de adopción informado.")
        pdf.drawString(30, 146, u"3.- COPIAS DEL PRESENTE CONTRATO.")
        pdf.drawString(30, 122, u"El presente contrato queda disponible en la web de HuellitasAPP tanto para El Adoptante como para la empresa")
        pdf.drawString(30, 110, u"declarando El Adoptante haber recibido esta información.")
        pdf.drawString(30, 86, u"previa lectura, y en señal de aceptación, se ratifica y firman las partes.")
        pdf.drawImage(imagen, 440, 35, 60, 60, preserveAspectRatio=True,)
        pdf.drawString(30, 27, u"______________________________________                                 ______________________________________")
        pdf.drawString(30, 15,u"                             Firma Adoptante                                                                          Firma HuellitasAPP")


        # Fecha
        detalle_ordenF.wrapOn(pdf, 200, 800)
        detalle_ordenF.drawOn(pdf, 420, 730)
        # ADOPTANTE
        detalle_orden1.wrapOn(pdf, 200, 500)
        detalle_orden1.drawOn(pdf, 25, 620)
        detalle_orden11.wrapOn(pdf, 200, 500)
        detalle_orden11.drawOn(pdf, 25, 584)
        detalle_orden111.wrapOn(pdf, 200, 500)
        detalle_orden111.drawOn(pdf, 25, 520)
        detalle_orden1111.wrapOn(pdf, 200, 500)
        detalle_orden1111.drawOn(pdf, 25, 484)

        pdf.setPageSize((letter))

    template_name = 'main/adopcion_contrato.html'
    success_url = reverse_lazy('main:adopcion_list')
