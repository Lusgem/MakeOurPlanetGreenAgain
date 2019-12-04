from django.db import models

class Copyright(models.Model):
	nom = models.CharField(max_length=20,blank=False)
	type = models.CharField(max_length=20,blank=False)
	
# Create your models here.
