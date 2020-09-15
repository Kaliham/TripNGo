from rest_framework import serializers
from .modelinfo.trip import Trip

class TripsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Trip
        fields = '__all__'