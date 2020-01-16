from django.http import HttpResponse
from django.shortcuts import render
from . import forms as f
import logging

log = logging.getLogger(__name__)

def index(request):
    return render(request, "plateforme/index.html")

def contact(request):
    return render(request, "plateforme/contact.html")

def credits(request):
    return render(request, "plateforme/credits.html")

def logger(request):
    #username = request.POST['username']
    #password = request.POST['password']
    #user = authenticate(request, username=username, password=password)
    
    if request.method == 'POST':
        log.error('Post request')
        # create a form instance and populate it with data from the request:
        form = f.LoginForm(request.POST)
        # check whether it's valid:
        if form.is_valid():
            log.error('valid')
            # process the data in form.cleaned_data as required
            # ...
            # redirect to a new URL:
            return HttpResponseRedirect('plateforme/index.html')

    # if a GET (or any other method) we'll create a blank form
    else:
        form = f.LoginForm()

    return render(request, 'plateforme/index.html', {'form': form})
