from django.shortcuts import render,redirect
from king_admin import king_admin
from king_admin.utils import table_filter,table_sort,table_search
from django.core.paginator import Paginator,EmptyPage,PageNotAnInteger
from king_admin.forms import creatr_model_form
# Create your views here.
#表单展示
def index(request):
    #print(king_admin.enabled_admins['crm']['customer'].model)
    return render(request, "king_admin/table_index.html", {'table_list':king_admin.enabled_admins})
#数据展示
def display_table_objs(request,app_name,table_name):
    admin_class = king_admin.enabled_admins[app_name][table_name]
    if request.method == "POST":#actions来了
        selected_ids = request.POST.get("selected_ids")
        action = request.POST.get("action")
        if selected_ids:
            selected_objs = admin_class.model.objects.filter(id__in=selected_ids.split(','))
        else:
            raise KeyError("No object selected.")
        if hasattr(admin_class,action): #如果对象有该属性返回 True，否则返回 False。
            actions_func = getattr(admin_class,action)
            request._admin_action = action
            return actions_func(admin_class,request,selected_objs)
    object_list,filter_condtions = table_filter(request,admin_class)
    object_list,orderby_key = table_sort(request, admin_class, object_list)#排序后的结果
    #Django 内置的分页器Paginator(数据集合，显示条数)
    object_list = table_search(request,admin_class,object_list)
    paginator = Paginator(object_list,admin_class.list_per_page)
    page = request.GET.get('page')
    try:
        query_sets = paginator.page(page)
    except PageNotAnInteger:
        #如果页不是整数，则传递第一页。
        query_sets = paginator.page(1)
    except EmptyPage:
        #如果页面超出范围（例如9999），则提交结果的最后一页。
        query_sets = paginator.page(paginator.num_pages)
    #query_sets.has_previous() 判断是否是第一页
    #query_sets.previous_page_number() 判断显示页面后面是否有下一页
    #query_sets.number 获取当前的page页数
    return render(request,"king_admin/table_objs.html",{"admin_class":admin_class,
                                                        "query_sets":query_sets,
                                                        "filter_condtions":filter_condtions,
                                                        "orderby_key":orderby_key,
                                                        "previous_orderby":request.GET.get("o",""),
                                                        "search_text":request.GET.get("_q","")})
#添加
def table_obj_add(request,app_name,table_name):
    admin_class = king_admin.enabled_admins[app_name][table_name]
    model_form_class = creatr_model_form(request, admin_class)
    if request.method == "POST":
        form_obj = model_form_class(request.POST)
        if form_obj.is_valid():
            form_obj.save() # 保存数据到数据库
            return redirect(request.path.replace("/add",""))
    else:
        form_obj = model_form_class()
    return render(request,"king_admin/table_obj_add.html",{"form_obj":form_obj})
#修改
def table_obj_change(request,app_name,table_name,obj_id):
    admin_class = king_admin.enabled_admins[app_name][table_name]
    model_form_class = creatr_model_form(request,admin_class)
    obj = admin_class.model.objects.get(id=obj_id) #数据库取出对象
    if request.method == "POST":
        form_obj = model_form_class(request.POST,instance=obj)
        if form_obj.is_valid():
            form_obj.save()#保存数据到数据库
    else:
        form_obj = model_form_class(instance=obj)
    return render(request,"king_admin/table_obj_change.html",{"form_obj":form_obj,
                                                              "admin_class":admin_class,
                                                              "app_name":app_name,
                                                              "table_name":table_name})

#删除
def table_obj_delete(request,app_name,table_name,obj_id):
    admin_class = king_admin.enabled_admins[app_name][table_name]
    obj = admin_class.model.objects.get(id=obj_id)
    if request.method == "POST":
        obj.delete()
        return redirect("/king_admin/%s/%s"%(app_name,table_name))
    return render(request,"king_admin/table_obj_delete.html",{"obj":obj,
                                                              "admin_class":admin_class,
                                                              "app_name":app_name,
                                                              "table_name":table_name})












