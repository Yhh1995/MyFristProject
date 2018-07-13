from django.shortcuts import render
from django.http import JsonResponse
from models import *


def index(request):
    return render(request, 'booktest/index.html')


def pro(request):
    prolist = AreaInfo.objects.filter(parea__isnull=True)
    list = []
    for item in prolist:
        list.append([item.id, item.title])
    return JsonResponse({'data': list})


def city(request, id):
    citylist = AreaInfo.objects.filter(parea_id=id)
    list = []
    for item in citylist:
        list.append({'id': item.id, 'title': item.title})
    return JsonResponse({'data': list})

