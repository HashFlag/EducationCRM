#author：wylkjj
#date：2020/2/3
#-*- coding:utf-8 -*-
from django import template
from django.utils.safestring import mark_safe
from crm import models
#注册我们自定义的标签，只有注册过的标签，系统才能认识你，这是固定写法
register = template.Library()

@register.simple_tag
def render_app_name(admin_class):
    return admin_class.model._meta.verbose_name

@register.simple_tag
def get_query_sets(admin_class):
    return admin_class.model.objects.all() #admin_class.model == models.Customer 取出所有的对象

@register.simple_tag
def build_table_row(obj,admin_class):
    row_ele = ""
    for column in admin_class.list_display:
        field_obj = obj._meta.get_field(column) #获取数据类型
        if field_obj.choices: #判断是否为空
            column_data = getattr(obj,"get_%s_display"%(column))() #解决source显示数字的问题
        else:
            column_data = getattr(obj,column)
        row_ele += "<td>%s</td>"%(column_data)
    return mark_safe(row_ele)



