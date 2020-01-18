from django import forms
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm

class LoginForm(forms.Form):
    username = forms.CharField(label='username', max_length=100)
    password = forms.CharField(label='password', max_length=100)

class RegisterForm(UserCreationForm):
    email = forms.EmailField()
    first_name = forms.CharField(label="first_name",max_length=20)
    last_name = forms.CharField(label="last_name",max_length=20)
    class Meta:
        model= User
        fields= ['username', 'email', 'password1', 'password2']

class ContactForm(forms.Form):
    name = forms.CharField(required=True)
    mail = forms.EmailField(required=True)
    subject = forms.CharField(required=False)
    message = forms.CharField(required=True, widget=forms.Textarea)