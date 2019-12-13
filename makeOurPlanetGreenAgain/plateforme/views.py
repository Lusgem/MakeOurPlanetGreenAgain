from django.http import HttpResponse


def index(request):
    return HttpResponse("Bonjour c'est la page d'accueil ou quoi ?")


def contact(request):
    return HttpResponse("La page de contact yes")


def credit(request):
    return HttpResponse("Crédits et Mentions légales")
