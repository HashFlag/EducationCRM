
from django.contrib import admin
from django.urls import path,include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('crm/',include("crm.urls")),
    path('student/',include("student.urls")),
    path('king_admin/',include("king_admin.urls"))
]
