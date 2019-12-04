from django.http import HttpResponse


def index(request):
    return HttpResponse("Bonjour c'est la page d'accueil ou quoi ?")
