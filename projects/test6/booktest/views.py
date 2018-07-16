# coding=utf-8
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


# 自定义编辑器
def htmlEditor(request):
    return render(request,'booktest/htmlEditer.html')


def htmlEditorHandel(request):
    html = request.POST['hcontent']
    test1 = Test1.objects.get(pk=1)
    test1.content = html
    test1.save()
    context = {'content': html}
    return render(request, 'booktest/htmlShow.html', context)

