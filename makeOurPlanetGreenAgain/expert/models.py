from django.db import models
from utilisateur import models

from django.contrib.auth.models import User

# Create your models here.
class Expert(models.model):
        utilisateur = models.ManyToManyField(User)
	karma = models.IntegerField()
	

