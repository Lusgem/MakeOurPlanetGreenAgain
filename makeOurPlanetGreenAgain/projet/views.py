from django.http import HttpResponse
from django.shortcuts import render, get_object_or_404, redirect
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from django.db.models import F
from django.contrib import messages
from .models import Projet
from .forms import ProjectForm
from expert.models import Expert
from plateforme.models import Commentaire
from plateforme.forms import CommentForm
import logging

log = logging.getLogger(__name__)


def index(request):
    # on affiche les projets qui n'ont pas été complètement financés
    project_list = Projet.objects.filter(financement__lt=F("montant")).order_by('-publication_date')

    paginator = Paginator(project_list, 6)  # 6 projets par page
    page = request.GET.get('page')

    try:
        projects = paginator.page(page)
    except PageNotAnInteger:
        projects = paginator.page(1)
    except EmptyPage:
        projects = paginator.page(paginator.num_pages)

    context = {'projects': projects}
    return render(request, "projet/index.html", context)


def detail(request, project_id):
    project = get_object_or_404(Projet, pk=project_id)
    comments = Commentaire.objects.filter(projet__exact=project).order_by('-publication_date')

    context = {'project': project, 'comments': comments}

    # check if project is validated by experts
    if project.expert_set.exists():
        experts = project.expert_set.all().order_by('-karma')
        context['experts'] = experts
    # check if the actual user is an expert
    if request.user.is_authenticated and Expert.objects.filter(utilisateur__exact=request.user).exists():
        context['user_can_validate'] = True

    if request.method == 'GET':
        form = CommentForm()
    else:
        form = CommentForm(request.POST)
        if form.is_valid():
            comment = form.save(commit=False)
            comment.utilisateur = request.user
            comment.projet = project
            comment.save()
            return redirect('projet:detail', project_id=project_id)

    context['form'] = form
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


def validate(request, project_id):
    validated_project = get_object_or_404(Projet, pk=project_id)
    expert = Expert.objects.get(utilisateur=request.user)

    # Check if expert has already validated the project
    if Expert.objects.filter(validated_projects__pk=project_id).exists():
        messages.info(request, 'Vous avez déjà validé ce projet !')
    else:
        expert.validated_projects.add(validated_project)
        expert.save()
    return redirect('projet:detail', project_id=project_id)
