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
    def __new__(cls,*args,**kwargs): #new方法是在构造函数__init__之前执行(cls相当于self)
         #base_fields是一个字典,关于前端样式的
        for field_name,field_obj in cls.base_fields.items():
            field_obj.widget.attrs['class'] = 'form-control'
        return ModelForm.__new__(cls) #相当于继承
    class Meta:
        model = admin_class.model
        fields = "__all__"
    attrs = {"Meta":Meta}
    _model_form_class = type("DynamicModelForm",(ModelForm,),attrs) #创建类的特殊的方法
    setattr(_model_form_class,"__new__",__new__) #创建一个新的属性
    return _model_form_class












