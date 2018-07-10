from django.shortcuts import render
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
