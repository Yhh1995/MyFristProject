# coding=utf-8
from django.shortcuts import render
from django.db.models import Max, F, Q
from models import *


def index(request):
    # list = BookInfo.books1.filter(heroinfo__hcontent__contains='六')
    # list = BookInfo.books1.filter(pk__lte=3)
    # Max1= BookInfo.books1.aggregate(Max('bpub_date'))
    # list = BookInfo.books1.filter(bread__gt=F('bcommet'))
    # list = BookInfo.books1.filter(pk__lt=6, btitle__contains='八')
    list = BookInfo.books1.filter(Q(pk__lt=4) | Q(bcommet__gt=10))
    context = {'list1': list
               # ,'Max1' : Max1
               }
    return render(request, 'booktest/index.html', context)
