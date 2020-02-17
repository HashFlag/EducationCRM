
from django.urls import path,re_path
from crm import views
urlpatterns = [
    path('',views.index,name="sales_index"),
    re_path('customer/(\d+)/enrollment/', views.enrollment, name='enrollment'),
    re_path('customer/registration/(\d+)/(\w+)/', views.stu_registrations, name='stu_registrations'),
    path('customers',views.customer_list,name="customer_list")
]

