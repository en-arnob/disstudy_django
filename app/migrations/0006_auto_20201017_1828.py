# Generated by Django 3.1 on 2020-10-17 18:28

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0005_discussion_poster'),
    ]

    operations = [
        migrations.AlterField(
            model_name='discussion',
            name='poster',
            field=models.CharField(max_length=30),
        ),
    ]