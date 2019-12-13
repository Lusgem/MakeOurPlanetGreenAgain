from django.urls import path
from . import views

app_name = 'projet'
urlpatterns = [
    path('', views.index, name='index'),
    path('<int:projet_id>/', views.detail, name='detail')
]
