from django.urls import path
from . import views

app_name = "plateforme"
urlpatterns = [
    path('', views.index, name='index'),
    path('contact/', views.contact, name='contact'),
    path('credits/', views.credits, name='credits')
]
