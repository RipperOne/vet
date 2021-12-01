from django.shortcuts import render, reverse
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


class ServicioListView(ListView):
    table_class = ServicioTable
    filterset_class = ServicioFilter
    model = Servicio
    add_permission = 'main.add_servicio'
    add_url = reverse_lazy('main:servicio_create')
    change_permission = 'main.change_servicio'
    delete_permission = 'main.delete_servicio'
    ordering = ['id']


class ServicioCreateView(CreateView):
    model = Servicio
    form_class = ServicioForm
    back_url = reverse_lazy('main:servicio_list')


class ServicioUpdateView(UpdateView):
    model = Servicio
    form_class = ServicioForm
    back_url = reverse_lazy('main:servicio_list')


class ServicioDeleteView(DeleteView):
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
            return HttpResponseRedirect('/main/servicio/')


class VeterinariaListView(ListView):
    table_class = VeterinariaTable
    filterset_class = VeterinariaFilter
    model = Veterinaria
    template_name = 'main/veterinaria_list.html'
    add_permission = 'main.add_veterinaria'
    add_url = reverse_lazy('main:veterinaria_create')
    change_permission = 'main.change_veterinaria'
    delete_permission = 'main.delete_veterinaria'
    ordering = ['id']


class VeterinariaCreateView(CreateView):
    template_name = 'main/veterinaria_create.html'
    model = Veterinaria
    form_class = VeterinariaForm
    back_url = reverse_lazy('main:veterinaria_list')


class VeterinariaUpdateView(UpdateView):
    template_name = 'main/veterinaria_update.html'
    model = Veterinaria
    form_class = VeterinariaForm
    back_url = reverse_lazy('main:veterinaria_list')


class VeterinariaDeleteView(DeleteView):
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
            return HttpResponseRedirect('/main/veterinaria/')


class VeterinariaSigMapa(LoginRequiredMixin, TemplateView):
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


class VeterinariaSigDatos(LoginRequiredMixin, TemplateView):
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


class VetTodo(LoginRequiredMixin, TemplateView):
    template_name = 'main/veterinaria_mapa_all.html'


class VeterinariasMapaAll(LoginRequiredMixin, TemplateView):
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


class VeterinariasDatosAll(LoginRequiredMixin, TemplateView):
    required_permissions = ('main.view_veterinaria',)
    template_name = 'main/veterinaria_mapa_all.html'

    def get(self, request, *args, **kwargs):
        pmfbn_sig = self.get_data(request.GET.get('pk'))
        return HttpResponse(pmfbn_sig, content_type='json')

    def get_data(self, pk):
        if pk:
            return serialize('geojson', Veterinaria.objects.filter(id=pk))
        return serialize('geojson', Veterinaria.objects.all())


class PublicacionListView(ListView):
    table_class = PublicacionTable
    filterset_class = PublicacionFilter
    model = Publicacion
    add_permission = 'main.add_publicacion'
    add_url = reverse_lazy('main:publicacion_create')
    change_permission = 'main.change_publicacion'
    delete_permission = 'main.delete_publicacion'
    ordering = ['id']


class PublicacionCreateView(CreateView):
    model = Publicacion
    form_class = PublicacionForm
    back_url = reverse_lazy('main:publicacion_list')


class PublicacionUpdateView(UpdateView):
    model = Publicacion
    form_class = PublicacionForm
    back_url = reverse_lazy('main:publicacion_list')


class PublicacionDeleteView(DeleteView):
    model = Publicacion
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
            return HttpResponseRedirect('/main/publicacion/')
