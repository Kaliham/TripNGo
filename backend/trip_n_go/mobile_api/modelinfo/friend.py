from django.db import models
from mobile_api.models import User

class Friend (models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    friends = models.ManyToManyField(User, related_name='friends_set')
