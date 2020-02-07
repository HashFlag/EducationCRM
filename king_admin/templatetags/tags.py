#author：wylkjj
#date：2020/2/3
#-*- coding:utf-8 -*-
from django import template
from django.utils.safestring import mark_safe
from django.utils.timezone import datetime,timedelta
#timezone表示使用此软件的时间
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
def build_table_row(request,obj,admin_class):
    row_ele = ""
    for index,column in enumerate(admin_class.list_display):
        field_obj = obj._meta.get_field(column) #获取数据
        if field_obj.choices: #判断是否为空
            column_data = getattr(obj,"get_%s_display"%(column))() #解决tbody中source显示数字的问题
        else:
            column_data = getattr(obj,column)
        if type(column_data).__name__ == "datetime": #处理时间的显示
             column_data = column_data.strftime("%Y-%m-%d %H:%M:%S")
        if index == 0: #add a tag, 可以跳转到修改页
            column_data = '<a href="{request_path}{obj_id}/change/">{data}</a>'\
                .format(request_path=request.path,obj_id=obj.id,data=column_data)
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
def render_filter_ele(filter_field,admin_class,filter_condtions):
    #select_ele = ''' <select class="form-control" name='%s'><option value=''>----</options> ''' %filter_field
    select_ele = ''' <select class="form-control" name='{filter_field}'><option value=''>----</options> '''

    field_obj = admin_class.model._meta.get_field(filter_field) #数据的对象
    if field_obj.choices:
        selected = ''
        for choice_item in field_obj.choices: #获取数据
            #print("choice",choice_item,filter_condtions.get(filter_field),type(filter_condtions.get(filter_field)))
            if filter_condtions.get(filter_field) == str(choice_item[0]):#转换成字符串
                selected = "selected"
            select_ele += '''<option value="%s" %s>%s</option>'''%(choice_item[0],selected,choice_item[1])
            selected = ''
    if type(field_obj).__name__ == "ForeignKey":
        selected = ''
        for choice_item in field_obj.get_choices()[1:]:
            if filter_condtions.get(filter_field) == str(choice_item[0]):
                selected = "selected"
            select_ele += '''<option value="%s" %s>%s</options>'''%(choice_item[0],selected,choice_item[1])
            selected = ''
    if type(field_obj).__name__ in ["DateField","DateTimeField"]:
        today_ele = datetime.now().date() #datetime.now()获取当前时间，.date()只取出年月日
        date_els = []
        date_els.append(['今天',today_ele])
        date_els.append(['昨天',today_ele - timedelta(days=1)])
        date_els.append(['近7天',today_ele - timedelta(days=7)])
        date_els.append(['本月',today_ele.replace(day=1)]) #近月初到现在
        date_els.append(['近30天',today_ele - timedelta(days=30)])
        date_els.append(['近90天',today_ele - timedelta(days=90)])
        date_els.append(['近180天',today_ele - timedelta(days=180)])
        date_els.append(['本年',today_ele.replace(month=1,day=1)]) # 近年初到现在
        date_els.append(['近一年',today_ele - timedelta(days=365)])
        selected = ''
        for item in date_els:
            select_ele += '''<option value="%s" %s>%s</options>''' % (item[1], selected, item[0])
        filter_field_name = "%s__gte"%filter_field
    else:
        filter_field_name = filter_field
    select_ele += "</select>"
    select_ele = select_ele.format(filter_field=filter_field_name)
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











