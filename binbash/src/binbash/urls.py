"""binbash URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.10/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin
import bashbin.views

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^details/$',bashbin.views.user_details),
    url(r'^cat/$',bashbin.views.cat_request),
    url(r'^ls/$',bashbin.views.ls_request),
    url(r'^help/$',bashbin.views.help_request),
    url(r'^top/$',bashbin.views.scoreboard_request),
    url(r'^request/$',bashbin.views.binbash_request),
    url(r'^filldb/$',bashbin.views.input_everything),
    url(r'^$',bashbin.views.start_page)
]
