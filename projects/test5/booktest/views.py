# coding=utf-8
from django.shortcuts import render
from django.http import HttpResponse
from django.conf import settings
from django.core.paginator import *
from models import *
import os


def index(request):
    return render(request, 'booktest/index.html')


def myExp(request):
    a1 = int('aaa')
    return HttpResponse("error")


def uploadPic(request):
    return render(request, 'booktest/uploadPic.html')


def uploadHandle(request):
    pic1 = request.FILES['pic1']
    picName = os.path.join(settings.MEDIA_ROOT, pic1.name)
    with open(picName, 'w') as pic:
        for c in pic1.chunks():
            pic.write(c)
    return HttpResponse('<img src="/static/media/%s">' % pic1.name)


# 分页
def herolist(request, pindex):
    if pindex == '':
        pindex = '1'

    list = HeroInfo.objects.all()
    paginator = Paginator(list, 5)
    page = paginator.page(int(pindex))
    context = {'page': page}
    return render(request, 'booktest/herolist.html', context)


# 省市区
def area(request):
    return render(request, 'booktest/area.html')
