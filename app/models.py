# @Author: arnob
# @Date:   2020-06-25T23:28:10+06:00
# @Last modified by:   arnob
# @Last modified time: 2020-06-28T03:11:06+06:00



from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User
from account.models import Account


# Create your models here.
class Discussion(models.Model):
    title = models.CharField(max_length=100)
    author = models.ForeignKey(Account, on_delete=models.CASCADE)
    poster = models.CharField(max_length=30, unique=False)
    post = models.TextField()
    date = models.DateTimeField(default=timezone.now)
    classcode = models.CharField(max_length=10)

    def __str__(self):
        return self.title + ' | ' + str(self.author)
