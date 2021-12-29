from django.shortcuts import render, redirect
from django.urls import reverse_lazy, reverse
from apps.main.forms import *
from apps.main.models import *
from apps.utils.views import TemplateView, CreateView
from django.core.serializers import serialize
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib.auth.mixins import LoginRequiredMixin
from django.views import generic
from django import template
from django.contrib import messages
register = template.Library()


def account_login(request):

    return render(request, "account/login.html")


class HomeTemplateView(LoginRequiredMixin, TemplateView):
    template_name = 'home/index.html'

    def get(self, request, *args, **kwargs):
        id_ = self.request.user.id
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
        else:
            perros_adopte = Animal.objects.filter(adoptante=id_, especie=1, estado=True)
            gatos_adopte = Animal.objects.filter(adoptante=id_, especie=2, estado=True)
            reptiles_adopte = Animal.objects.filter(adoptante=id_, especie=3, estado=True)
            aves_adopte = Animal.objects.filter(adoptante=id_, especie=4, estado=True)
            peces_adopte = Animal.objects.filter(adoptante=id_, especie=5, estado=True)
            aranhas_adopte = Animal.objects.filter(adoptante=id_, especie=6, estado=True)
            return self.render_to_response({"perros_adopte": perros_adopte, "gatos_adopte": gatos_adopte,
                                            "reptiles_adopte": reptiles_adopte, "aves_adopte": aves_adopte,
                                            "peces_adopte": peces_adopte, "aranhas_adopte": aranhas_adopte})


class Home(generic.TemplateView):
    template_name = 'home/home.html'
    success_url = reverse_lazy('home:home')

    def get(self, request, *args, **kwargs):
        perros = Animal.objects.filter(especie=1, estado=True, adoptante__isnull=True)
        gatos = Animal.objects.filter(especie=2, estado=True, adoptante__isnull=True)
        reptiles = Animal.objects.filter(especie=3, estado=True, adoptante__isnull=True)
        aves = Animal.objects.filter(especie=4, estado=True, adoptante__isnull=True)
        peces = Animal.objects.filter(especie=5, estado=True, adoptante__isnull=True)
        aranhas = Animal.objects.filter(especie=6, estado=True, adoptante__isnull=True)
        veterinarias = Veterinaria.objects.filter(estado=True)
        cuidados = Cuidados.objects.filter(estado=True)
        galerias = Galeria.objects.filter(estado=True)
        publicaciones1 = Publicacion.objects.filter(estado=True, aprobado=True, servicio='Busco a mi Dueño')
        publicaciones2 = Publicacion.objects.filter(estado=True, aprobado=True, servicio='Busco a mi Mascota')
        return self.render_to_response({'aform': PublicacionForm
                                           , 'bform': AdopcionForm
                                           , "perros": perros, "gatos": gatos, "reptiles": reptiles
                                           , "aves": aves, "peces": peces, "aranhas": aranhas
                                           , "veterinarias": veterinarias, "cuidados": cuidados
                                           , "galerias": galerias
                                           , "publicaciones1": publicaciones1, "publicaciones2": publicaciones2})

    def post(self, request, *args, **kwargs):
        if request.method == 'POST':
            aform = PublicacionForm(request.POST, request.FILES)
            bform = AdopcionForm(request.POST, request.FILES)
            if aform.is_bound and aform.is_valid():
                aform.nombre = aform.cleaned_data.get('nombre')
                aform.email = aform.cleaned_data.get('email')
                aform.telefono = aform.cleaned_data.get('telefono')
                aform.direccion = aform.cleaned_data.get('direccion')
                aform.fecha = aform.cleaned_data.get('fecha')
                aform.nombre_mascota = aform.cleaned_data.get('nombre_mascota')
                aform.especie = aform.cleaned_data.get('especie')
                aform.tamanho = aform.cleaned_data.get('tamanho')
                aform.sexo = aform.cleaned_data.get('sexo')
                aform.microchip = aform.cleaned_data.get('microchip')
                aform.servicio = aform.cleaned_data.get('servicio')
                aform.fotografia = aform.cleaned_data.get('fotografia')
                aform.mensaje = aform.cleaned_data.get('mensaje')
                aform.save()
                messages.success(request, "Su formulario de contacto ha sido guardado exitosamente")
                return HttpResponseRedirect(self.success_url + '#contact')
            elif bform.is_bound and bform.is_valid():
                self.object = bform.save(commit=False)
                self.object.adoptante = self.request.user
                self.object.save()
                messages.success(request, "Su formulario de adopción ha sido guardado exitosamente")
                return HttpResponseRedirect(self.success_url + '#adoption')
            return render(request, self.template_name, {'aform': aform, 'bform': bform})
