from django.shortcuts import render, reverse
from django.urls import reverse_lazy
from django.http import HttpResponseRedirect, HttpResponseNotFound
from django.contrib import messages
from apps.utils.views import ListView, CreateView, UpdateView, DeleteView
from django.contrib.auth.mixins import LoginRequiredMixin, PermissionRequiredMixin

from apps.main.models import Region, Provincia, Comuna
from apps.main.tables import RegionTable, ProvinciaTable, ComunaTable
from apps.main.filters import RegionFilter, ProvinciaFilter, ComunaFilter
from apps.main.forms import RegionForm, ProvinciaForm, ComunaForm


class RegionListView(ListView, LoginRequiredMixin, PermissionRequiredMixin):
    table_class = RegionTable
    filterset_class = RegionFilter
    model = Region
    add_permission = 'main.add_region'
    add_url = reverse_lazy('main:region_create')
    change_permission = 'main.change_region'
    delete_permission = 'main.delete_region'
    ordering = ['id']

    def get_queryset(self):
        return Region.objects.get_queryset().order_by('id').filter(estado=True)

    def get_context_data(self, **kwargs):
        context = super(RegionListView, self).get_context_data(**kwargs)
        return context


class RegionCreateView(CreateView, LoginRequiredMixin, PermissionRequiredMixin):
    model = Region
    form_class = RegionForm
    back_url = reverse_lazy('main:region_list')


class RegionUpdateView(UpdateView, LoginRequiredMixin, PermissionRequiredMixin):
    model = Region
    form_class = RegionForm
    back_url = reverse_lazy('main:region_list')


class RegionDeleteView(DeleteView, LoginRequiredMixin, PermissionRequiredMixin):
    model = Region
    success_message = 'Region eliminada exitosamente'

    def delete(self, request, *args, **kwargs):
        pk = self.kwargs['pk']
        try:
            region = Region.objects.get(id=pk)
        except Region.DoesNotExist:
            return HttpResponseNotFound()

        if request.method == "GET":
            return render(request, "generic/confirm_delete.html", {'region': region})
        elif request.method == "POST":
            if request.POST["confirm"] == "1":
                region.estado = False
                region.save()
                messages.success(self.request, self.success_message)
            return HttpResponseRedirect('/vet/region/')


class ProvinciaListView(ListView, LoginRequiredMixin, PermissionRequiredMixin):
    table_class = ProvinciaTable
    filterset_class = ProvinciaFilter
    model = Provincia
    add_permission = 'main.add_provincia'
    add_url = reverse_lazy('main:provincia_create')
    change_permission = 'main.change_provincia'
    delete_permission = 'main.delete_provincia'
    ordering = ['id']

    def get_queryset(self):
        return Provincia.objects.get_queryset().order_by('id').filter(estado=True)

    def get_context_data(self, **kwargs):
        context = super(ProvinciaListView, self).get_context_data(**kwargs)
        return context


class ProvinciaCreateView(CreateView, LoginRequiredMixin, PermissionRequiredMixin):
    model = Provincia
    form_class = ProvinciaForm
    back_url = reverse_lazy('main:provincia_list')


class ProvinciaUpdateView(UpdateView, LoginRequiredMixin, PermissionRequiredMixin):
    model = Provincia
    form_class = ProvinciaForm
    back_url = reverse_lazy('main:provincia_list')


class ProvinciaDeleteView(DeleteView, LoginRequiredMixin, PermissionRequiredMixin):
    model = Provincia
    success_message = 'Provincia eliminada exitosamente'

    def delete(self, request, *args, **kwargs):
        pk = self.kwargs['pk']
        try:
            provincia = Provincia.objects.get(id=pk)
        except Provincia.DoesNotExist:
            return HttpResponseNotFound()

        if request.method == "GET":
            return render(request, "generic/confirm_delete.html", {'provincia': provincia})
        elif request.method == "POST":
            if request.POST["confirm"] == "1":
                provincia.estado = False
                provincia.save()
                messages.success(self.request, self.success_message)
            return HttpResponseRedirect('/vet/provincia/')


class ComunaListView(ListView, LoginRequiredMixin, PermissionRequiredMixin):
    table_class = ComunaTable
    filterset_class = ComunaFilter
    model = Comuna
    add_permission = 'main.add_comuna'
    add_url = reverse_lazy('main:comuna_create')
    change_permission = 'main.change_comuna'
    delete_permission = 'main.delete_comuna'
    ordering = ['id']

    def get_queryset(self):
        return Comuna.objects.get_queryset().order_by('id').filter(estado=True)

    def get_context_data(self, **kwargs):
        context = super(ComunaListView, self).get_context_data(**kwargs)
        return context


class ComunaCreateView(CreateView, LoginRequiredMixin, PermissionRequiredMixin):
    model = Comuna
    form_class = ComunaForm
    back_url = reverse_lazy('main:comuna_list')


class ComunaUpdateView(UpdateView, LoginRequiredMixin, PermissionRequiredMixin):
    model = Comuna
    form_class = ComunaForm
    back_url = reverse_lazy('main:comuna_list')


class ComunaDeleteView(DeleteView, LoginRequiredMixin, PermissionRequiredMixin):
    model = Comuna
    success_message = 'Comuna eliminada exitosamente'

    def delete(self, request, *args, **kwargs):
        pk = self.kwargs['pk']
        try:
            comuna = Comuna.objects.get(id=pk)
        except Comuna.DoesNotExist:
            return HttpResponseNotFound()

        if request.method == "GET":
            return render(request, "generic/confirm_delete.html", {'comuna': comuna})
        elif request.method == "POST":
            if request.POST["confirm"] == "1":
                comuna.estado = False
                comuna.save()
                messages.success(self.request, self.success_message)
            return HttpResponseRedirect('/vet/comuna/')
