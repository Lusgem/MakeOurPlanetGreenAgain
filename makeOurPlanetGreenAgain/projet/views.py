from django.http import HttpResponse


def index(request):
    return HttpResponse("La liste des projets")


def detail(request, projet_id):
    response = "Détail du projet %s"
    return HttpResponse(response % projet_id)
