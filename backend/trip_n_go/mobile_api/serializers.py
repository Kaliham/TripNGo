from rest_framework import serializers
from .modelinfo.trip import Trip,Offer,Item
from .models import User
from .modelinfo.group import Group


class UsersSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = '__all__'

class GroupsSerializer(serializers.ModelSerializer):
    participants = UsersSerializer(many=True, read_only=True)

    class Meta:
        model = Group
        fields = ('id','groupName','participants')

class ItemsSerialzier(serializers.ModelSerializer):
    class Meta:
        model = Item
        fields = "__all__"

class TripsSerializer(serializers.ModelSerializer):
    group = GroupsSerializer(many=False, read_only=True)
    Items = ItemsSerialzier(many=True)
    class Meta:
        model = Trip
        fields = (
            'title',
            'imageUrl',
            'date',
            'time',
            'phoneNumber',
            'group',
            'active',
            'budget',
            'location',
            'link',
            'Items',
        )

class OffersSerializer(serializers.ModelSerializer):
    class Meta:
        model = Offer 
        fields = "__all__"

