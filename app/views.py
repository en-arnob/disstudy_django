# @Author: arnob
# @Date:   2020-06-25T23:28:10+06:00
# @Last modified by:   arnob
# @Last modified time: 2020-06-28T21:16:39+06:00



from django.shortcuts import render, get_object_or_404, redirect
from django.http import HttpResponse
from .models import Discussion
from django.views.generic import ListView, DetailView, CreateView
from app.forms import SignUpForm, UpdateProfileForm
from django.contrib import messages
#from django.contrib.auth import get_user_model
from django.contrib.auth.decorators import login_required
from app.forms import PostDiscussionForm
from account.models import Account


#User = get_user_model()


# Create your views here.
@login_required(login_url='login')
def home(request):
    if request.method == 'GET':
        user_class = request.user.classid

        sql = f"SELECT * FROM app_discussion WHERE classcode = '{user_class}' order by date desc"
        discussions = Discussion.objects.raw(sql)

        form = PostDiscussionForm()
        return render(request, 'app/home.html', {'discussions':discussions,'form':form})

    else:
        form = PostDiscussionForm(request.POST)
        newdisscussion = form.save(commit=False)
        newdisscussion.author = request.user
        newdisscussion.classcode = request.user.classid
        newdisscussion.poster = request.user.username
        newdisscussion.save()
        return redirect('home')



@login_required(login_url='login')
def discussionThread(request, dis_id):
    discussion = get_object_or_404(Discussion, pk=dis_id)
    return render(request, 'app/discussionview.html', {'discussion': discussion})


def signupuser(request):
    if request.method == 'POST':
        form = SignUpForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            email = form.cleaned_data.get('email')
            classid = form.cleaned_data.get('classid')
            messages.success(request, f'account created for {username}! Log in to continue..')
            return redirect('login')
    else:
        form = SignUpForm()
    return render(request, 'app/signupuser.html', {'form':form})


@login_required(login_url='login')
def profile(request):
    user_name = request.user.username
    sql = f"SELECT * FROM app_discussion WHERE poster = '{user_name}' order by date desc"
    discussions = Discussion.objects.raw(sql)

    return render(request, 'app/profile.html', {'discussions':discussions})

@login_required(login_url='login')
def deletedis(request, dis_id):
    discussion = Discussion.objects.get(pk=dis_id)
    if request.method == 'POST':
        discussion.delete()
        return redirect('profile')
    return redirect('profile')


@login_required(login_url='login')
def updatedis(request, dis_id):
    if request.method == 'POST':
        discussion = Discussion.objects.get(pk=dis_id)
        form = PostDiscussionForm(request.POST, instance=discussion)
        if form.is_valid():
            form.save()
            return redirect('profile')
    else:
        discussion = Discussion.objects.get(pk=dis_id)
        form = PostDiscussionForm(instance=discussion)

    return render(request,'app/updatepost.html',{'discussion': discussion, 'form':form})

@login_required(login_url='login')
def update_profile(request):
    user = request.user
    form = UpdateProfileForm(instance=user)

    if request.method == 'POST':
        form = UpdateProfileForm(request.POST, request.FILES, instance=user)
        if form.is_valid():
            form.save()


    context = {'form': form}
    return render(request, 'app/update_profileview.html', context)

def search(request):
    if request.method == 'GET':
        search = request.GET.get('search')
        query = "'%"+search+"%'"
        user_class = request.user.classid
        sql = f"SELECT * FROM app_discussion WHERE classcode = '{user_class}' AND title LIKE {query} order by date desc"
        discussions = Discussion.objects.raw(sql)
        #discussions_filtered = discussions.filter(title__icontains=search)
        #discussions = Discussion.objects.all().filter(title__icontains=search)
        context = {'discussions': discussions}
        return render(request, 'app/searchview.html', context)

    





