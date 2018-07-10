from django.conf.urls import url
import views

urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^(\d+)$', views.show, name='show'),
    url(r'^index2$', views.index2, name='index2')
]
