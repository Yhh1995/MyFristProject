from django.contrib import admin
from models import *


@admin.register(BookInfo)
class BookInfoAdmin(admin.ModelAdmin):
    list_display = ['btitle', 'bpub_date']


# admin .site.register(BookInfo, BookInfoAdmin)

