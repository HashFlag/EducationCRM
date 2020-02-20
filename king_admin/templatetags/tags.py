# author：wylkjj
# date：2020/2/3
# -*- coding:utf-8 -*-
from django import template
from django.utils.safestring import mark_safe
from django.utils.timezone import datetime
from django.utils.timezone import timedelta
from django.core.exceptions import FieldDoesNotExist
# timezone表示使用此软件的时间
# 注册我们自定义的标签，只有注册过的标签，系统才能认识你，这是固定写法
register = template.Library()


@register.simple_tag
def render_app_name(admin_class):
    return admin_class.model._meta.verbose_name


# 数据展示
@register.simple_tag
def get_query_sets(admin_class):
    return admin_class.model.objects.all()  # admin_class.model == models.Customer 取出所有的对象


# 检索数据展示
@register.simple_tag
def build_table_row(request, obj, admin_class):
    row_ele = ""
    for index, column in enumerate(admin_class.list_display):
        try:
            field_obj = obj._meta.get_field(column)  # 获取数据
            if field_obj.choices:  # 判断是否为空
                column_data = getattr(obj, "get_%s_display" % (column,))()  # 解决tbody中source显示数字的问题
            else:
                column_data = getattr(obj, column)
            if type(column_data).__name__ == "datetime":  # 处理时间的显示
                column_data = column_data.strftime("%Y-%m-%d %H:%M:%S")
            if index == 0:  # add a tag,可以跳转到修改页
                column_data = '<a href="{request_path}{obj_id}/change/">{data}</a>'\
                    .format(request_path=request.path, obj_id=obj.id, data=column_data)
        except FieldDoesNotExist as e:
            if hasattr(admin_class, column):
                column_func = getattr(admin_class, column)
                admin_class.instance = obj
                admin_class.request = request
                column_data = column_func()
        row_ele += "<td>%s</td>" % (column_data,)
    return mark_safe(row_ele)


# 分页
@register.simple_tag
def build_paginators(query_sets, filter_condtions, previous_orderby):
    """ 返回整个分页元素 """
    page_btns = ""
    filters = ''
    for k, v in filter_condtions.items():
        filters += "&%s=%s" % (k, v)
    # 标志位
    added_dot_ele = False
    for page_num in query_sets.paginator.page_range:
        # 代表这是前2页 or 最后2页的显示  显示前后页：把小于或大于一页的都显示出来
        if page_num < 3 or page_num > query_sets.paginator.num_pages-2 or \
                abs(query_sets.number - page_num) <= 1:
            ele_class = ""
            # query_sets.number 是后台获取的当前的page页的页数；
            if query_sets.number == page_num:
                added_dot_ele = False
                ele_class = "active"
            # filters实现检索后页面的数据的分页
            page_btns += '''<li class="%s"><a href="?page=%s%s&o=%s">%s</a></li>''' % (ele_class, page_num, filters,
                                                                                       previous_orderby, page_num)
        else:  # 显示...
            if added_dot_ele == False:
                page_btns += '<li><a>...</a></li>'
                added_dot_ele = True
    return mark_safe(page_btns)


# 信息检索选项栏内容展示
@register.simple_tag
def render_filter_ele(filter_field, admin_class, filter_condtions):
    # select_ele = ''' <select class="form-control" name='%s'><option value=''>----</options> ''' %filter_field
    select_ele = ''' <select class="form-control" name='{filter_field}'><option value=''>----</options> '''

    field_obj = admin_class.model._meta.get_field(filter_field)  # 数据的对象
    if field_obj.choices:
        selected = ''
        for choice_item in field_obj.choices:  # 获取数据
            # print("choice",choice_item,filter_condtions.get(filter_field),type(filter_condtions.get(filter_field)))
            if filter_condtions.get(filter_field) == str(choice_item[0]):  # 转换成字符串
                selected = "selected"
            select_ele += '''<option value="%s" %s>%s</option>''' % (choice_item[0], selected, choice_item[1])
            selected = ''
    if type(field_obj).__name__ == "ForeignKey":
        selected = ''
        for choice_item in field_obj.get_choices()[1:]:
            if filter_condtions.get(filter_field) == str(choice_item[0]):
                selected = "selected"
            select_ele += '''<option value="%s" %s>%s</options>''' % (choice_item[0], selected, choice_item[1])
            selected = ''
    if type(field_obj).__name__ in ["DateField", "DateTimeField"]:
        today_ele = datetime.now().date()  # datetime.now()获取当前时间，.date()只取出年月日
        date_els = list()
        date_els.append(['今天', today_ele])
        date_els.append(['昨天', today_ele - timedelta(days=1)])
        date_els.append(['近7天', today_ele - timedelta(days=7)])
        date_els.append(['本月', today_ele.replace(day=1)])  # 近月初到现在
        date_els.append(['近30天', today_ele - timedelta(days=30)])
        date_els.append(['近90天', today_ele - timedelta(days=90)])
        date_els.append(['近180天', today_ele - timedelta(days=180)])
        date_els.append(['本年', today_ele.replace(month=1,day=1)])  # 近年初到现在
        date_els.append(['近一年', today_ele - timedelta(days=365)])
        selected = ''
        for item in date_els:
            select_ele += '''<option value="%s" %s>%s</options>''' % (item[1], selected, item[0])
        filter_field_name = "%s__gte" % filter_field
    else:
        filter_field_name = filter_field
    select_ele += "</select>"
    select_ele = select_ele.format(filter_field=filter_field_name)
    return mark_safe(select_ele)


# 排序
@register.simple_tag
def build_table_header_column(column, orderby_key, filter_condtions, admin_class):
    ele = '''<th><a href="?{filters}&o={orderby_key}">{column}</a>{sort_icon}</th>'''
    filters = ''
    for k, v in filter_condtions.items():
        filters += "&%s=%s" % (k, v)
    if orderby_key:  # 判断orderby_key是否为None
        if orderby_key.startswith("-"):
            sort_icon = '<span class="glyphicon glyphicon-chevron-up"></span>'
        else:
            sort_icon = '<span class="glyphicon glyphicon-chevron-down"></span>'
        if orderby_key.strip("-") == column:  # 排序的字段
            orderby_key = orderby_key
        else:        # 未排序的字段
            orderby_key = column
            sort_icon = ''
    else:
        orderby_key = column
        sort_icon = ''
    try:
        column_verbose_name = admin_class.model._meta.get_field(column).verbose_name.upper()
    except FieldDoesNotExist as e:  # 把循环未找到的字段抛出异常特殊处理
        column_verbose_name = getattr(admin_class, column).display_name.upper()
        ele = '''<th><a href="javascript:void()">{column}</a></th>'''
    ele = ele.format(orderby_key=orderby_key, filters=filters, column=column_verbose_name,
                     sort_icon=sort_icon)  # 格式化
    return mark_safe(ele)


# 路径显示
@register.simple_tag
def get_model_name(admin_class):
    return admin_class.model._meta.verbose_name


# 递归
def recursive_related_objs_lookup(objs):
    ul_ele = "<ul>"
    for obj in objs:
        li_ele = '''<li> %s: %s </li>''' % (obj._meta.verbose_name, obj.__str__().strip("<>"))
        ul_ele += li_ele
        # for local many to many
        # print("------- obj._meta.local_many_to_many", obj._meta.local_many_to_many)
        for m2m_field in obj._meta.local_many_to_many:  # 把所有跟这个对象直接关联的m2m字段取出来了
            sub_ul_ele = "<ul>"
            m2m_field_obj = getattr(obj,m2m_field.name)  # getattr(customer, 'tags')
            for o in m2m_field_obj.select_related():  # customer.tags.select_related()
                li_ele = '''<li> %s: %s </li>''' % (m2m_field.verbose_name, o.__str__().strip("<>"))
                sub_ul_ele += li_ele
            sub_ul_ele += "</ul>"
            ul_ele += sub_ul_ele  # 最终跟最外层的ul相拼接
        for related_obj in obj._meta.related_objects:
            if 'ManyToManyRel' in related_obj.__repr__():
                if hasattr(obj, related_obj.get_accessor_name()):  # hassattr(customer,'enrollment_set')
                    accessor_obj = getattr(obj, related_obj.get_accessor_name())
                    # 上面accessor_obj 相当于 customer.enrollment_set
                    if hasattr(accessor_obj, 'select_related'):  # slect_related() == all()
                        target_objs = accessor_obj.select_related()  # .filter(**filter_coditions)
                        # target_objs 相当于 customer.enrollment_set.all()
                        sub_ul_ele = "<ul>"
                        for o in target_objs:
                            li_ele = '''<li> %s: %s </li>''' % (o._meta.verbose_name, o.__str__().strip("<>"))
                            sub_ul_ele += li_ele
                        sub_ul_ele += "</ul>"
                        ul_ele += sub_ul_ele
            elif hasattr(obj, related_obj.get_accessor_name()):  # hassattr(customer,'enrollment_set')
                accessor_obj = getattr(obj, related_obj.get_accessor_name())
                # 上面accessor_obj 相当于 customer.enrollment_set
                if hasattr(accessor_obj, 'select_related'):  # slect_related() == all()
                    target_objs = accessor_obj.select_related()  # .filter(**filter_coditions)
                    # target_objs 相当于 customer.enrollment_set.all()
                else:
                    target_objs = accessor_obj
                if len(target_objs) > 0:
                    # print("\033[31;1mdeeper layer lookup -------\033[0m")
                    # nodes = recursive_related_objs_lookup(target_objs,model_name)
                    nodes = recursive_related_objs_lookup(target_objs)
                    ul_ele += nodes
    ul_ele += "</ul>"
    return ul_ele


# 删除
@register.simple_tag
def display_obj_related(objs):
    """ 把对象及所有相关联的数据取出来 """
    # objs = [objs,]
    if objs:
        model_class = objs[0]._meta.model
        mode_name = objs[0]._meta.model_name
        return mark_safe(recursive_related_objs_lookup(objs))


# 获取verbose_name的值
@register.simple_tag
def get_action_verbose_name(admin_class, action):
    action_func = getattr(admin_class, action)
    return action_func.display_name if hasattr(action_func, 'display_name') else action
















