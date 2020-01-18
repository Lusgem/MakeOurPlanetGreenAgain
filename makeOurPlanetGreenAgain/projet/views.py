from django.http import HttpResponse
from django.shortcuts import render, get_object_or_404
from .models import Projet


def index(request):
    # TODO : add pagination
    latest_project_list = Projet.objects.order_by('-publication_date')[:5]
    context = {'latest_project_list': latest_project_list}
    return render(request, "projet/index.html", context)


def detail(request, project_id):
    project = get_object_or_404(Projet, pk=project_id)
    context = {'project': project}
    return render(request, "projet/detail.html", context)
