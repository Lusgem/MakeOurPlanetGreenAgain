from django.db import models
from django.contrib.auth.models import User
from copyright.models import Copyright
from datetime import datetime


class Projet(models.Model):
	nom = models.CharField(max_length=20)
	membres = models.ManyToManyField(User)
	montant = models.IntegerField()
	financement = models.IntegerField(default=0)
	copyright = models.OneToOneField(Copyright, on_delete=models.CASCADE, blank=True, default=None, null=True)
	publication_date = models.DateTimeField(default=datetime.now)
	description = models.CharField(max_length=1000)
