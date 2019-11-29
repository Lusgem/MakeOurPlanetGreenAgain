from django.db import models
from django.contrib.auth.models import User
import copyright.models.Copyright

# Create your models here.

class Projet(models.model):
	nom = models.CharField(max_length=20)
	membres = models.ManyToManyField(User, on_delete=models.CASCADE)
	somme = models.IntegerField()
	license = models.OneToOneField(Copyright, on_delete=models.CASCADE)
	description = models.CharField(max_length=200)
	
