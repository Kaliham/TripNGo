from django.db import models

class Trip(models.Model):
    title = models.CharField(max_length=12)
    imageUrl = models.TextField()
    dateText = models.CharField(max_length=9)
    phoneNumber = models.CharField(max_length=18)

    def __str__(self):
        return self.title