from django.db import models
from django.contrib.auth.models import User
from projet.models import Projet


class Expert(models.Model):
    utilisateur = models.OneToOneField(User, on_delete=models.CASCADE)
    karma = models.IntegerField()
    validated_projects = models.ManyToManyField(Projet)
