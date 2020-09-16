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

class ItemsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Item
        fields = "__all__"

class TripsSerializer(serializers.ModelSerializer):
    group = GroupsSerializer(many=False, read_only=True)
    items = ItemsSerializer(source="item_set",many=True)
    
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
        fields = '__all__'

class FriendsSerializer(serializers.ModelSerializer):
    friends = UsersSerializer(many=True,read_only=True)
    class Meta:
        model = Friend
        fields = ('user','friends')

class UserCreationSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True)
    class Meta:
        model = User
        fields = ('email','phoneNumber','firstName','lastName','active','staff','admin','password')
    def create(self, validated_data):
        user =User.objects.create_user(
            email = validated_data['email'],
            password = validated_data['password'],
            phoneNumber = validated_data['phoneNumber'],
            firstName = validated_data['firstName'],
            lastName = validated_data['lastName'],
        )
        user.save()
        return user