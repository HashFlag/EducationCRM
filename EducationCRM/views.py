from django.shortcuts import render,redirect
from django.contrib.auth import login,authenticate,logout #登录验证
# Create your views here.
def acc_login(request):
    errors = {}
    if request.method == "POST":
        _email = request.POST.get("email")
        _password = request.POST.get("password")
        user = authenticate(username = _email,password=_password)
        #print("auth res",user) #用户验证
        if user:
            login(request,user) #用户登录，django内部的方法会创建session记录
            next_url = request.GET.get("next", "/")
            return redirect(next_url)
        else:
            errors['error'] = "Wrong username or password!"
    return render(request,"login.html",{"errors":errors})


def acc_logout(request):
    logout(request)
    return redirect("/account/login/")