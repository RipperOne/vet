from django.shortcuts import render, reverse, redirect
from django.urls import reverse_lazy
from django.http import HttpResponseRedirect, HttpResponseNotFound
from django.contrib.auth.mixins import LoginRequiredMixin, PermissionRequiredMixin
from django.contrib import messages

from apps.utils.views import ListView, CreateView, UpdateView, DeleteView

from apps.main.models import Animal, Especie, Tratamiento, Cuidados, Adopcion, Galeria
from apps.main.tables import AnimalTable, EspecieTable, TratamientoTable, CuidadosTable, AdopcionTable, GaleriaTable
from apps.main.filters import AnimalFilter, EspecieFilter, TratamientoFilter, CuidadosFilter, AdopcionFilter, GaleriaFilter
from apps.main.forms import AnimalForm, EspecieForm, TratamientoForm, CuidadosForm, AdopcionForm, GaleriaForm


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
