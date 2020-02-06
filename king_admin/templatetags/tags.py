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

#数据展示
@register.simple_tag
def get_query_sets(admin_class):
    return admin_class.model.objects.all() #admin_class.model == models.Customer 取出所有的对象

#检索数据展示
@register.simple_tag
def build_table_row(obj,admin_class):
    row_ele = ""
    for column in admin_class.list_display:
        field_obj = obj._meta.get_field(column) #获取数据
        if field_obj.choices: #判断是否为空
            column_data = getattr(obj,"get_%s_display"%(column))() #解决tbody中source显示数字的问题
        else:
            column_data = getattr(obj,column)
        row_ele += "<td>%s</td>"%(column_data)
    return mark_safe(row_ele)

#分页
@register.simple_tag
def build_paginators(query_sets,filter_condtions,previous_orderby):
    ''' 返回整个分页元素 '''
    page_btns = ""
    filters = ''
    for k, v in filter_condtions.items():
        filters += "&%s=%s" % (k, v)
    #标志位
    added_dot_ele = False
    for page_num in query_sets.paginator.page_range:
        #代表这是前2页 or 最后2页的显示  显示前后页：把小于或大于一页的都显示出来
        if page_num<3 or page_num>query_sets.paginator.num_pages-2 or \
                abs(query_sets.number - page_num) <= 1:
            ele_class = ""
            # query_sets.number 是后台获取的当前的page页的页数；
            if query_sets.number == page_num:
                added_dot_ele = False
                ele_class = "active"
            # filters实现检索后页面的数据的分页
            page_btns += '''<li class="%s"><a href="?page=%s%s&o=%s">%s</a></li>''' % (
            ele_class, page_num, filters,previous_orderby, page_num)
        else: #显示...
            if added_dot_ele == False:
                page_btns += '<li><a>...</a></li>'
                added_dot_ele = True
    return mark_safe(page_btns)

#信息检索选项栏
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
#排序
@register.simple_tag
def build_table_header_column(column,orderby_key,filter_condtions):
    ele = '''<th><a href="?{filters}&o={orderby_key}">{column}</a>{sort_icon}</th>'''
    filters = ''
    for k, v in filter_condtions.items():
        filters += "&%s=%s" % (k, v)
    if orderby_key: #判断orderby_key是否为None
        if orderby_key.startswith("-"):
            sort_icon='<span class="glyphicon glyphicon-chevron-up"></span>'
        else:
            sort_icon = '<span class="glyphicon glyphicon-chevron-down"></span>'
        if orderby_key.strip("-")==column: #排序的字段
            orderby_key = orderby_key
        else:        #未排序的字段
            orderby_key = column
            sort_icon = ''
    else:
        orderby_key = column
        sort_icon = ''
    ele = ele.format(orderby_key=orderby_key,filters=filters,column=column,sort_icon=sort_icon)# 格式化
    return mark_safe(ele)











