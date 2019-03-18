<%--
  Created by IntelliJ IDEA.
  User: kang
  Date: 2019/3/18
  Time: 15:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
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
    <form id="myForm">
 <%--     //名称  --%>
        <div class="row">
            <div class="col-md-2">
                <label for="companyName">企业名称:</label>
            </div>
            <div class="col-md-4">
                <input type="text" class="form-control" name="companyName" id="companyName">
            </div>
        </div>
 <%--企业电话--%>
     <div class="row">
         <div class="col-md-2">
             <label for="companyPhone">企业电话:</label>
         </div>
         <div class="col-md-4">
             <input type="text" class="form-control" name="companyPhone" id="companyPhone">
         </div>
     </div>
 <%--企业邮箱--%>
     <div class="row">
         <div class="col-md-2">
             <label for="companyEmall">企业邮箱:</label>
         </div>
         <div class="col-md-4">
             <input type="text" class="form-control" name="companyEmall" id="companyEmall">
         </div>
     </div>
 <%--企业董事--%>
     <div class="row">
         <div class="col-md-2">
             <label for="userName">企业董事:</label>
         </div>
         <div class="col-md-4">
             <input type="text" class="form-control" name="userName" id="userName">
         </div>
     </div>
  <%--企业创建时间--%>
         <div class="row">
             <div class="col-md-2">
                 <label for="createTime">创建时间:</label>

             </div>
             <div class="col-md-4">
              <%--   <input type="text" class="form-control date" name="createTime" id="createTime">--%>
                  <input type="text" id="createTime" class="form-control floating-label" name="createTime" placeholder="Start Date">
             </div>
     </div>
         <%--是否联系--%>
         <div class="row">
             <div class="col-md-2">
                 <label for="contact">是否联系:</label>
             </div>
             <div class="col-md-4">
                 <label class="radio-inline">
                     <input type="radio" name="contact" value="1" id="contact"> 联系
                 </label>
                 <label class="radio-inline">
                     <input type="radio" name="contact" value="0"> 等会联系
                 </label>
             </div>
         </div>

    </form>
</div>
</body>
<script>
    $(document).ready(function()
    {
        $('#createTime').bootstrapMaterialDatePicker({ format : 'YYYY-MM-DD', minDate : new Date() });
    })
</script>
</html>
