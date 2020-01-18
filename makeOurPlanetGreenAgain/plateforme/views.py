from django.http import HttpResponse
from django.shortcuts import render
from django.shortcuts import redirect
from django.core.mail import send_mail, BadHeaderError
from .forms import ContactForm


def index(request):
    return render(request, "plateforme/index.html")


def contact(request):
    if request.method == 'GET':
        form = ContactForm()
    else:
        form = ContactForm(request.POST)

        if form.is_valid():
            name = form.cleaned_data['name']
            mail = form.cleaned_data['mail']
            subject = form.cleaned_data['subject']
            message = form.cleaned_data['message']

            try:
                send_mail(
                    subject,
                    message,
                    mail,
                    ['makeourplanetgreetagain@example.fr']
                )
            except BadHeaderError:
                return HttpResponse('Invalid header found.')
            return redirect('/contact/')

    return render(request, "plateforme/contact.html", {'form': form})


def credits(request):
    return render(request, "plateforme/credits.html")


