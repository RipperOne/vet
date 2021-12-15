import json
from django.shortcuts import render_to_response, render
from django.urls import reverse_lazy, reverse
from django.views.generic.edit import ModelFormMixin
from apps.main.forms import *
from apps.main.models import *
from apps.utils.views import TemplateView, ListView
from django.core.serializers import serialize
from django.http import HttpResponse, JsonResponse, Http404, HttpResponseRedirect, HttpResponseNotFound
from django.contrib.auth.mixins import LoginRequiredMixin, PermissionRequiredMixin
from django.views import generic
from apps.users.models import User
from django import template
from django.contrib import messages
from django.template import RequestContext
register = template.Library()


def _get_form(request, formcls, prefix):
    data = request.POST if prefix in request.POST else None
    return formcls(data, prefix=prefix)


def account_login(request):

    return render(request, "account/login.html")


class HomeTemplateView(LoginRequiredMixin, TemplateView):
    template_name = 'home/index.html'

    def get(self, request, *args, **kwargs):
        id_ = self.request.user.id
        pk = User.objects.get(id=id_)
        if self.request.user.is_superuser:
            # Gráfico de Cantidad de Mascotas Totales
            perros = Especie.objects.filter(id=1, estado=True)
            gatos = Especie.objects.filter(id=2, estado=True)
            reptiles = Especie.objects.filter(id=3, estado=True)
            aves = Especie.objects.filter(id=4, estado=True)
            peces = Especie.objects.filter(id=5, estado=True)
            aranhas = Especie.objects.filter(id=6, estado=True)
            perros1 = str(Animal.objects.filter(especie=1, estado=True).count())
            gatos1 = str(Animal.objects.filter(especie=2, estado=True).count())
            reptiles1 = str(Animal.objects.filter(especie=3, estado=True).count())
            aves1 = str(Animal.objects.filter(especie=4, estado=True).count())
            peces1 = str(Animal.objects.filter(especie=5, estado=True).count())
            aranhas1 = str(Animal.objects.filter(especie=6, estado=True).count())

            perros = perros[0]
            gatos = gatos[0]
            reptiles = reptiles[0]
            aves = aves[0]
            peces = peces[0]
            aranhas = aranhas[0]

            estadistica1 = [int(perros1[0])]
            estadistica2 = [int(gatos1[0])]
            estadistica3 = [int(reptiles1[0])]
            estadistica4 = [int(aves1[0])]
            estadistica5 = [int(peces1[0])]
            estadistica6 = [int(aranhas1[0])]

            # Gráfico de Cantidad de Mascotas Adoptadas
            perros_adoptados = Especie.objects.filter(id=1, estado=True)
            gatos_adoptados = Especie.objects.filter(id=2, estado=True)
            reptiles_adoptados = Especie.objects.filter(id=3, estado=True)
            aves_adoptados = Especie.objects.filter(id=4, estado=True)
            peces_adoptados = Especie.objects.filter(id=5, estado=True)
            aranhas_adoptados = Especie.objects.filter(id=6, estado=True)
            perros1_adoptados = str(Animal.objects.filter(adoptante__isnull=False, especie=1, estado=True).count())
            gatos1_adoptados = str(Animal.objects.filter(adoptante__isnull=False, especie=2, estado=True).count())
            reptiles1_adoptados = str(Animal.objects.filter(adoptante__isnull=False, especie=3, estado=True).count())
            aves1_adoptados = str(Animal.objects.filter(adoptante__isnull=False, especie=4, estado=True).count())
            peces1_adoptados = str(Animal.objects.filter(adoptante__isnull=False, especie=5, estado=True).count())
            aranhas1_adoptados = str(Animal.objects.filter(adoptante__isnull=False, especie=6, estado=True).count())

            perros_adoptados = perros_adoptados[0]
            gatos_adoptados = gatos_adoptados[0]
            reptiles_adoptados = reptiles_adoptados[0]
            aves_adoptados = aves_adoptados[0]
            peces_adoptados = peces_adoptados[0]
            aranhas_adoptados = aranhas_adoptados[0]

            estadistica1_adoptados = [int(perros1_adoptados[0])]
            estadistica2_adoptados = [int(gatos1_adoptados[0])]
            estadistica3_adoptados = [int(reptiles1_adoptados[0])]
            estadistica4_adoptados = [int(aves1_adoptados[0])]
            estadistica5_adoptados = [int(peces1_adoptados[0])]
            estadistica6_adoptados = [int(aranhas1_adoptados[0])]

            return self.render_to_response(
                    {"estadistica1": estadistica1, "estadistica2": estadistica2, "estadistica3": estadistica3,
                     "estadistica4": estadistica4, "estadistica5": estadistica5, "estadistica6": estadistica6,
                     "perros": perros, "gatos": gatos, "reptiles": reptiles, "aves": aves, "peces": peces,
                     "aranhas": aranhas,
                     "estadistica1_adoptados": estadistica1_adoptados, "estadistica2_adoptados": estadistica2_adoptados,
                     "estadistica3_adoptados": estadistica3_adoptados, "estadistica4_adoptados": estadistica4_adoptados,
                     "estadistica5_adoptados": estadistica5_adoptados, "estadistica6_adoptados": estadistica6_adoptados,
                     "perros_adoptados": perros_adoptados, "gatos_adoptados": gatos_adoptados,
                     "reptiles_adoptados": reptiles_adoptados, "aves_adoptados": aves_adoptados,
                     "peces_adoptados": peces_adoptados, "aranhas_adoptados": aranhas_adoptados
                     })


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
        cuidados = Cuidados.objects.filter(estado=True)
        galerias = Galeria.objects.filter(estado=True)
        publicaciones1 = Publicacion.objects.filter(estado=True, aprobado=True, servicio='Busco a mi Dueño')
        publicaciones2 = Publicacion.objects.filter(estado=True, aprobado=True, servicio='Busco a mi Mascota')
        return self.render_to_response({'aform': PublicacionForm(prefix='aform_pre')
                                        , 'bform': AdopcionForm(prefix='bform_pre')
                                        , "perros": perros, "gatos": gatos, "reptiles": reptiles
                                        , "aves": aves, "peces": peces, "aranhas": aranhas
                                        , "veterinarias": veterinarias, "cuidados": cuidados
                                        ,  "galerias": galerias
                                        , "publicaciones1": publicaciones1, "publicaciones2": publicaciones2})

    def post(self, request, *args, **kwargs):
        aform = _get_form(request, PublicacionForm, 'aform_pre')
        bform = _get_form(request,  AdopcionForm, 'bform_pre')
        if aform.is_bound and aform.is_valid():
            aform.save()
            messages.success(request, 'Formulario de contacto enviado Exitosamente')
        elif bform.is_bound and bform.is_valid():
            self.object = bform.save(commit=False)
            self.object.adoptante = self.request.user
            self.object.save()
            messages.success(request, 'Formulario  de solicitud enviado Exitosamente')
        return HttpResponseRedirect('/')


class HomeMapaAll(generic.TemplateView):
    template_name = 'home/home.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['datasets_url_vet_home'] = self.get_dataset_url()
        return context

    def get_dataset_url(self):
        pk = self.request.GET.get('pk')
        if pk:
            return reverse('home:home_mapa') + '?pk=' + pk
        return reverse('home:home_mapa')


class HomeDatosAll(generic.TemplateView):
    template_name = 'home/home.html'

    def get(self, request, *args, **kwargs):
        veterinarias_sig = self.get_data(request.GET.get('pk'))
        return HttpResponse(veterinarias_sig, content_type='json')

    def get_data(self, pk):
        if pk:
            return serialize('geojson', Veterinaria.objects.filter(id=pk))
        return serialize('geojson', Veterinaria.objects.all())
