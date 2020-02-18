from django.shortcuts import render,HttpResponse,redirect
from django.contrib.auth.decorators import login_required
from crm import forms
from crm import models
from EducationCRM import settings
from django.db import IntegrityError
import os
import random,string
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
    ''' 学员报名，生成报名链接 '''
    customer_obj = models.Customer.objects.get(id=customer_id)
    msgs = {}
    if request.method == "POST":
        enroll_form = forms.EnrollmentFrom(request.POST)
        if enroll_form.is_valid():
            msg = '''请将此链接发送给客户进行填写,此链接20分钟内有效
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
                if enroll_obj.contract_aggred: #学生已经同意
                    return redirect("/crm/contract_review/%s/"%enroll_obj.id)
                enroll_form.add_error("__all__","该用户的词条报名信息已存在，不能重复创建。")
                random_str = "".join(random.sample(string.ascii_lowercase+string.digits,8))
                #cache.set(enroll_obj.id,random_str,1200)#以enroll_obj.id为键，random_str为值
                msgs["msg"] = msg.format(enroll_obj_id=enroll_obj.id,random_str=random_str)
    else:
        enroll_form = forms.EnrollmentFrom()
    return render(request,"sales/enrollment.html",{"enroll_form":enroll_form,
                                                   "customer_obj":customer_obj,
                                                   "msgs":msgs})

def stu_registrations(request,enroll_id,random_str):
    ''' 学员报名 '''
    if True:#cache.get(enroll_id)==random_str:
        enroll_obj = models.Enrollment.objects.get(id=enroll_id)
        if request.method == "POST":
            if request.is_ajax(): #ajax传输数据
                #print("ajax post:",request.FILES)
                enroll_data_dir = "%s/%s"%(settings.ENROLLED_DATA,enroll_id)
                if not os.path.exists(enroll_data_dir): #判断路径是否存在
                    os.makedirs(enroll_data_dir,exist_ok=True) #不存在就创建，exist_ok=True存在就不创建
                for k,file_obj in request.FILES.items():
                    with open("%s/%s"%(enroll_data_dir,file_obj.name),'wb+') as f:
                        for chunk in file_obj.chunks():
                            f.write(chunk)
                return HttpResponse("success")
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

@login_required
def contract_review(request,enroll_id):
    ''' 合同审核 '''
    enroll_obj = models.Enrollment.objects.get(id=enroll_id)
    enroll_form = forms.EnrollmentFrom(instance=enroll_obj)
    customer_form = forms.CustomerForm(instance=enroll_obj.customer)
    return render(request, "sales/contract_review.html", {"enroll_obj":enroll_obj,
                                                          "enroll_form":enroll_form,
                                                          "customer_form":customer_form})

@login_required
def enrollment_rejection(request,enroll_id):
    ''' 合同驳回 '''
    enroll_obj = models.Enrollment.objects.get(id=enroll_id)
    enroll_obj.contract_aggred = False
    enroll_obj.save()
    return redirect("/crm/customer/%s/enrollment/"%enroll_obj.customer.id)

@login_required
def payment(request,enroll_id):
    ''' 学员缴费 '''
    enroll_obj = models.Enrollment.objects.get(id=enroll_id)
    errors = []
    if request.method == "POST":
        payment_amount=request.POST.get("amount")
        if payment_amount:
            payment_amount = int(payment_amount)
            if payment_amount<500:
                errors.append("缴费金额不得低于500元")
            else:
                payment_obj = models.Payment.objects.create(
                    customer=enroll_obj.customer,
                    course=enroll_obj.enrolled_class.course,
                    amount=payment_amount,
                    consultant=enroll_obj.consultant
                )
                enroll_obj.contract_approved = True
                enroll_obj.save()
                enroll_obj.customer.status = 0
                enroll_obj.customer.save()
                return redirect("/king_admin/crm/customer/")
        else:
            errors.append("请输入金额")
    return render(request,"sales/payment.html",{"enroll_obj":enroll_obj,
                                                "errors":errors})



















