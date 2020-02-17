from django.shortcuts import render,HttpResponse
from django.contrib.auth.decorators import login_required
from crm import forms
from crm import models
import random,string
from django.db import IntegrityError
from django.core.cache import cache

# Create your views here.
@login_required
def index(request):
    return render(request,"index.html")

@login_required
def customer_list(request):
    return render(request,"sales/customers.html")

@login_required
def enrollment(request,customer_id):
    customer_obj = models.Customer.objects.get(id=customer_id)
    msgs = {}
    if request.method == "POST":
        enroll_form = forms.EnrollmentFrom(request.POST)
        if enroll_form.is_valid():
            msg = '''请将此链接发送给客户进行填写
                http://localhost:8000/crm/customer/registration/{enroll_obj_id}/{random_str}/'''
            try:
                enroll_form.cleaned_data["customer"] = customer_obj
                enroll_obj = models.Enrollment.objects.create(**enroll_form.cleaned_data)
                msgs["msg"] = msg.format(enroll_obj_id=enroll_obj.id)
            except IntegrityError as e:
                #因为是联合唯一索引，所以搜索条件要用两条
                enroll_obj = models.Enrollment.objects.get(customer_id = customer_obj.id,
                                                           enrolled_class_id=
                                                           enroll_form.cleaned_data['enrolled_class'].id)
                enroll_form.add_error("__all__","该用户的词条报名信息已存在，不能重复创建。")
                random_str = "".join(random.sample(string.ascii_lowercase+string.digits,8))
                cache.set(enroll_obj.id,random_str,20)#以enroll_obj.id为键，random_str为值
                msgs["msg"] = msg.format(enroll_obj_id=enroll_obj.id,random_str=random_str)
    else:
        enroll_form = forms.EnrollmentFrom()
    return render(request,"sales/enrollment.html",{"enroll_form":enroll_form,
                                                   "customer_obj":customer_obj,
                                                   "msgs":msgs})
@login_required
def stu_registrations(request,enroll_id,random_str):
    if cache.get(enroll_id)==random_str:
        enroll_obj = models.Enrollment.objects.get(id=enroll_id)
        if request.method == "POST":
            customer_form = forms.CustomerForm(request.POST,instance=enroll_obj.customer)#数据补充
            #把要修改的对象通过instance传入form组件中必须为本类的对象
            if customer_form.is_valid():
                customer_form.save()
                enroll_obj.contract_aggred = True
                enroll_obj.save()
                return render(request,"sales/stu_registration.html",{"status":1})
        else:
            if enroll_obj.contract_aggred == True:
                status = 1
            else:
                status = 0
            customer_form = forms.CustomerForm(instance=enroll_obj.customer)
        return render(request,"sales/stu_registration.html",
                      {"customer_form":customer_form,
                       "enroll_obj":enroll_obj,
                       "status":status})
    else:
        return HttpResponse("<h2>链接已超时！</h2>")








