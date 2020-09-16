from django.contrib import admin

# Register your models here.

from .models import Post
from .models import User
from .modelinfo.trip import Trip,Offer,Item
from .modelinfo.group import Group
from .modelinfo.friend import Friend

admin.site.register(Post)
admin.site.register(Trip)
admin.site.register(Offer)
admin.site.register(Item)
admin.site.register(User)
admin.site.register(Group)
admin.site.register(Friend)