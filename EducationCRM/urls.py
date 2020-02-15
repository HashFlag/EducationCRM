
from django.contrib import admin
from django.urls import path,include
from EducationCRM import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('crm/',include("crm.urls")),
    path('account/login/',views.acc_login),
    path('account/logout/',views.acc_logout,name="acc_logout"),
    path('student/',include("student.urls")),
    path('king_admin/',include("king_admin.urls"))
]
