
from django.urls import path,re_path
from king_admin import views
urlpatterns = [
    path('',views.index,name="tabel_index"),
    re_path(r'^(\w+)/(\w+)/$',views.display_table_objs,name="table_objs")
]
