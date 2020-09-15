from rest_framework import serializers
from .modelinfo.trip import Trip
from .models import User

class TripsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Trip
        fields = '__all__'

class UsersSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = '__all__'