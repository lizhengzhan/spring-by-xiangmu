<%--
  Created by IntelliJ IDEA.
  User: kang
  Date: 2019/3/19
  Time: 9:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/time/css/material.min.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/time/css/bootstrap-material-datetimepicker.css" />
    <script src="<%=request.getContextPath() %>/time/js/jquery-2.1.1.min.js"></script>
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
    <form id="cooperForm">

        <div class="row">
            <div class="span12">
                <div class="row">
                    <div class="span6">
                        <%--企业名称--%>
                        <div class="col-md-2">
                            <label for="capital">企业名称:</label>
                        </div>
                        <div class="col-md-4">
                            <input type="text" class="form-control" name="capital" id="capital">
                        </div>
                    </div>
                    <div class="span6">
                        <%--企业类型--%>
                        <div class="col-md-2">
                            <label for="companyType">企业类型:</label>
                        </div>
                        <div class="col-md-4">
                            <input type="text" class="form-control" name="companyType" id="companyType">
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="span12">
                <div class="row">
                    <div class="span6">
                        <%--统一社会信用社代码--%>
                        <div class="col-md-2">
                            <label for="credit">统一社会信用社代码:</label>
                        </div>
                        <div class="col-md-4">
                            <input type="text" class="form-control" name="credit" id="credit">
                        </div>
                    </div>
                    <div class="span6">
                        <%--企业邮箱--%>
                        <div class="col-md-2">
                            <label for="email">企业邮箱:</label>
                        </div>
                        <div class="col-md-4">
                            <input type="text" class="form-control" name="email" id="email">
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="span12">
                <div class="row">
                    <div class="span6">
                        <%--企业官网--%>
                        <div class="col-md-2">
                            <label for="officerNet">企业官网:</label>
                        </div>
                        <div class="col-md-4">
                            <input type="text" class="form-control" name="officerNet" id="officerNet">
                        </div>
                    </div>
                    <div class="span6">
                        <%--注册号--%>
                        <div class="col-md-2">
                            <label for="registrationNumber">注册号:</label>
                        </div>
                        <div class="col-md-4">
                            <input type="text" class="form-control" name="registrationNumber" id="registrationNumber">
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="span12">
                <div class="row">
                    <div class="span6">
                        <%--企业电话--%>
                        <div class="col-md-2">
                            <label for="phone">企业电话:</label>
                        </div>
                        <div class="col-md-4">
                            <input type="text" class="form-control" name="phone" id="phone">
                        </div>
                    </div>
                    <div class="span6">
                        <%--纳税人识别号--%>
                        <div class="col-md-2">
                            <label for="registration">纳税人识别号:</label>
                        </div>
                        <div class="col-md-4">
                            <input type="text" class="form-control" name="registration" id="registration">
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="span12">
                <div class="row">
                    <div class="span6">
                        <%--组织机构代码--%>
                        <div class="col-md-2">
                            <label for="organ">组织机构代码:</label>
                        </div>
                        <div class="col-md-4">
                            <input type="text" class="form-control" name="organ" id="organ">
                        </div>
                    </div>
                    <div class="span6">
                        <%--企业简介--%>
                        <div class="row">
                            <div class="col-md-2">
                                <label for="info">企业简介:</label>
                            </div>
                            <div class="col-md-4">
                                <input type="text" class="form-control" name="info" id="info">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--企业地址--%>
        <div class="col-md-2">
            <label for="province">所在地:</label>
        </div>
        <div class="col-sm-3">
            <select name="province" id="province" class="form-control" >
                <option value="">--请选择--</option>
            </select>
        </div>
        <div class="col-sm-3">
            <select name="city" id="city" class="form-control">
                <option value=""></option>
            </select>
        </div>

    </form>
</div>
</body>

<script>
    $(function () {
        var html = "";
        $("#city").append(html);
        /*$("#input_area").append(html);*/
        $.ajax({
            url:"<%=request.getContextPath() %>/area/queryArea?ids=0",
            type:"post",
            success:function(data){
                $.each(data, function (idx, item) {
                    html += "<option value=" + item.id + " >" + item.name + "</option>";
                });
                $("#province").append(html);
            }
        });
    });

    $("#province").change(function () {
        if ($(this).val() == "") return;
        $("#city option").remove();
        var code = $(this).find("option:selected").val();
        var html = "<option value=''>--请选择--</option>";
        $.ajax({
            url:"<%=request.getContextPath() %>/area/queryArea2?ids="+code,
            type:"post",
            success:function(data){
                $.each(data, function (idx, item) {
                    html += "<option value=" + item.id + " >" + item.name + "</option>";
                });
                $("#city").append(html);
            }
        });
    });
</script>
</html>
