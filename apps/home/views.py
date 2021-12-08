import json
from django.shortcuts import render_to_response, render
from django.urls import reverse_lazy, reverse
from django.views.generic.edit import ModelFormMixin
from apps.main.forms import *
from apps.main.models import Animal, Veterinaria
from apps.utils.views import TemplateView, ListView
from django.core.serializers import serialize
from django.http import HttpResponse
from django.contrib.auth.mixins import LoginRequiredMixin, PermissionRequiredMixin
from django.views import generic


def _get_form(request, formcls, prefix):
    data = request.POST if prefix in request.POST else None
    return formcls(data, prefix=prefix)


def account_login(request):

    return render(request, "account/login.html")


def home(request):

    return render(request, "home/home.html")


def home2(request):

    return render(request, "home/index.html")


class Home(generic.TemplateView):
    template_name = 'home/home.html'
    success_url = reverse_lazy('home:home')

    def get(self, request, *args, **kwargs):
        perros = Animal.objects.filter(especie=1, estado=True)
        gatos = Animal.objects.filter(especie=2, estado=True)
        reptiles = Animal.objects.filter(especie=3, estado=True)
        aves = Animal.objects.filter(especie=4, estado=True)
        peces = Animal.objects.filter(especie=5, estado=True)
        aranhas = Animal.objects.filter(especie=6, estado=True)
        veterinarias = Veterinaria.objects.filter(estado=True)
        return self.render_to_response({'aform': PublicacionForm(prefix='aform_pre')
                                        , "perros": perros, "gatos": gatos, "reptiles": reptiles
                                        , "aves": aves, "peces": peces, "aranhas": aranhas
                                        , "veterinarias": veterinarias})

    def post(self, request, *args, **kwargs):
        aform = _get_form(request, PublicacionForm, 'aform_pre')
        if aform.is_bound and aform.is_valid():
            aform.save()
            return self.render_to_response({'aform': aform})


class HomeMapaAll(generic.TemplateView):
    template_name = 'home/home.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['datasets_url_vet_home'] = self.get_dataset_url()
        return context

    def get_dataset_url(self):
        pk = self.request.GET.get('pk')
        if pk:
            return reverse('home:home_data') + '?pk=' + pk
        return reverse('home:home_data')


class HomeDatosAll(generic.TemplateView):
    template_name = 'home/home.html'

    def get(self, request, *args, **kwargs):
        veterinarias = self.get_data(request.GET.get('pk'))
        return HttpResponse(veterinarias, content_type='json')

    def get_data(self, pk):
        if pk:
            return serialize('geojson', Veterinaria.objects.filter(id=pk))
        return serialize('geojson', Veterinaria.objects.all())
