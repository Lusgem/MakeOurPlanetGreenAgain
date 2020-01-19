from django.http import HttpResponse
from django.shortcuts import render, get_object_or_404, redirect
from .models import Projet
from .forms import ProjectForm
import logging

log = logging.getLogger(__name__)


def index(request):
    # TODO : add pagination
    latest_project_list = Projet.objects.order_by('-publication_date')[:5]
    context = {'latest_project_list': latest_project_list}
    return render(request, "projet/index.html", context)


def detail(request, project_id):
    project = get_object_or_404(Projet, pk=project_id)
    context = {'project': project}
    return render(request, "projet/detail.html", context)


def add(request):
    if request.method == 'GET':
        form = ProjectForm()
    else:
        form = ProjectForm(request.POST)
        if form.is_valid():
            form.save()
        else:
            log.error(form.errors)
        return redirect('projet:index')

    return render(request, "projet/add.html", {'form': form})
