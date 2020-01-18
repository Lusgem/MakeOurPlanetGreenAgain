from django.http import HttpResponse
from django.shortcuts import render, get_object_or_404
from .models import Projet


def index(request):
    # TODO : add pagination
    latest_project_list = Projet.objects.order_by('-publication_date')[:5]
    context = {'latest_project_list': latest_project_list}
    return render(request, "projet/index.html", context)


def detail(request, projet_id):
    response = "Détail du projet %s"
    return HttpResponse(response % projet_id)
