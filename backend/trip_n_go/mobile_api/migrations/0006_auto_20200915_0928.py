# Generated by Django 3.1.1 on 2020-09-15 09:28

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('mobile_api', '0005_auto_20200915_0928'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='CustomUser',
            new_name='User',
        ),
    ]