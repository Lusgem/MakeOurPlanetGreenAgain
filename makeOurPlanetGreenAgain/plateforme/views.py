from django.shortcuts import render
from django.shortcuts import redirect
from django.contrib.auth import authenticate, login, logout
from . import forms as f
import logging

log = logging.getLogger(__name__)

def index(request):
    return render(request, "plateforme/index.html")

def contact(request):
    return render(request, "plateforme/contact.html")

def credits(request):
    return render(request, "plateforme/credits.html")

def login_view(request):
    if request.method == 'POST':
        # create a form instance and populate it with data from the request:
        form = f.LoginForm(request.POST)
        # check whether it's valid:
        if form.is_valid():
            username = form['username'].value()
            password = form['password'].value()
            user = authenticate(request, username=username, password=password)
           
            if user is not None:
                log.error("authenticated")
                login(request, user)
            else:
                log.error("failed")
                
            return redirect('/')

    # if a GET (or any other method) we'll create a blank form
    else:
        form = f.LoginForm()

    return render(request, 'plateforme/index.html')

def logout_view(request):
    logout(request)
    return redirect('/')

def register_view(request):

    if request.method == 'POST':
        form = f.RegisterForm(request.POST)
        log.error(request.POST)
        if form.is_valid():
            log.error('valid')
            form.save()
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password2')

            user = authenticate(request, username=username, password=password)

            if user is not None:
                log.error("authenticated")
                login(request, user)

            ######################### mail system ####################################
            #htmly = get_template('email.html')
            #d = {'username': 'username'}
            #subject, from_email, to = 'welcome', 'planetgreenagain@outlook.com', 'fernandez27.tf@gmail.com'
            #html_content = htmly.render(d)
            ##msg = EmailMultiAlternatives(subject, html_content, from_email, [to])
            #msg.attach_alternative(html_content, "text / html")
            #msg.send()
            return redirect('/')
        else:
            log.error(form.error_messages)
            return render(request, 'plateforme/register.html',{'form':form, 'data': request.POST})

    else:
        form = f.RegisterForm()

    return  render(request, 'plateforme/register.html')
