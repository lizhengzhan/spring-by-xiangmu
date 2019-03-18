<%--
  Created by IntelliJ IDEA.
  User: kang
  Date: 2019/3/16
  Time: 9:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%--jquery 的js--%>
    <script  type="text/javascript"  src="jquery-easyui-1.5/jquery.min.js"></script>
    <!-- 引入bootstrap的js、css -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/js/bootstrap3/css/bootstrap.css">
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap3/js/bootstrap.js"></script>
    <!-- 引入table的js、css -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/js/bootstrap-table/bootstrap-table.css">
    <script src="<%=request.getContextPath() %>/js/bootstrap-table/bootstrap-table.js"></script>
    <script src="<%=request.getContextPath() %>/js/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>
    <!-- 引入日期js、css -->
    <script src="<%=request.getContextPath() %>/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
    <script src="<%=request.getContextPath() %>/js/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/js/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css">
    <!-- 引入弹框的js、css -->
    <script src="<%=request.getContextPath() %>/js/bootstrap-bootbox/bootbox.js"></script>
    <!-- 引入文件上传的插件 -->
    <script src="<%=request.getContextPath() %>/js/bootstrap-fileinput/js/fileinput.js"></script>
    <script src="<%=request.getContextPath() %>/js/bootstrap-fileinput/js/locales/zh.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/js/bootstrap-fileinput/css/fileinput.css">
</head>
<body>
<div id="toolbar">
    <form class="form-inline">
        <div class="form-group">
            <label for="companyName">企业名称</label>
            <input type="text" class="form-control" id="companyName" placeholder="请输入企业名称">
        </div>
        <button onclick="searchUser()" type="button" class="btn btn-info glyphicon glyphicon-search">搜索</button>
        <button onclick="openAdd()" type="button" class="btn btn-info glyphicon glyphicon-plus">新增</button>
    </form>
</div>
      <table class="table" id="myTable"></table>

</body>
<SCRIPT>
    $(function(){
        initCompanyTable();
        $('.date').datetimepicker({
            language: 'zh-CN',//显示中文
            //format: 'yyyy-mm-dd hh:ii:ss',//显示格式
            format: 'yyyy-mm-dd',//显示格式
            minView: "month",//设置只显示到月份
            initialDate: new Date(),//初始化当前日期
            autoclose: true,//选中自动关闭
            todayBtn: true//显示今日按钮
        });
    })

    var res;
    function createAddContent(url){
        $.ajax({
            url:url,
            async:false,
            success:function(data){
                res = data;
            }
        });
        return res;
    }

    function searchUser(){
        $('#myTable').bootstrapTable('refresh');//刷新表格
    }



    //初始化表格数据
    function initCompanyTable(){
        $("#myTable").bootstrapTable({
            toolbar:"#toolbar",
            url:'<%=request.getContextPath() %>/queryCompany',//获取数据地址
            pagination:true, //是否展示分页
            pageList:[5, 10, 20, 50],//分页组件
            pageNumber:1,
            pageSize:5,//默认每页条数
            queryParams:function(){
                return {
                    page:this.pageNumber,
                    rows:this.pageSize,
                    companyName:$("#companyName").val()
                };
            },
            sidePagination:'server',//分页方式：client客户端分页，server服务端分页
            columns:[
                {field:"check",checkbox:true},
                {field:"id",title:"id"},
                {field:"companyName",title:"企业名称"},
                {field:"companyPhone",title:"企业电话"},
                {field:"companyEmall",title:"企业邮箱"},
                {field:"userName",title:"企业董事"},
                {field:"createTime",title:"企业创建时间"},
                {field:"contact",title:"是否联系"}
            ]
        })
    }

    //打开添加页面
    function openAdd(){
        bootbox.dialog({
            title:'添加用户信息',
            message: createAddContent("<%=request.getContextPath() %>/toAdd"),
            closeButton: true,
            buttons : {
                "success" : {
                    "label" : "<i class='glyphicon glyphicon-ok'></i> 保存",
                    "className" : "btn-sm btn-success",
                    "callback" : function() {
                        $.ajax({
                            url:'<%=request.getContextPath() %>/addCompany',
                            type:'post',
                            data:$("#myForm").serialize(),
                            success:function(data){
                                //$('#myTable').bootstrapTable('refresh');
                                searchUser();
                            }
                        });
                    }
                },
                "cancel" : {
                    "label" : "<i class='glyphicon glyphicon-remove'></i> 取消",
                    "className" : "btn-sm btn-danger",
                    "callback" : function() {

                    }
                }
            }

        });
    }

</SCRIPT>
</html>
