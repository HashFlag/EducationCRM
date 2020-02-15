#author：wylkjj
#date：2020/2/2
#-*- coding:utf-8 -*-
# 制定前端模板（模拟Django-Admin）
from crm import models
from django.shortcuts import render,redirect
enabled_admins = {}  # enabled 开启的

class BaseAdmin(object):
    list_display = []
    list_filters = []
    list_per_page = 20
    search_fields = []
    filter_horizontal = []
    ordering = None
    readonly_fields = []
    readonly_table = False #只读功能
    modelform_exclude_fields = [] #过滤不需要的字段
    actions = ["delete_seleted_objs",] #可以写任何功能(此功能是关于全部的) "clean_name",
    def delete_seleted_objs(self,request,querysets):
        app_name = self.model._meta.app_label
        table_name = self.model._meta.model_name
        if self.readonly_table:
            errors = {"readonly_table": "This table is readonly,cannot be deleted or modified!"}
        else:
            errors = {}
        if request.POST.get("delete_confirm") == "yes":
            if not self.readonly_table:
                querysets.delete()
            return redirect("/king_admin/%s/%s/"%(app_name,table_name))
        selected_ids = ','.join([str(i.id) for i in querysets])
        return render(request,"king_admin/table_obj_delete.html",{"obj":querysets,
                                                                  "admin_class":self,
                                                                  "app_name":app_name,
                                                                  "table_name":table_name,
                                                                  "selected_ids":selected_ids,
                                                                  "action":request._admin_action,
                                                                  "errors":errors})

class CustomerAdmin(BaseAdmin):
    list_display = ['id','qq','name','source','consultant','consult_course','date','status','enroll']
    list_filters = ['source','consultant','consult_course','status','date'] #'source'和'date'都需要过滤
    list_per_page = 5
    search_fields = ['qq','name'] #consultant是外键，所以__name获取具体内容
    filter_horizontal = ['tags'] #多选框
    readonly_fields = ['qq','consultant']
    #readonly_table = True
    #model = models.Customer
    #可以自定制actions(只针对当前表格)
    def default_form_validation(self):#自定义设置中预留一个钩子
        ''' 用户可以在此进行自定义的表单验证，相当于django form的clean方法 '''
        #print("---customer validation",self)
        pass
    # def clean_name(self): #单个字段验证
    #     print("name clean validation:",self.cleaned_data['name'])
    #     if not self.cleaned_data["name"]:
    #         self.add_error("name","cannot be null")
    def enroll(self):
        # print("enroll",self.instance)
        return '''<a href="%s/enrollment/">报名</a>'''%self.instance.id
    enroll.display_name = "报名链接"
class CustomerFollowUpAdmin(BaseAdmin):
    list_display = ['customer','consultant','date']

class UserProfileAdmin(BaseAdmin):
    list_display = ['id','email','name']
    search_fields = ['name']
    readonly_fields = ['password']
    modelform_exclude_fields = ['last_login']

def register(model_class,admin_class=None):
    if model_class._meta.app_label not in enabled_admins: #找到并处理app的名字（例：crm）
        enabled_admins[model_class._meta.app_label] = {}
    admin_class.model = model_class #绑定model(例：models.Customer)对象和admin(例：CustomerAdmin)类
    enabled_admins[model_class._meta.app_label][model_class._meta.model_name] = admin_class

register(models.Customer,CustomerAdmin)
register(models.CustomerFollowUp,CustomerFollowUpAdmin)
register(models.UserProfile,UserProfileAdmin)




