# Generated by Django 3.1.1 on 2020-09-15 17:51

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mobile_api', '0007_auto_20200915_1726'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='user',
            name='id',
        ),
        migrations.AddField(
            model_name='user',
            name='userId',
            field=models.AutoField(default=100000000, primary_key=True, serialize=False),
        ),
    ]