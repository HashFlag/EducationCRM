#author：wylkjj
#date：2020/2/2
#-*- coding:utf-8 -*-
# 制定前端模板（模拟Django-Admin）
from crm import models
enabled_admins = {}  # enabled 开启的

class BaseAdmin(object):
    list_display = []
    list_filters = []
    list_per_page = 20

class CustomerAdmin(BaseAdmin):
    list_display = ['qq','name','source','consultant','consult_course','date','status']
    list_filters = ['source','consultant','consult_course','status']
    #model = models.Customer

class CustomerFollowUpAdmin(BaseAdmin):
    list_display = ['customer','consultant','date']

def register(model_class,admin_class=None):
    if model_class._meta.app_label not in enabled_admins: #找到并处理app的名字（例：crm）
        enabled_admins[model_class._meta.app_label] = {}
    admin_class.model = model_class #绑定model(例：models.Customer)对象和admin(例：CustomerAdmin)类
    enabled_admins[model_class._meta.app_label][model_class._meta.model_name] = admin_class

register(models.Customer,CustomerAdmin)
register(models.CustomerFollowUp,CustomerFollowUpAdmin)




