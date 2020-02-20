from django.contrib import admin
from django.shortcuts import render, HttpResponse, redirect

from django import forms
from django.contrib.auth.models import Group
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from django.contrib.auth.forms import ReadOnlyPasswordHashField

from crm import models
# Register your models here.
# 自定义表的格式与样式


class CustomerAdmin(admin.ModelAdmin):
    list_display = ('id', 'qq', 'name', 'source', 'consultant', 'content', 'status', 'date')
    list_filter = ('source', 'consultant', 'date')  # 单项选择，列向展示，筛选，过滤，给出提示
    search_fields = ('qq', 'name')  # 设置查询功能
    raw_id_fields = ('consult_course',)  # 以ID的形式显示咨询课程
    filter_horizontal = ('tags',)  # 多项选择,可以横向展示，但不会自动过滤
    list_editable = ('status',)  # 设置可编辑字段
    list_per_page = 10
    # readonly_fields = ('qq',"consultant") #不可修改选项

# class UserProfileAdmin(admin.ModelAdmin):
#     list_display = ('email','name')
    # actions = ["test_action",]
    # def test_action(self,arg1,arg2): #自定制action
    #     print('test action:',self,arg1,arg2)
    #     return render("king_admin/table_index.html")


class CourseRecordAdmin(admin.ModelAdmin):
    list_display = ('from_class', 'day_num', 'teacher', 'has_homework', 'homework_title', 'date')
    actions = ('initialize_studyrecords', )

    def initialize_studyrecords(self, request, queryset):
        # print("--->self request queryset", self, request, queryset)
        if len(queryset) > 1:
            return HttpResponse("只能选择一个班级")
        # print(queryset[0].from_class.enrollment_set.all()) #表的反向查询_set
        new_obj_list = []
        for enroll_obj in queryset[0].from_class.enrollment_set.all():
            # get_or_create()如果有就取数据，没有就创建数据
            # models.StudyRecord.objects.get_or_create( #（低效率）
            #     student=enroll_obj,
            #     course_record=queryset[0],
            #     attendance=0,
            #     score=0,
            # )
            new_obj_list.append(models.StudyRecord(
                student=enroll_obj,
                course_record=queryset[0],
                attendance=0,
                score=0,
            ))
        # 批量创建数据，如果数据已被创建，返回会报错，数据数量不对也会直接报错
        try:
            models.StudyRecord.objects.bulk_create(new_obj_list)
        except Exception as e:
            return HttpResponse("批量初始化记录失败,请检查是否已经存在对应的学习记录!")
        return redirect("/admin/crm/studyrecord/?course_record__id__exact=%s" % (queryset[0].id))
    # short_description在admin中显示的字段
    initialize_studyrecords.short_description = "初始化本节课所有学员的上课记录"


class StudyRecordAdmin(admin.ModelAdmin):
    list_display = ('student', 'course_record', 'attendance', 'score', 'date')
    list_filter = ('course_record', 'score', 'attendance', 'course_record__from_class', 'student')
    list_editable = ('score', 'attendance')


class UserCreationForm(forms.ModelForm):
    """A form for creating new users. Includes all the required
    fields, plus a repeated password."""
    password1 = forms.CharField(label='Password', widget=forms.PasswordInput)
    password2 = forms.CharField(label='Password confirmation', widget=forms.PasswordInput)

    class Meta:
        model = models.UserProfile
        fields = ('email', 'name')

    def clean_password2(self):
        # Check that the two password entries match
        password1 = self.cleaned_data.get("password1")
        password2 = self.cleaned_data.get("password2")
        if password1 and password2 and password1 != password2:
            raise forms.ValidationError("Passwords don't match")
        return password2

    def save(self, commit=True):
        # Save the provided password in hashed format
        user = super(UserCreationForm, self).save(commit=False)
        user.set_password(self.cleaned_data["password1"])
        if commit:
            user.save()
        return user


class UserChangeForm(forms.ModelForm):
    """A form for updating users. Includes all the fields on
    the user, but replaces the password field with admin's
    password hash display field.
    """
    password = ReadOnlyPasswordHashField()

    class Meta:
        model = models.UserProfile
        fields = ('email', 'password', 'name', 'is_active', 'is_admin')

    def clean_password(self):
        # Regardless of what the user provides, return the initial value.
        # This is done here, rather than on the field, because the
        # field does not have access to the initial value
        return self.initial["password"]


class UserProfileAdmin(BaseUserAdmin):
    # The forms to add and change user instances
    form = UserChangeForm
    add_form = UserCreationForm

    # The fields to be used in displaying the User model.
    # These override the definitions on the base UserAdmin
    # that reference specific fields on auth.User.
    list_display = ('email', 'name', 'is_active', 'is_staff', 'is_admin')
    list_filter = ('is_admin',)
    fieldsets = (
        (None, {'fields': ('email', 'password')}),
        ('Personal', {'fields': ('name', 'stu_account', 'roles')}),
        ('Permissions', {'fields': ('is_active', 'is_admin', 'user_permissions', 'groups')}),
    )
    # add_fieldsets is not a standard ModelAdmin attribute. UserAdmin
    # overrides get_fieldsets to use this attribute when creating a user.
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('email', 'name', 'password1', 'password2')}),
    )
    search_fields = ('email',)
    ordering = ('email',)
    filter_horizontal = ('roles', 'user_permissions', 'groups')


admin.site.register(models.UserProfile, UserProfileAdmin)

# 使用Django-Admin默认的方式
admin.site.register(models.Customer, CustomerAdmin)
admin.site.register(models.CustomerFollowUp)
admin.site.register(models.Enrollment)
admin.site.register(models.Course)
admin.site.register(models.ClassList)
admin.site.register(models.CourseRecord, CourseRecordAdmin)
admin.site.register(models.Branch)
admin.site.register(models.Role)
admin.site.register(models.Payment)
admin.site.register(models.StudyRecord, StudyRecordAdmin)
admin.site.register(models.Tag)
admin.site.register(models.Menu)
admin.site.register(models.ContractTemplate)






