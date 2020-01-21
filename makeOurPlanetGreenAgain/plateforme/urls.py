from django.urls import path
from . import views
from .feeds import ProjectsFeed

app_name = "plateforme"
urlpatterns = [
    path('', views.index, name='index'),
    path('contact/', views.contact, name='contact'),
    path('credits/', views.credits, name='credits'),
    path('auth/', views.login_view, name='login_view'),
    path('logout/', views.logout_view, name='logout_view'),
    path('register/', views.register_view, name='register_view'),
    path('latest/feed/', ProjectsFeed(), name='rss_view'),
    path('add_to_cart/', views.cookie_add_to_cart, name='add_to_cart'),
    path('remove_from_cart/', views.cookie_remove_from_cart, name='remove_from_cart'),
    path('checkout/',views.checkout_view,name="checkout_view"),
    path('checkout_fund/',views.checkout_fund,name="checkout_fund"),
    path('search/', views.search, name='search'),
    path('profile/', views.profile, name='profile_view')
]
