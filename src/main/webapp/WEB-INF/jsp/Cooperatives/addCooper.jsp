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
                            <label for="creditUnionCode">统一社会信用社代码:</label>
                        </div>
                        <div class="col-md-4">
                            <input type="text" class="form-control" name="creditUnionCode" id="creditUnionCode">
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
                            <label for="registrationNumber">纳税人识别号:</label>
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
                        <%--组织机构代码--%>
                        <div class="col-md-2">
                            <label for="organizationCode">组织机构代码:</label>
                        </div>
                        <div class="col-md-4">
                            <input type="text" class="form-control" name="organizationCode" id="organizationCode">
                        </div>
                    </div>
                    <div class="span6">
                        <%--企业地址--%>
                        <div class="row">
                            <div class="col-md-2">
                                <label for="site">企业地址:</label>
                            </div>
                            <div class="col-md-4">
                                <input type="text" class="form-control" name="site" id="site">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </form>
</div>
</body>
</html>
<%--
<div class="col-md-2">
                            <label for="organizationCode">企业类型:</label>
                        </div>
                        <div class="col-md-4">
                            <input type="text" class="form-control" name="organizationCode" id="organizationCode">
                        </div>


                        <div class="row">
                          <div class="span12">
                              Level 1 of column
                                  <div class="row">
                                        <div class="span6">Level 2</div>
                                        <div class="span6">Level 2</div>
                                   </div>
                            </div>
                           </div>
--%>