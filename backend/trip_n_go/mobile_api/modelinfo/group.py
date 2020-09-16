from django.db import models

from ..models import User

class Group(models.Model):
    groupName = models.CharField(max_length=21)
    participants = models.ManyToManyField(User)
    def __str__(self):
        return self.groupName