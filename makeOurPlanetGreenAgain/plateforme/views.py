from django.http import HttpResponse
from django.shortcuts import render


def index(request):
    return render(request, "index.html")


def contact(request):
    return HttpResponse("La page de contact yes")


def credit(request):
    return HttpResponse("Crédits et Mentions légales")
