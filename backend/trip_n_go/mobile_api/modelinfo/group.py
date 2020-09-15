from django.db import models
from mobile_api.models import User

class Group(models.Model):
    GroupId = models.AutoField(default=10000000,primary_key=True)
    GroupName = models.CharField(max_length=21)
    Participants = models.ManyToManyField(User)