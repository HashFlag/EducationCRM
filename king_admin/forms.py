#author：wylkjj
#date：2020/2/7
#-*- coding:utf-8 -*-
from django.forms import forms,ModelForm
from crm import models
class CustomerModelForm(ModelForm):
    class Meta:
        model = models.Customer
        fields = "__all__"

def creatr_model_form(request,admin_class):
    ''' 动态生成 MODEL FORM '''
    class Meta:
        model = admin_class.model
        fields = "__all__"
    attrs = {"Meta":Meta}
    _model_form_class = type("DynamicModelForm",(ModelForm,),attrs) #创建类的特殊的方法
    return _model_form_class












