from django.db import models
from mobile_api.models import User

class Group(models.Model):
    GroupName = models.CharField(max_length=21)
    Participants = models.ManyToManyField(User)
    def __str__(self):
        return self.GroupName