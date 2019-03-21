<%--
  Created by IntelliJ IDEA.
  User: kang
  Date: 2019/3/21
  Time: 16:59
  To change this template use File | Settings | File Templates.
                    网站用户注册
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
    <form id="enrollFrom">

        <div class="row">
            <div class="col-md-2">
                <label for="userName">名称:</label>
            </div>
            <div class="col-md-4">
                <input type="text" class="form-control" name="userName" id="userName">
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <label for="userPhone">联系方式:</label>
            </div>
            <div class="col-md-4">
                <input type="text" class="form-control" name="userPhone" id="userPhone">
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <label for="userEmail">邮箱:</label>
            </div>
            <div class="col-md-4">
                <input type="text" class="form-control" name="userEmail" id="userEmail">
                <font color="#7fff00">该邮箱是登录时的邮箱</font>
            </div>
        </div>


    </form>
</div>


</body>
</html>
