from django.shortcuts import render, reverse, redirect
from django.urls import reverse_lazy
from django.http import HttpResponse, JsonResponse, Http404, HttpResponseRedirect, HttpResponseNotFound

import apps.main.filters
from apps.main.converter import utm_to_latlng
from django.core.serializers import serialize
from django.db.models import Q
import json
from django.contrib import messages
from django.contrib.auth.mixins import LoginRequiredMixin, PermissionRequiredMixin
from apps.utils.views import ListView, CreateView, UpdateView, DeleteView, TemplateView
from django.contrib.gis.db.models.functions import Centroid, AsGeoJSON
from apps.main.models import Servicio, Veterinaria, Publicacion
from apps.main.tables import ServicioTable, VeterinariaTable, PublicacionTable
from apps.main.filters import ServicioFilter, VeterinariaFilter, PublicacionFilter
from apps.main.forms import ServicioForm, VeterinariaForm, PublicacionForm


class ServicioListView(ListView, LoginRequiredMixin, PermissionRequiredMixin):
    table_class = ServicioTable
    filterset_class = ServicioFilter
    model = Servicio
    add_permission = 'main.add_servicio'
    add_url = reverse_lazy('main:servicio_create')
    change_permission = 'main.change_servicio'
    delete_permission = 'main.delete_servicio'
    ordering = ['id']

    def get_queryset(self):
        return Servicio.objects.get_queryset().order_by('id').filter(estado=True)

    def get_context_data(self, **kwargs):
        context = super(ServicioListView, self).get_context_data(**kwargs)
        return context


class ServicioCreateView(CreateView, LoginRequiredMixin, PermissionRequiredMixin):
    model = Servicio
    form_class = ServicioForm
    back_url = reverse_lazy('main:servicio_list')


class ServicioUpdateView(UpdateView, LoginRequiredMixin, PermissionRequiredMixin):
    model = Servicio
    form_class = ServicioForm
    back_url = reverse_lazy('main:servicio_list')


class ServicioDeleteView(DeleteView, LoginRequiredMixin, PermissionRequiredMixin):
    model = Servicio
    success_message = 'Servicio eliminado exitosamente'

    def delete(self, request, *args, **kwargs):
        pk = self.kwargs['pk']
        try:
            servicio = Servicio.objects.get(id=pk)
        except Servicio.DoesNotExist:
            return HttpResponseNotFound()

        if request.method == "GET":
            return render(request, "generic/confirm_delete.html", {'servicio': servicio})
        elif request.method == "POST":
            if request.POST["confirm"] == "1":
                servicio.estado = False
                servicio.save()
                messages.success(self.request, self.success_message)
            return HttpResponseRedirect('/vet/servicio/')


class VeterinariaListView(ListView, LoginRequiredMixin, PermissionRequiredMixin):
    table_class = VeterinariaTable
    filterset_class = VeterinariaFilter
    model = Veterinaria
    template_name = 'main/veterinaria_list.html'
    add_permission = 'main.add_veterinaria'
    add_url = reverse_lazy('main:veterinaria_create')
    change_permission = 'main.change_veterinaria'
    delete_permission = 'main.delete_veterinaria'
    ordering = ['id']

    def get_queryset(self):
        return Veterinaria.objects.get_queryset().order_by('id').filter(estado=True)

    def get_context_data(self, **kwargs):
        context = super(VeterinariaListView, self).get_context_data(**kwargs)
        return context


class VeterinariaCreateView(CreateView, LoginRequiredMixin, PermissionRequiredMixin):
    template_name = 'main/veterinaria_create.html'
    model = Veterinaria
    form_class = VeterinariaForm
    back_url = reverse_lazy('main:veterinaria_list')


class VeterinariaUpdateView(UpdateView, LoginRequiredMixin, PermissionRequiredMixin):
    template_name = 'main/veterinaria_update.html'
    model = Veterinaria
    form_class = VeterinariaForm
    back_url = reverse_lazy('main:veterinaria_list')


class VeterinariaDeleteView(DeleteView, LoginRequiredMixin, PermissionRequiredMixin):
    model = Veterinaria
    success_message = 'Veterinaria eliminada exitosamente'

    def delete(self, request, *args, **kwargs):
        pk = self.kwargs['pk']
        try:
            veterinaria = Veterinaria.objects.get(id=pk)
        except Veterinaria.DoesNotExist:
            return HttpResponseNotFound()

        if request.method == "GET":
            return render(request, "generic/confirm_delete.html", {'veterinaria': veterinaria})
        elif request.method == "POST":
            if request.POST["confirm"] == "1":
                veterinaria.estado = False
                veterinaria.save()
                messages.success(self.request, self.success_message)
            return HttpResponseRedirect('/vet/veterinaria/')


class VeterinariaSigMapa(TemplateView, LoginRequiredMixin, PermissionRequiredMixin):
    template_name = 'main/veterinaria_mapa.html'
    required_permissions = 'main.view_veterinaria'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['datasets_url_veterinaria'] = self.get_dataset_url()
        return context

    def get_dataset_url(self):
        pk = self.request.GET.get('pk')
        if pk:
            return reverse('main:veterinaria_datos') + '?pk=' + pk
        return reverse('main:veterinaria_datos')

    def center(request):
        pk = request.GET.get("id")
        try:
            result = Veterinaria.objects.filter(id=pk).annotate(
                center=AsGeoJSON(Centroid('geom'))
            )
            coords = json.loads(result.values()[0].get('center'))
            easting, norting = tuple(coords.get('coordinates', []))
            lat, lng = utm_to_latlng(18, easting, norting, False)

            return JsonResponse({'lat': lat, 'lng': lng})
        except Exception:
            raise Http404


class VeterinariaSigDatos(TemplateView, LoginRequiredMixin, PermissionRequiredMixin):
    template_name = 'main/veterinaria_mapa.html'
    required_permissions = 'main.view_veterinaria'

    def get(self, request, *args, **kwargs):
        veterinaria_sig = self.get_data(request.GET.get('pk'))
        return HttpResponse(veterinaria_sig, content_type='json')

    def get_data(self, pk):
        pk = self.request.GET.get('pk')
        if pk:
            return serialize('geojson', Veterinaria.objects.filter(id=pk))
        return serialize('geojson', Veterinaria.objects.all())


class VetTodo(TemplateView, LoginRequiredMixin, PermissionRequiredMixin):
    template_name = 'main/veterinaria_mapa_all.html'


class VeterinariasMapaAll(TemplateView, LoginRequiredMixin, PermissionRequiredMixin):
    required_permissions = ('main.view_veterinaria',)
    template_name = 'main/veterinaria_mapa_all.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['datasets_url_vet_TODO'] = self.get_dataset_url()
        return context

    def get_dataset_url(self):
        pk = self.request.GET.get('pk')
        if pk:
            return reverse('main:veterinaria_datos_all') + '?pk=' + pk
        return reverse('main:veterinaria_datos_all')


class VeterinariasDatosAll(TemplateView, LoginRequiredMixin, PermissionRequiredMixin):
    required_permissions = ('main.view_veterinaria',)
    template_name = 'main/veterinaria_mapa_all.html'

    def get(self, request, *args, **kwargs):
        veterinarias = self.get_data(request.GET.get('pk'))
        return HttpResponse(veterinarias, content_type='json')

    def get_data(self, pk):
        if pk:
            return serialize('geojson', Veterinaria.objects.filter(id=pk))
        return serialize('geojson', Veterinaria.objects.all())


class FrontEnd(TemplateView):
    template_name = 'main/veterinarias_mapa_frontend.html'


class FrontEndMapaAll(TemplateView):
    template_name = 'main/veterinarias_mapa_frontend.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['datasets_url_vet_frontend'] = self.get_dataset_url()
        return context

    def get_dataset_url(self):
        pk = self.request.GET.get('pk')
        if pk:
            return reverse('main:veterinarias_datos_frontend') + '?pk=' + pk
        return reverse('main:veterinarias_datos_frontend')


class FrontEndDatosAll(TemplateView):
    template_name = 'main/veterinarias_mapa_frontend.html'

    def get(self, request, *args, **kwargs):
        frontendVets = self.get_data(request.GET.get('pk'))
        return HttpResponse(frontendVets, content_type='json')

    def get_data(self, pk):
        if pk:
            return serialize('geojson', Veterinaria.objects.filter(id=pk))
        return serialize('geojson', Veterinaria.objects.all())


class PublicacionListView(ListView, LoginRequiredMixin, PermissionRequiredMixin):
    table_class = PublicacionTable
    filterset_class = PublicacionFilter
    model = Publicacion
    add_permission = 'main.add_publicacion'
    add_url = reverse_lazy('main:publicacion_create')
    change_permission = 'main.change_publicacion'
    delete_permission = 'main.delete_publicacion'
    ordering = ['id']

    def get_queryset(self):
        return Publicacion.objects.get_queryset().order_by('id').filter(estado=True)

    def get_context_data(self, **kwargs):
        context = super(PublicacionListView, self).get_context_data(**kwargs)
        return context


class PublicacionCreateView(CreateView, LoginRequiredMixin, PermissionRequiredMixin):
    model = Publicacion
    form_class = PublicacionForm
    back_url = reverse_lazy('main:publicacion_list')


class PublicacionUpdateView(UpdateView, LoginRequiredMixin, PermissionRequiredMixin):
    model = Publicacion
    form_class = PublicacionForm
    back_url = reverse_lazy('main:publicacion_list')


class PublicacionDeleteView(DeleteView, LoginRequiredMixin, PermissionRequiredMixin):
    model = Publicacion
    required_permissions = ('main.delete_publicacion',)
    success_message = 'Publicacion eliminado exitosamente'

    def delete(self, request, *args, **kwargs):
        pk = self.kwargs['pk']
        try:
            publicacion = Publicacion.objects.get(id=pk)
        except Publicacion.DoesNotExist:
            return HttpResponseNotFound()

        if request.method == "GET":
            return render(request, "generic/confirm_delete.html", {'publicacion': publicacion})
        elif request.method == "POST":
            if request.POST["confirm"] == "1":
                publicacion.estado = False
                publicacion.save()
                messages.success(self.request, self.success_message)
            return HttpResponseRedirect('/vet/publicacion/')
