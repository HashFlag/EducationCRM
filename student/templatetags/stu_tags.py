# Author：wylkjj
# Date：2020/2/20
# -*- coding:utf-8 -*-
from django import template
from django.db.models import Sum
register = template.Library()


@register.simple_tag
def get_score(enroll_obj, customer_obj):
    study_records = enroll_obj.studyrecord_set.\
        filter(course_record__from_class_id=enroll_obj.enrolled_class.id)
    # for record in study_records:
    #     print('record:', record)
    # 聚合(Aggregation)
    return study_records.aggregate(Sum('score'))









