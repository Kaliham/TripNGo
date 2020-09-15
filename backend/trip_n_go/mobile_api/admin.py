from django.contrib import admin

# Register your models here.

from .models import Post
from .models import User
from mobile_api.modelinfo.trip import Trip

admin.site.register(Post)
admin.site.register(Trip)
admin.site.register(User)