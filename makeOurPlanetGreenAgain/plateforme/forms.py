from django import forms


class ContactForm(forms.Form):
    name = forms.CharField(required=True)
    mail = forms.EmailField(required=True)
    subject = forms.CharField(required=False)
    message = forms.CharField(required=True, widget=forms.Textarea)