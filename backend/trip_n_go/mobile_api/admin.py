from django.contrib import admin

# Register your models here.

from .models import Post
from .models import User
from .modelinfo.trip import Trip
from .modelinfo.group import Group

admin.site.register(Post)
admin.site.register(Trip)
admin.site.register(User)
admin.site.register(Group)