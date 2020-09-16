from django.shortcuts import render
from django.http import JsonResponse

from rest_framework.decorators import api_view
from rest_framework.response import Response
from .serializers import TripsSerializer,UsersSerializer,GroupsSerializer,ItemsSerializer,UserCreationSerializer

from .modelinfo.trip import Trip,Item,Offer
from .modelinfo.group import Group
from .models import User,UserManager
from .model_form import UserForm

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

@api_view(['Post'])
def createAccount(request):
    serializer = UserCreationSerializer(data = request.data)
    print(request.data)
    if serializer.is_valid():
        # User.objects.create_user(
        #     email = request.data['email'],
        #     password = request.data['password'],
        #     phoneNumber = request.data['phoneNumber'],
        #     firstName = request.data['firstName'],
        #     lastName = request.data['lastName'],
        # )
        serializer.save()
        return Response('success')
    
    return Response('failed')
    

@api_view(['Post'])
def createTrip(request):
    serializer = TripsSerializer(data = request.data )
    if serializer.is_valid():
        serializer.save()
        return Response('success')
    return Response('failed')

@api_view(['Post'])
def createGroup(request):
    serializer = GroupsSerializer(data = request.data )
    if serializer.is_valid():
        serializer.save()
        return Response('success')
    return Response('failed')

@api_view(['Post'])
def createItems(request):
    serializer = ItemsSerializer(data = request.data )
    if serializer.is_valid():
        serializer.save()
        return Response('success')
    return Response('failed')


@api_view(['Post'])
def updateAccount(request, id):
    try:
        user = User.objects.get(id = id)
        form = UserForm(instance=user)
        form['phoneNumber']=request.data['phoneNumber']
        form.save()

        return Response('success')
    except:
        return Response('failed')
    

@api_view(['Post'])
def updateTrip(request,id):
    instance = Trip.objects.get(id = id)
    serializer = TripsSerializer(instace = instance, data = request.data )
    if serializer.is_valid():
        serializer.save()
        return Response('success')
    return Response('failed')

@api_view(['Post'])
def updateGroup(request,id):
    instance = Group.objects.get(id = id)
    serializer = GroupsSerializer(instace = instance, data = request.data )
    if serializer.is_valid():
        serializer.save()
        return Response('success')
    return Response('failed')

@api_view(['Post'])
def updateItems(request,id):
    instance = Item.objects.get(id = id)
    serializer = ItemsSerializer(instace = instance, data = request.data )
    if serializer.is_valid():
        serializer.save()
        return Response('success')
    return Response('failed')




