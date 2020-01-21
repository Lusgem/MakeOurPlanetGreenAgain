from django.urls import path
from . import views

app_name = 'projet'
urlpatterns = [
    path('', views.index, name='index'),
    path('<int:project_id>/', views.detail, name='detail'),
    path('add/', views.add, name='add'),
    path('validate/<int:project_id>/', views.validate, name='validate')
]
