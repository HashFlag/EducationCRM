#author:wylkjj
#date:2020/2/17
#-*- coding:utf-8 -*-
from django import template
register = template.Library()

@register.simple_tag
def render_enroll_contract(enroll_obj):
    return enroll_obj.enrolled_class.contract.template.\
        format(stu_name=enroll_obj.customer.name,
               stu_money=enroll_obj.enrolled_class.course.price,
               stu_phone=enroll_obj.customer.phone)

















