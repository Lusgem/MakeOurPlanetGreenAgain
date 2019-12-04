from django.db import models
from django.contrib.auth.models import User
from copyright.models import Copyright

# Create your models here.

class Projet(models.Model):
	nom = models.CharField(max_length=20)
	membres = models.ManyToManyField(User)
	somme = models.IntegerField()
	license = models.OneToOneField(Copyright,on_delete=models.CASCADE)
	description = models.CharField(max_length=200)
	
