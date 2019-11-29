from django.db import models

# Create your models here.

class Curator(models.Model):

   user = models.OneToOneField(User, on_delete=models.CASCADE)

   bio = models.TextField(max_length=500, blank=True)

   score = models.IntegerField(default=0,

                               validators=[MinValueValidator(0),

                               MaxValueValidator(5)])

   birth_date = models.DateField(null=True, blank=True)