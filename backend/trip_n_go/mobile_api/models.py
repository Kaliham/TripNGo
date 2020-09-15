from django.db import models
from django.contrib.auth.models import (AbstractBaseUser,BaseUserManager)
# Create your models here.
class Post(models.Model):
    title = models.CharField(max_length=12)
    imageUrl = models.TextField()
    dateText = models.CharField(max_length=6)

    def __str__(self):
        return self.title

class UserManager(BaseUserManager):
    def create_user(self, email, password, phoneNumber ="#",firstName="#", lastName="#"):
        """
        Creates and saves a User with the given email and password.
        """
        if not email:
            raise ValueError('Users must have an email address')

        user = self.model(
            email=self.normalize_email(email),
        )
        user.firstName = firstName
        user.lastName = lastName
        user.phoneNumber = phoneNumber
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_staffuser(self, email, password,  phoneNumber ="#",firstName="#", lastName="#"):
        """
        Creates and saves a staff user with the given email and password.
        """
        user = self.create_user(
            email,
            password=password,
            phoneNumber = phoneNumber,
            firstName = firstName,
            lastName = lastName,
        )
        user.staff = True
        user.save(using=self._db)
        return user

    def create_superuser(self, email, password, phoneNumber ="#",firstName="#", lastName="#"):
        """
        Creates and saves a superuser with the given email and password.
        """
        user = self.create_user(
            email,
            password = password,
            phoneNumber = phoneNumber,
            firstName = firstName,
            lastName = lastName,
        )
        user.staff = True
        user.admin = True
        user.save(using=self._db)
        return user

class User(AbstractBaseUser):
    userId= models.AutoField(primary_key=True,default=100000001)
    email = models.EmailField(
        verbose_name='email address',
        max_length=255,
        unique=True,
    )

    phoneNumber = models.CharField(max_length = 18, default = '#')
    firstName = models.CharField(max_length = 16, default = '')
    lastName = models.CharField(max_length = 16, default = '')

    active = models.BooleanField(default = True)
    staff = models.BooleanField(default = False) # a admin user; non super-user
    admin = models.BooleanField(default = False)

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = [] 
    objects = UserManager()

    def get_full_name(self):
        # The user is identified by their email address
        return self.firstName+" "+self.lastName

    def get_short_name(self):
        # The user is identified by their email address
        return self.firstName

    def __str__(self):              # __unicode__ on Python 2
        return self.email

    def has_perm(self, perm, obj=None):
        "Does the user have a specific permission?"
        # Simplest possible answer: Yes, always
        return True

    def has_module_perms(self, app_label):
        "Does the user have permissions to view the app `app_label`?"
        # Simplest possible answer: Yes, always
        return True

    @property
    def is_staff(self):
        "Is the user a member of staff?"
        return self.staff

    @property
    def is_admin(self):
        "Is the user a admin member?"
        return self.admin

    @property
    def is_active(self):
        "Is the user active?"
        return self.active