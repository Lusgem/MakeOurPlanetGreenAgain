from django.db import models
from django.contrib.auth.models import User
from copyright.models import Copyright
from datetime import datetime

# Create your models here.


class Projet(models.Model):
	nom = models.CharField(max_length=20)
	membres = models.ManyToManyField(User)
	montant = models.IntegerField()
	license = models.OneToOneField(Copyright,on_delete=models.CASCADE)
	publication_date = models.DateTimeField(default=datetime.now)
	description = models.CharField(max_length=1000)
