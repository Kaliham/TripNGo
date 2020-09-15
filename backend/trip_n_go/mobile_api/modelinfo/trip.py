from django.db import models
from datetime import datetime

from .group import Group
from mobile_api.models import User

class Trip(models.Model):
    title = models.CharField(max_length=36)
    imageUrl = models.TextField()
    date = models.DateField(default=datetime.now)
    time = models.CharField(max_length=7,default='00:00Am')
    phoneNumber = models.CharField(max_length=18)
    group = models.ForeignKey(Group, on_delete=models.DO_NOTHING,blank=True)
    active = models.BooleanField(default=True)
    budget = models.DecimalField(max_digits=6,decimal_places=2,default=0.0)
    location = models.TextField()
    def __str__(self):
        return self.title

class Offer(models.Model):
    offerId = models.CharField(max_length=8, default="#1234567")
    title = models.CharField(max_length=36)
    description = models.TextField()
    imageUrl = models.TextField()
    callNumber = models.CharField(max_length=18,default='#')
    avaibleQuantity = models.IntegerField(default=0 )
    date = models.DateField(default=datetime.now)
    time = models.CharField(max_length=7,default='00:00Am')
    active = models.BooleanField(default=True)
    price = models.DecimalField(max_digits=6,decimal_places=2,default=0.0)
    recommendedAge = models.CharField(max_length=8,default="1+")

    def __str__(self):
        return self.title

class Item(models.Model):
    title = models.CharField(max_length=32)
    imageUrl = models.TextField()
    assignedTo = models.ForeignKey(User)
    price = models.DecimalField(max_digits=6,decimal_places=2,default=0.0)

    def __str__(self):
        return self.title
