
from django.urls import path,re_path
from crm import views
urlpatterns = [
    path('',views.index,name="sales_index"),
    re_path('payment/(\d+)/', views.payment, name='payment'),
    re_path('contract_review/(\d+)/', views.contract_review, name='contract_review'),
    re_path('customer/(\d+)/enrollment/', views.enrollment, name='enrollment'),
    re_path('enrollment_rejection/(\d+)/', views.enrollment_rejection, name='enrollment_rejection'),
    re_path('customer/registration/(\d+)/(\w+)/', views.stu_registrations, name='stu_registrations'),
    path('customers',views.customer_list,name="customer_list")
]

