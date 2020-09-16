from rest_framework import serializers
from .modelinfo.trip import Trip,Offer,Item
from .models import User
from .modelinfo.group import Group
from .modelinfo.friend import  Friend


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
    items = ItemsSerialzier(source="item_set",many=True)
    
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
            'items',
        )

class OffersSerializer(serializers.ModelSerializer):
    class Meta:
        model = Offer 
        fields = ('title','imageUrl','assignedTo','Price')

class FriendsSerializer(serializers.ModelSerializer):
    friends = UsersSerializer(many=True,read_only=True)
    class Meta:
        model = Friend
        fields = ('user','friends')