# coding=utf-8
from django.db import models


class UserInfo(models.Model):
    uname = models.CharField(max_length=20)
    upwd = models.CharField(max_length=40)
    uemail = models.CharField(max_length=30)
    ushou = models.CharField(max_length=20, default='')
    uaddress = models.CharField(max_length=100, default='')
    uyoubian = models.CharField(max_length=7, default='')
    uphone = models.CharField(max_length=11, default='')

    def __str__(self):
        return self.uname

    # default,blank是python层面的约束，不影响数据库表结构
    class Meta:
        verbose_name = '用户信息'
        verbose_name_plural = '用户信息'