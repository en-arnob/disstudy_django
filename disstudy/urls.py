# @Author: arnob
# @Date:   2020-06-25T21:51:59+06:00
# @Last modified by:   arnob
# @Last modified time: 2020-06-28T03:11:31+06:00



"""disstudy URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from app import views as app_views
from django.contrib.auth import views as auth_views

from django.conf import settings
from django.conf.urls.static import static

#heroku
from django.views.static import serve
from django.conf.urls import url

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', app_views.home, name='home'),
    path('posts/<int:dis_id>/', app_views.discussionThread, name='discussionThread'),

    path('signup/', app_views.signupuser, name='signupuser'),
    path('profile/', app_views.profile, name='profile'),
    path('login/', auth_views.LoginView.as_view(template_name='auth/login.html'), name='login'),
    path('logout/', auth_views.LogoutView.as_view(template_name='auth/logout.html'), name='logout'),
    path('delete/<int:dis_id>/', app_views.deletedis, name='delete'),
    path('updatepost/<int:dis_id>/', app_views.updatedis, name='updatepost'),
    path('updateprofile/', app_views.update_profile, name='updateprofile'),
    path('search/', app_views.search, name='search'),
]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
