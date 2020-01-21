from django.db import models
from django.contrib.auth.models import User
from projet.models import Projet


class Paiement(models.Model):
	id_user= models.IntegerField()
	date_paiement= models.DateTimeField()
	projet= models.ForeignKey(Projet,on_delete=models.CASCADE)
	montant= models.FloatField()

# Create your models here.
class financeur(models.Model):
	utilisateur = models.OneToOneField(User,on_delete=models.CASCADE)
	projetsfinances = models.ManyToManyField(Projet)
	paiments = models.ManyToManyField(Paiement)
	

