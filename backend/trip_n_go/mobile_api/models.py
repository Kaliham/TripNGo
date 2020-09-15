from django.db import models
from django.contrib.auth.models import AbstractUser
# Create your models here.
class Post(models.Model):
    title = models.CharField(max_length=12)
    imageUrl = models.TextField()
    dateText = models.CharField(max_length=6)

    def __str__(self):
        return self.title

class CustomUser(AbstractUser):
    email = models.EmailField(
        verbose_name='email address',
        max_length=255,
        unique=True,
    )
    handle = models.CharField(max_length=12)
    phoneNumber = models.CharField(max_length=18)
    firstName = models.CharField(max_length=12)
    active = models.BooleanField(default=True)
    staff = models.BooleanField(default=False) # a admin user; non super-user
    admin = models.BooleanField(default=False)
    USRENAME_FIELD = 'email'
    def __str__(self):
        return self.username