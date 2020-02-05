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
        field_obj = obj._meta.get_field(column) #获取数据
        if field_obj.choices: #判断是否为空
            column_data = getattr(obj,"get_%s_display"%(column))() #解决source显示数字的问题
        else:
            column_data = getattr(obj,column)
        row_ele += "<td>%s</td>"%(column_data)
    return mark_safe(row_ele)

@register.simple_tag
def render_page_ele(loop_counter,query_sets,filter_condtions):
    filters = ''
    for k,v in filter_condtions.items():
        filters += "&%s=%s" %(k,v)
    # 代表这是前2页 or 最后2页的显示
    if loop_counter<3 or loop_counter > query_sets.paginator.num_pages-2 :
        ele_class = ""
        # query_sets.number 是后台获取的当前的page页的页数；
        # loop_counter是循环的query_sets.paginator.page_range的页数
        if query_sets.number == loop_counter:
            ele_class = "active"
        ele = '''<li class="%s"><a href="?page=%s%s">%s</a></li>''' %(ele_class,loop_counter,filters,loop_counter)
        return mark_safe(ele)
    #显示中间的页数
    if abs(query_sets.number - loop_counter) <= 1:
        ele_class = ""
        if query_sets.number == loop_counter:
            ele_class = "active"
        #filters实现检索后页面的数据的分页
        ele = '''<li class="%s"><a href="?page=%s%s">%s</a></li>''' %(ele_class,loop_counter,filters,loop_counter)
        return mark_safe(ele)
    else:
        return '...'
    return ''

@register.simple_tag
def render_filter_ele(condtion,admin_class,filter_condtions):
    select_ele = ''' <select class="form-control" name='%s'><option value=''>----</options> ''' %condtion
    field_obj = admin_class.model._meta.get_field(condtion)
    if field_obj.choices:
        selected = ''
        for choice_item in field_obj.choices: #获取数据
            #print("choice",choice_item,filter_condtions.get(condtion),type(filter_condtions.get(condtion)))
            if filter_condtions.get(condtion) == str(choice_item[0]):#转换成字符串
                selected = "selected"
            select_ele += '''<option value="%s" %s>%s</option>'''%(choice_item[0],selected,choice_item[1])
            selected = ''
    if type(field_obj).__name__ == "ForeignKey":
        selected = ''
        for choice_item in field_obj.get_choices()[1:]:
            if filter_condtions.get(condtion) == str(choice_item[0]):
                selected = "selected"
            select_ele += '''<option value="%s" %s>%s</options>'''%(choice_item[0],selected,choice_item[1])
            selected = ''
    select_ele += "</select>"
    return mark_safe(select_ele)











