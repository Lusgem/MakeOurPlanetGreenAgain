from django.db import models

class Copyright(models.model):
	nom = models.CharField(max_length=20,blank=false)
	type = models.CharField(max_length=20,blank=false)
	
# Create your models here.
