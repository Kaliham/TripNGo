from django.db import models

class Trip(models.Model):
    title = models.CharField(max_length=36)
    imageUrl = models.TextField()
    dateText = models.CharField(max_length=9)
    phoneNumber = models.CharField(max_length=18)
    limit = models.IntegerField(default=0)

    def __str__(self):
        return self.title