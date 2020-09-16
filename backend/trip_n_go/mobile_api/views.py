from django.shortcuts import render
from django.http import JsonResponse

from rest_framework.decorators import api_view
from rest_framework.response import Response
from .serializers import TripsSerializer,UsersSerializer,GroupsSerializer

from .modelinfo.trip import Trip
from .modelinfo.group import Group
from .models import User

# Create your views here.

@api_view(['Get'])
def apiOverview(request):
    apiOVList = {
        'Get User':'/users',
        'Get trips':'/trips/<str:id>',
        'Get Friends':'/friends/<str:id>',
        'Get Groups':'/groups/<str:id>',
        'Get Offers':'/offers',
        'Get ':'',
    }
    return Response(apiOVList)

@api_view(['Get'])
def getTrips(request):
    trips = Trip.objects.all()
    serializer = TripsSerializer(trips, many=True)
    return Response(serializer.data)

@api_view(['Get'])
def getUsers(request):
    users = User.objects.all()
    serializer = UsersSerializer(users, many=True)
    return Response(serializer.data)

@api_view(['Get'])
def getGroups(request):
    groups = Group.objects.all()
    serializer = GroupsSerializer(groups, many=True)
    return Response(serializer.data)