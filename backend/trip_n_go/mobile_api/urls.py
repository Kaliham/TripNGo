from django.urls import path
from . import views

urlpatterns = [
    path('', views.apiOverview, name ='API-Overview'),
    path('trips', views.getTrips, name ='get-Trips'),
    path('users', views.getUsers, name = 'Get-User'),
    path('groups/', views.getGroups, name = 'Get-Group'),
    path('offers/', views.getOffers, name = 'Get-Group'),
    path('groups/<int:id>', views.getGroupsById, name = 'Get-Group'),
    path('trips/<int:id>', views.getTripsById, name ='get-Trips'),
    path('users/create',views.createAccount, name ='Create-User'),
    path('users/update/phone/<int:id>',views.updatePhoneNumberAccount,name = 'update-users-phone'),
    path('users/update/password/<int:id>',views.updatePasswordAccount,name = 'update-users-password'),
    path('users/update/email/<int:id>',views.updateEmailAccount,name = 'update-users-email'),
    path('users/update/fname/<int:id>',views.updateFirstNameAccount,name = 'update-users-first-name'),
    path('users/update/lname/<int:id>',views.updateLastNameAccount,name = 'update-users-last-name'),
    path('users/update/Active/<int:id>',views.updateActiveAccount,name = 'update-users-active'),
    path('item/create',views.createItems)
]
