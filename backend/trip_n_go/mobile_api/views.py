from django.shortcuts import render
from django.http import JsonResponse

from rest_framework.decorators import api_view
from rest_framework.response import Response
from .serializers import TripsSerializer

from .modelinfo.trip import Trip

# Create your views here.

@api_view(['Get'])
def apiOverview(request):
    apiOVList = {'trips':'/trips'}
    return Response(apiOVList)

@api_view(['Get'])
def getTrips(request):
    trips = Trip.objects.all()
    serializer = TripsSerializer(trips, many=True)
    return Response(serializer.data)