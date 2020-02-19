# author:wylkjj
# date:2020/2/16
# -*- coding:utf-8 -*-
from crm import models
from django.forms import ModelForm


class CustomerForm(ModelForm):
    def __new__(cls, *args, **kwargs):
        # base_fields是一个字典,关于前端样式的
        for field_name, field_obj in cls.base_fields.items():
            field_obj.widget.attrs['class'] = 'form-control'
            if field_name in cls.Meta.readonly_fields:
                field_obj.widget.attrs['disabled'] = 'disabled'
        return ModelForm.__new__(cls)  # 相当于继承

    def clean_qq(self):
        if self.instance.qq != self.cleaned_data['qq']:
            self.add_error("qq", "逗逗，还想尝试黑我")
        return self.cleaned_data['qq']

    class Meta:
        model = models.Customer
        fields = "__all__"
        # 不显示
        exclude = ['tags', 'content', 'memo', 'status', 'referral_from', 'consult_course']
        # 不能修改
        readonly_fields = ["qq", "consultant", "source"]


class EnrollmentFrom(ModelForm):
    def __new__(cls, *args, **kwargs):
        # base_fields是一个字典,关于前端样式的
        for field_name, field_obj in cls.base_fields.items():
            field_obj.widget.attrs['class'] = 'form-control'
        return ModelForm.__new__(cls)  # 相当于继承

    class Meta:
        model = models.Enrollment
        fields = ['enrolled_class', 'consultant']


class PaymentForm(ModelForm):
    def __new__(cls, *args, **kwargs):
        # base_fields是一个字典,关于前端样式的
        for field_name, field_obj in cls.base_fields.items():
            field_obj.widget.attrs['class'] = 'form-control'
        return ModelForm.__new__(cls)  # 相当于继承

    class Meta:
        model = models.Payment
        fields = "__all__"





















