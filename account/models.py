# @Author: arnob
# @Date:   2020-06-25T21:57:28+06:00
# @Last modified by:   arnob
# @Last modified time: 2020-06-28T03:10:22+06:00



from django.db import models

from django.contrib.auth.models import AbstractBaseUser, BaseUserManager

# Create your models here.
class MyAccountManager(BaseUserManager):

    def create_user(self, email, username, classid, password=None):
        if not email:
            raise ValueError('missing email')
        if not username:
            raise ValueError('missing username')
        if not classid:
            raise ValueError('missing classid')

        user = self.model(
               email=self.normalize_email(email),
               username=username,
               classid=classid,
               )

        user.set_password(password)
        user.save(using=self._db)

        return user

    def create_superuser(self, email, username, classid, password):
        user = self.create_user(
               email=self.normalize_email(email),
               username=username,
               password=password,
               classid=classid,
               )
        user.is_admin = True
        user.is_staff = True
        user.is_superuser = True
        user.save(using=self._db)

        return user





class Account(AbstractBaseUser):
    email = models.EmailField(verbose_name='email', max_length=60, unique=True)
    username = models.CharField(max_length=30, unique=True)
    classid = models.CharField(max_length=10)
    profile_pic = models.ImageField(default='default-avatar.jpg', null=True, blank=True)
    university = models.CharField(max_length=150, null=True, blank=True)
    department = models.CharField(max_length=100, null=True, blank=True)
    section = models.CharField(max_length=10, null=True, blank=True)
    date_joined = models.DateTimeField(verbose_name='date joined', auto_now_add=True)
    last_login = models.DateTimeField(verbose_name='last login', auto_now_add=True)
    is_admin = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)
    is_superuser = models.BooleanField(default=False)


    USERNAME_FIELD = 'username'
    REQUIRED_FIELDS = ['email', 'classid']

    objects = MyAccountManager()


    def __str__(self):
        return self.username

    def has_perm(self, perm, obj=None):
        return self.is_admin
    def has_module_perms(self, app_label):
        return True
