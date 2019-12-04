from django.db import models
from django.contrib.auth.models import User
from projet.models import Projet

# Create your models here.
class financeur(models.Model):
	utilisateur = models.OneToOneField(User,on_delete=models.CASCADE)
	projetsfinances = models.ManyToManyField(Projet)
	

