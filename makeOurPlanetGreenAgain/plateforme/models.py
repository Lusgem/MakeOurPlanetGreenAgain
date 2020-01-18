from django.contrib.auth.models import User
from django.db import models
from projet.models import Projet

# Create your models here.
class Commentaire(models.Model):
    auto_increment_id = models.AutoField(primary_key=True)
    content = models.CharField(max_length=2500)
    projet = models.ForeignKey(Projet, on_delete=models.CASCADE)
    utilisateur = models.ForeignKey(User, on_delete=models.CASCADE)
