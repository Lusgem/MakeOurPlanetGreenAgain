from django.db import models
from django.contrib.auth.models import User
# Create your models here.
class financeur(models.model):
	utilisateur = models.OneToOneField(User)
	projetsfinances = models.ManyToManyField(Projet)
	

