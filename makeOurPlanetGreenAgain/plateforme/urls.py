from django.urls import path
from . import views

app_name = "plateforme"
urlpatterns = [
    path('', views.index, name='index'),
    path('contact/', views.contact, name='contact'),
    path('credits/', views.credits, name='credits'),
    path('auth/', views.login_view, name='login_view'),
    path('logout/', views.logout_view, name='logout_view'),
    path('register/', views.register_view, name='register_view'),
    path('search/', views.search, name='search')
]
