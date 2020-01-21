from django import forms
from django.contrib.auth.models import User
from .models import Projet


class ProjectForm(forms.ModelForm):
    nom = forms.CharField(required=True)
    # TODO ajout membres
    #membres = forms.ModelMultipleChoiceField(queryset=User.objects.all())
    montant = forms.IntegerField(required=True)
    description = forms.CharField(required=True)
    # TODO ajout copyright

    class Meta:
        model = Projet
        fields = ["nom", "montant", "description"]
        widgets = {
            'description': forms.Textarea()
        }
