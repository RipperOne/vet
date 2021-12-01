from django.shortcuts import render, reverse
from django.urls import reverse_lazy
from django.http import HttpResponseRedirect, HttpResponseNotFound

from django.contrib import messages

from apps.utils.views import ListView, CreateView, UpdateView, DeleteView

from apps.main.models import Animal, Especie, Tratamiento
from apps.main.tables import AnimalTable, EspecieTable, TratamientoTable
from apps.main.filters import AnimalFilter, EspecieFilter, TratamientoFilter
from apps.main.forms import AnimalForm, EspecieForm, TratamientoForm


class EspecieListView(ListView):
    table_class = EspecieTable
    filterset_class = EspecieFilter
    model = Especie
    add_permission = 'main.add_especie'
    add_url = reverse_lazy('main:especie_create')
    change_permission = 'main.change_especie'
    delete_permission = 'main.delete_especie'
    ordering = ['id']


class EspecieCreateView(CreateView):
    model = Especie
    form_class = EspecieForm
    back_url = reverse_lazy('main:especie_list')


class EspecieUpdateView(UpdateView):
    model = Especie
    form_class = EspecieForm
    back_url = reverse_lazy('main:especie_list')


class EspecieDeleteView(DeleteView):
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


class TratamientoListView(ListView):
    table_class = TratamientoTable
    filterset_class = TratamientoFilter
    model = Tratamiento
    add_permission = 'main.add_tratamiento'
    add_url = reverse_lazy('main:tratamiento_create')
    change_permission = 'main.change_tratamiento'
    delete_permission = 'main.delete_tratamiento'
    ordering = ['id']


class TratamientoCreateView(CreateView):
    model = Tratamiento
    form_class = TratamientoForm
    back_url = reverse_lazy('main:tratamiento_list')


class TratamientoUpdateView(UpdateView):
    model = Tratamiento
    form_class = TratamientoForm
    back_url = reverse_lazy('main:tratamiento_list')


class TratamientoDeleteView(DeleteView):
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


class AnimalListView(ListView):
    table_class = AnimalTable
    filterset_class = AnimalFilter
    model = Animal
    add_permission = 'main.add_animal'
    add_url = reverse_lazy('main:animal_create')
    change_permission = 'main.change_animal'
    delete_permission = 'main.delete_animal'
    ordering = ['id']


class AnimalCreateView(CreateView):
    model = Animal
    form_class = AnimalForm
    back_url = reverse_lazy('main:animal_list')


class AnimalUpdateView(UpdateView):
    model = Animal
    form_class = AnimalForm
    back_url = reverse_lazy('main:animal_list')


class AnimalDeleteView(DeleteView):
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
