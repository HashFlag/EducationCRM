#author：wylkjj
#date：2020/2/4
#-*- coding:utf-8 -*-
#过滤，查询
from django.db.models import Q
def table_filter(request,admin_class):
    ''' 进行条件过滤并返回过滤后的数据(查询出结果) '''
    filter_conditions = {}
    keywords =["page","o","_q"]
    for k,v in request.GET.items():
        if k in keywords: #保留的分页关键字和排序关键字
            continue
        if v:
            filter_conditions[k]=v
    return admin_class.model.objects.filter(**filter_conditions),filter_conditions
#排序
def table_sort(request,admin_class,object_list):
    orderby_key = request.GET.get("o")
    if orderby_key:
        res = object_list.order_by(orderby_key)#排序：正数表示升序，负数表示降序
        if orderby_key.startswith("-"):#判断是否为负数
            orderby_key = orderby_key.strip('-')
        else:
            orderby_key = "-%s"%orderby_key
    else:
        res = object_list
    return res,orderby_key
#Search查询
def table_search(request,admin_class,object_list):
    search_key = request.GET.get("_q")
    if search_key:
        q_obj = Q()
        q_obj.connector = "OR"
        for column in admin_class.search_fields: # 注：utils.py文件外键属性要加__name获取name
            q_obj.children.append(("%s__contains"%column,search_key)) #前面是字段名，后面是字段值
        res = object_list.filter(q_obj)
    else:
        res = object_list.filter()
    return res




