from django.contrib import admin
from financeurs.models import financeur, Paiement

# Register your models here.
admin.site.register(financeur)
admin.site.register(Paiement)
