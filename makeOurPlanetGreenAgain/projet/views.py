from django.http import HttpResponse
from django.shortcuts import render


def index(request):
    return render(request, "projet/index.html")


def detail(request, projet_id):
    response = "Détail du projet %s"
    return HttpResponse(response % projet_id)
