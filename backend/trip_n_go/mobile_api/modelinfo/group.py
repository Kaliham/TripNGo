from django.db import models
from mobile_api.models import User

class Group(models.Model):
    groupName = models.CharField(max_length=21)
    participants = models.ManyToManyField(User)
    def __str__(self):
        return self.GroupName