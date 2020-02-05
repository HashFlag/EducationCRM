from django.contrib import admin

from crm import models
# Register your models here.
#自定义表的格式与样式
class CustomerAdmin(admin.ModelAdmin):
    list_display = ('id','qq','source','consultant','content','status','date')
    list_filter = ('source','consultant','date') #横向展示，筛选，过滤，给出提示
    search_fields = ('qq','name') #设置查询功能
    raw_id_fields = ('consult_course',) #以ID的形式显示咨询课程
    filter_horizontal = ('tags',) #可以横向展示，但不会自动过滤
    list_editable = ('status',) #设置可编辑字段

class UserProfileAdmin(admin.ModelAdmin):
    list_display = ('user','name')

# 使用Django-Admin默认的方式
admin.site.register(models.Customer,CustomerAdmin)
admin.site.register(models.CustomerFollowUp)
admin.site.register(models.Enrollment)
admin.site.register(models.Course)
admin.site.register(models.ClassList)
admin.site.register(models.CourseRecord)
admin.site.register(models.Branch)
admin.site.register(models.Role)
admin.site.register(models.Payment)
admin.site.register(models.StudyRecord)
admin.site.register(models.Tag)
admin.site.register(models.UserProfile,UserProfileAdmin)
admin.site.register(models.Menu)





