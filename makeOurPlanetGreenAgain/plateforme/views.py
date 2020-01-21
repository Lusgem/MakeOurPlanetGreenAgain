import datetime
import json

from django.db.models import QuerySet
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render
from django.shortcuts import redirect
from django.contrib.auth import authenticate, login, logout
from matplotlib.rcsetup import validate_nseq_float

from makeOurPlanetGreenAgain import settings
from . import forms as f
import logging
from django.core.mail import send_mail, BadHeaderError
from .forms import ContactForm
from projet.models import Projet
from financeurs.models import financeur, Paiement
from .models import Commentaire
from django.template.loader import render_to_string
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage

log = logging.getLogger(__name__)


def index(request):
    random_project_list = Projet.objects.order_by('?')[:5]
    context = {'random_project_list': random_project_list}
    if (request.user.is_authenticated):
        last_projects = financeur.objects.filter(utilisateur=request.user)
        paiement = Paiement.objects.order_by("date_paiement").filter(id_user=request.user.id)
        log.error(paiement.last().projet.nom)
        if paiement.count() > 0:
            comments = Commentaire.objects.filter(projet=paiement.last().projet)
            context = {'random_project_list': random_project_list, "user_last_project": paiement.last().projet,
                       "num_project": last_projects[0].projetsfinances.all().count(), "comments_project": comments,
                       "num_paiment": paiement.count()}
    return render(request, "plateforme/index.html", context)


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
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password2')

            user = authenticate(request, username=username, password=password)

            if user is not None:
                log.error("authenticated")
                login(request, user)

            ######################### mail system ####################################
            # htmly = get_template('email.html')
            # d = {'username': 'username'}
            # subject, from_email, to = 'welcome', 'planetgreenagain@outlook.com', 'fernandez27.tf@gmail.com'
            # html_content = htmly.render(d)
            # msg = EmailMultiAlternatives(subject, html_content, from_email, [to])
            # msg.attach_alternative(html_content, "text / html")
            # msg.send()
            return redirect('/')
        else:
            log.error(form.error_messages)
            return render(request, 'plateforme/register.html', {'form': form, 'data': request.POST})

    else:
        form = f.RegisterForm()

    return render(request, 'plateforme/register.html')


from itertools import chain


def checkout_view(request):
    value = request.COOKIES.get('cart_projects')

    list = ""
    if value != None:

        cookieToDict = json.loads(value.replace('\'', '\"'))

        list = cookieToDict['list']

        result = Projet.objects.none()

        for item in list:
            p = Projet.objects.filter(nom=item['0'])
            result = chain(result, p)

    context = {'cart': result}

    return render(request, "plateforme/checkout.html", context)


def search_dict(d, ksearch):
    for v in d:  # for name, age in dictionary.iteritems():  (for Python 2.x)
        if v["id"] == ksearch:
            return v["amount"]
    return 0


def checkout_fund(request):
    fundsToDict = json.loads(request.POST["data"])

    user = request.user

    cart = request.COOKIES.get('cart_projects')

    cookieToDict = json.loads(cart.replace('\'', '\"'))

    list = cookieToDict['list']

    financeur.objects.get_or_create(utilisateur=user)
    f = financeur.objects.get(utilisateur=user)
    paiementList=[]

    for item in list:
        datep=datetime.datetime.now()
        Paiement.objects.create(id_user=user.id, date_paiement=datep,
                                projet=Projet.objects.get(nom=item['0']),
                                montant=int(search_dict(fundsToDict, str(item['0']) + "_fund")))
        paiementList.append({"date_paiement": datep.__str__(), "project_name" :item['0'], "montant":int(search_dict(fundsToDict, str(item['0']) + "_fund"))})

        old_financement = int(Projet.objects.filter(nom=item['0'])[0].financement)

        new_financement = (int(search_dict(fundsToDict, str(item['0']) + "_fund"))) + old_financement

        Projet.objects.filter(nom=item['0']).update(financement=new_financement)
        f.projetsfinances.add(Projet.objects.get(nom=item['0']))
        f.save()

    # add to financeur

    # update project financement

    json_data = json.dumps({"HTTPRESPONSE": "ok", "paiements": paiementList})
    response = HttpResponse(json_data, content_type="application/json")
    return response


def set_cookie(response, key, value, days_expire=7):
    if days_expire is None:
        max_age = 365 * 24 * 60 * 60  # one year
    else:
        max_age = days_expire * 24 * 60 * 60
    expires = datetime.datetime.strftime(datetime.datetime.utcnow() + datetime.timedelta(seconds=max_age),
                                         "%a, %d-%b-%Y %H:%M:%S GMT")
    response.set_cookie(key, value, max_age=max_age, expires=expires, secure=None)


def cookie_add_to_cart(request):
    projectName = request.POST["list[projectName]"]
    projectPath = request.POST["list[projectPath]"]

    json_data = json.dumps({"HTTPRESPONSE": "ok"})
    response = HttpResponse(json_data, content_type="application/json")

    value = request.COOKIES.get('cart_projects')

    if value != None:
        log.error(value)
        cookieToDict = json.loads(value.replace('\'', '\"'))

        list = cookieToDict['list']
        list.append({'0': projectName, '1': projectPath})

        cookieToDict["list"] = list
        value = cookieToDict

    else:
        value = {"list": [{"0": projectName, "1": projectPath}]}

    set_cookie(response, "cart_projects", json.loads(json.dumps(value)))

    return response


def cookie_remove_from_cart(request):
    projectName = request.POST["name"].replace("_cart", "")
    log.error(projectName)
    value = request.COOKIES.get('cart_projects')
    if value != None:
        cookieToDict = json.loads(value.replace('\'', '\"'))
        list = cookieToDict['list']
        toRemove = ""

        for i in list:
            if i['0'] == projectName:
                toRemove = i
        if toRemove != "":
            list.remove(toRemove)

        cookieToDict['list'] = list

        value = cookieToDict

    json_data = json.dumps({"HTTPRESPONSE": "ok"})
    response = HttpResponse(json_data, content_type="application/json")

    set_cookie(response, "cart_projects", json.loads(json.dumps(value)))

    return response


def search(request):
    url_parameter = request.GET.get("q")

    if url_parameter:
        project_list = Projet.objects.filter(nom__icontains=url_parameter).order_by('-publication_date')
    else:
        project_list = Projet.objects.all().order_by('-publication_date')

    paginator = Paginator(project_list, 6)  # 6 projets par page
    page = request.GET.get('page')

    try:
        projects = paginator.page(page)
    except PageNotAnInteger:
        projects = paginator.page(1)
    except EmptyPage:
        projects = paginator.page(paginator.num_pages)

    context = {'projects': projects}

    if request.is_ajax():
        html = render_to_string(
            template_name="plateforme/projects-results.html",
            context=context
        )
        data_dict = {"html_from_view": html}

        return JsonResponse(data=data_dict, safe=False)

    return render(request, "plateforme/search.html", context)
