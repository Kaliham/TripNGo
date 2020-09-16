from django.urls import path
from . import views

urlpatterns = [
    path('', views.apiOverview, name ='API-Overview'),
    path('trips', views.getTrips, name ='get-Trips'),
    path('users', views.getUsers, name = 'Get-User'),
    path('groups', views.getGroups, name = 'Get-Group'),
]
