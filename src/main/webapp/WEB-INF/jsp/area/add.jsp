<%--
  Created by IntelliJ IDEA.
  User: q2312
  Date: 2019/3/20
  Time: 19:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
<%--    <link rel="stylesheet" href="<%=request.getContextPath() %>/time/css/material.min.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/time/css/bootstrap-material-datetimepicker.css" />
    <script type="text/javascript" src="<%=request.getContextPath() %>/time/js/material.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/time/js/moment-with-locales.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/time/js/bootstrap-material-datetimepicker.js"></script>--%>
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
                <label for="name2">地区名称:</label>
            </div>
            <div class="col-md-4">
                <input type="text" name="id" id="id" style="display: none">
                <input type="text" name="grade" id="grade" style="display: none">
                <input type="text" name="fullName" id="fullName" style="display: none">
                <input type="text" name="parentId" id="parentId" style="display: none">
                <input type="text" class="form-control" name="name" id="name2">
            </div>
        </div>
    </form>
</div>
</body>
</html>
