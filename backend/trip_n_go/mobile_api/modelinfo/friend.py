from django.db import models
from ..models import User

class Friend (models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='user_set')
    friends = models.ManyToManyField(User, related_name='friends_set')
