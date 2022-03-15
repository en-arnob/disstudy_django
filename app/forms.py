# @Author: arnob
# @Date:   2020-06-26T16:01:02+06:00
# @Last modified by:   arnob
# @Last modified time: 2020-06-28T03:10:53+06:00


from django import forms
from account.models import Account
from django.contrib.auth.forms import UserCreationForm
from django.forms import ModelForm
from .models import Discussion


class SignUpForm(UserCreationForm):
    class Meta:
      model = Account
      fields = ('username', 'email', 'classid', 'password1', 'password2')


class PostDiscussionForm(ModelForm):

    post = forms.CharField(widget=forms.Textarea(attrs={'rows': 2, 'cols': 40}))
    class Meta:
        model = Discussion
        fields = ['title', 'post']

class UpdateProfileForm(ModelForm):
    class Meta:
        model = Account
        fields = ('email', 'classid', 'university', 'department', 'section', 'profile_pic')
