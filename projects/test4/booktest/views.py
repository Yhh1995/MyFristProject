# coding=utf-8
from django.shortcuts import render
from django.http import HttpResponse
from models import *


def index(request):
    # hero = HeroInfo.objects.get(pk=1)
    # context = {'hero': hero}

    list = HeroInfo.objects.filter(isDelete=False)
    context = {'list': list}
    return render(request, 'booktest/index.html', context)


def show(request, id):
    context = {'id': id}
    return render(request, 'booktest/show.html', context)


def index2(request):
    return render(request, 'booktest/index2.html')


def user1(request):
    context = {'uname': 'mypage'}
    return render(request, 'booktest/user1.html', context)


def user2(request):
    return render(request, 'booktest/user2.html')


# html转义
def htmlTest(request):
    context = {'t1': '<h1>123</h1>'}
    return render(request, 'booktest/htmlTest.html', context)


# csrf
def csfr1(request):
    return render(request, 'booktest/csrf1.html')


def csfr2(request):
    uname = request.POST['uname']
    return HttpResponse(uname)
