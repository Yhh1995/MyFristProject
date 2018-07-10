#! /usr/bin/python3
# -*- coding: utf-8 -*-
# @Time    : 18-6-25 下午6:19
# @Author  : yanhui
# @File    : views1.py
from django.http import HttpResponse


def index(request):
    return HttpResponse('hello python')
