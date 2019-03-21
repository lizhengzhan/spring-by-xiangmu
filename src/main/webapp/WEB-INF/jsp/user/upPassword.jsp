<%--
  Created by IntelliJ IDEA.
  User: q2312
  Date: 2019/3/21
  Time: 9:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Title</title>
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
                <label for="password">密码:</label>
            </div>
            <div class="col-md-4">
                <input type="text" class="form-control" name="password" id="password">
                <input type="text" name="userId" id="userId" style="display: none">
            </div>
        </div>
    </form>
</div>
</body>
</html>
