<%--
  Created by IntelliJ IDEA.
  User: q2312
  Date: 2019/3/18
  Time: 18:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/time/css/material.min.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/time/css/bootstrap-material-datetimepicker.css" />
    <script type="text/javascript" src="<%=request.getContextPath() %>/time/js/material.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/time/js/moment-with-locales.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/time/js/bootstrap-material-datetimepicker.js"></script>
    <style type="text/css">
        .row{
            margin-bottom:10px
        }
    </style>
</head>
<body>
<div style="width:550px">
    <form id="myForm">
        <div class="row">
            <div class="col-md-2">
                <label for="userName2">姓名:</label>
            </div>
            <div class="col-md-4">
                <input type="text" name="userId" id="userId" style="display: none">
                <input type="text" name="grades" id="grades" style="display: none">
                <input type="text" name="areapids" id="areapids" style="display: none">
                <input type="text" class="form-control" name="userName" id="userName2">
            </div>

            <div class="col-md-2">
                <label for="loginNumber">登陆账号:</label>
            </div>
            <div class="col-md-4">
                <input type="text" class="form-control" name="loginNumber" id="loginNumber">
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <label for="password">密码:</label>
            </div>
            <div class="col-md-4">
                <input type="text" class="form-control" name="password" id="password">
            </div>
            <div class="col-md-2">
                <label for="email">邮箱:</label>
            </div>
            <div class="col-md-4">
                <input type="text" class="form-control" name="email" id="email">
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <label for="input_province">所在地:</label>
            </div>
            <div class="col-sm-3">
                    <select name="input_province" id="input_province" class="form-control" >
                        <option value="">--请选择--</option>
                    </select>
            </div>
            <div class="col-sm-3">
                <select name="areapid" id="areapid" class="form-control">
                    <option value=""></option>
                </select>
            </div>
            <div class="col-md-2">
                <label for="userSex">性别:</label>
            </div>
            <div class="col-md-2">
                <select class="form-control"  name="userSex" id="userSex">
                    <option value="">--请选择--</option>
                    <option value="1">男</option>
                    <option value="2">女</option>
                </select>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <label for="userBirthday">生日:</label>
            </div>
            <div class="col-md-4">
                <input type="text" id="userBirthday" class="form-control floating-label" name="userBirthday" placeholder="Start Date">
            </div>
            <div class="col-md-2">
                <label for="roleId">角色:</label>
            </div>
            <div class="col-md-4">
                <select name="roleId" id="roleId" class="form-control" >
                    <option value="">--请选择--</option>
                </select>
            </div>
        </div>

    </form>
</div>
<script type="text/javascript">
    $(document).ready(function(){
        $('#userBirthday').bootstrapMaterialDatePicker({ weekStart : 0, time: false });
    });

    $(function () {
        $.ajax({
            url:"<%=request.getContextPath() %>/role/queryRole",
            success:function(data){
                var shot = "";
                $.each(data, function (idx, item) {
                    shot += "<option value=" + item.id + " >" + item.info + "</option>";
                });
                $("#roleId").append(shot);
            }
        });

        $.ajax({
            url:"<%=request.getContextPath() %>/area/queryArea?ids=0",
            type:"post",
            success:function(data){
                var html = "";
                $.each(data, function (idx, item) {
                    html += "<option value=" + item.id + " >" + item.name + "</option>";
                });
                $("#input_province").append(html);
                $("#input_province").val($("#grades").val());
                $("#input_province").change();
            }
        });
    });

    $("#input_province").change(function () {
        if ($(this).val() == "") return;
        $("#areapid option").remove();
        var code = $(this).find("option:selected").val();

        $.ajax({
            url:"<%=request.getContextPath() %>/area/queryArea2?ids="+code,
            type:"post",
            success:function(data){
                var areapids = $("#areapids").val();
                var html = "<option value=''>--请选择--</option>";
                $.each(data, function (idx, item) {
                    if(areapids == item.id){
                        html += "<option value=" + item.id + " selected = 'selected'>" + item.name + "</option>";
                    }else {
                    html += "<option value=" + item.id + " >" + item.name + "</option>";
                    }
                });
                $("#areapid").append(html);
                /*alert($("#areapids").val());
                $("#areapid").val($("#areapids").val());*/
            }
        });
    });

</script>
</body>
</html>
