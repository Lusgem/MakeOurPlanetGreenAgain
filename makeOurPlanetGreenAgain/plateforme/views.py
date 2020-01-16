from django.http import HttpResponse
from django.shortcuts import render


def index(request):
    return render(request, "plateforme/index.html")


def contact(request):
    return render(request, "plateforme/contact.html")


def credits(request):
    return render(request, "plateforme/credits.html")


