from django.shortcuts import render, reverse
from django.urls import reverse_lazy
from django.http import HttpResponseRedirect, HttpResponseNotFound
from django.contrib.auth.mixins import LoginRequiredMixin, PermissionRequiredMixin
from django.contrib import messages

from apps.utils.views import ListView, CreateView, UpdateView, DeleteView

from apps.main.models import Animal, Especie, Tratamiento, Cuidados, Adopcion
from apps.main.tables import AnimalTable, EspecieTable, TratamientoTable, CuidadosTable, AdopcionTable
from apps.main.filters import AnimalFilter, EspecieFilter, TratamientoFilter, CuidadosFilter, AdopcionFilter
from apps.main.forms import AnimalForm, EspecieForm, TratamientoForm, CuidadosForm, AdopcionForm


class EspecieListView(ListView, LoginRequiredMixin, PermissionRequiredMixin):
    table_class = EspecieTable
    filterset_class = EspecieFilter
    model = Especie
    add_permission = 'main.add_especie'
    add_url = reverse_lazy('main:especie_create')
    change_permission = 'main.change_especie'
    delete_permission = 'main.delete_especie'
    ordering = ['id']


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
            return HttpResponseRedirect('/main/especie/')


class TratamientoListView(ListView, LoginRequiredMixin, PermissionRequiredMixin):
    table_class = TratamientoTable
    filterset_class = TratamientoFilter
    model = Tratamiento
    add_permission = 'main.add_tratamiento'
    add_url = reverse_lazy('main:tratamiento_create')
    change_permission = 'main.change_tratamiento'
    delete_permission = 'main.delete_tratamiento'
    ordering = ['id']


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
            return HttpResponseRedirect('/main/tratamiento/')


class CuidadosListView(ListView, LoginRequiredMixin, PermissionRequiredMixin):
    table_class = CuidadosTable
    filterset_class = CuidadosFilter
    model = Cuidados
    add_permission = 'main.add_cuidados'
    add_url = reverse_lazy('main:cuidados_create')
    change_permission = 'main.change_cuidados'
    delete_permission = 'main.delete_cuidados'
    ordering = ['id']


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
            return HttpResponseRedirect('/main/cuidados/')


class AnimalListView(ListView, LoginRequiredMixin, PermissionRequiredMixin):
    table_class = AnimalTable
    filterset_class = AnimalFilter
    model = Animal
    add_permission = 'main.add_animal'
    add_url = reverse_lazy('main:animal_create')
    change_permission = 'main.change_animal'
    delete_permission = 'main.delete_animal'
    ordering = ['id']


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
            return HttpResponseRedirect('/main/animal/')


class AdopcionListView(ListView, LoginRequiredMixin, PermissionRequiredMixin):
    table_class = AdopcionTable
    filterset_class = AdopcionFilter
    model = Adopcion
    add_permission = 'main.add_adopcion'
    add_url = reverse_lazy('main:adopcion_create')
    change_permission = 'main.change_adopcion'
    delete_permission = 'main.delete_adopcion'
    ordering = ['id']


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
            return HttpResponseRedirect('/main/adopcion/')
