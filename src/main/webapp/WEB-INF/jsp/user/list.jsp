<%--
  Created by IntelliJ IDEA.
  User: q2312
  Date: 2019/3/18
  Time: 15:10
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
<%--<div id="toolbar">
    <form class="form-inline">
        <div class="form-group">
            <label for="companyName">企业名称</label>
            <input type="text" class="form-control" id="companyName" placeholder="请输入企业名称">
        </div>
        <button onclick="searchUser()" type="button" class="btn btn-info glyphicon glyphicon-search">搜索</button>
        <button onclick="openAdd()" type="button" class="btn btn-info glyphicon glyphicon-plus">新增</button>
    </form>
</div>--%>
<div class="panel-body" style="padding-bottom:0px;">
    <div class="panel panel-default">
        <div class="panel-heading">查询条件</div>
        <div class="panel-body">
            <form id="formSearch" class="form-horizontal">
                <div class="form-group" style="margin-top:10px">
                    <label class="control-label col-sm-1" for="txt_search_departmentname">部门名称</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="txt_search_departmentname">
                    </div>
                    <label class="control-label col-sm-1" for="txt_search_statu">状态</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="txt_search_statu">
                    </div>
                    <div class="col-sm-4" style="text-align:left;">
                        <button type="button" style="margin-left:50px" id="btn_query" class="btn btn-primary">查询</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div id="toolbars" class="btn-group">
    <button id="btn_add" type="button" class="btn btn-default">
        <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
    </button>
    <%--<button id="btn_edit" type="button" class="btn btn-default">
        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
    </button>--%>
    <button id="btn_delete" type="button" class="btn btn-default">
        <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
    </button>
</div>
<table class="table" id="myTable"></table>

</body>
<SCRIPT>


    $(function () {
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

    function searchUser(){
        $('#myTable').bootstrapTable('refresh');//刷新表格
    }

    //初始化表格数据
    function initCompanyTable(){
        $("#myTable").bootstrapTable({
            toolbar:"#toolbars",
            url:'<%=request.getContextPath() %>/user/queryUser',//获取数据地址
            /*method: 'post',                      //请求方式（*）*/
            striped: true,                      //是否显示行间隔色
            cache: true,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            /*sortable: true,                     //是否启用排序
            sortOrder: "userId",                   //排序方式*/
            pageNumber:1,                       //初始化加载第一页，默认第一页
            pageSize: 10,                       //每页的记录行数（*）
            pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
            /*search: true,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大*/
            strictSearch: true,
            showColumns: true,                  //是否显示所有的列
            showRefresh: true,                  //是否显示刷新按钮
            minimumCountColumns: 2,             //最少允许的列数
            clickToSelect: true,                //是否启用点击选中行
            height: 400,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            /*uniqueId: "ID",                     //每一行的唯一标识，一般为主键列*/
            showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
            cardView: false,                    //是否显示详细视图
            detailView: false,                   //是否显示父子表
            queryParams:function(){
                return {
                    page:this.pageNumber,
                    rows:this.pageSize,
                    name:$("#username").val()
                };
            },
            sidePagination:'server',//分页方式：client客户端分页，server服务端分页
            columns:[
                {field:"check",checkbox:true},
                {field:"userId",title:"id"},
                {field:"userName",title:"用户名称"},
                {field:"userPwd",title:"用户密码"},
                {field:"userSex",title:"用户性别"},
                {field:"userBirthday",title:"企业董事"},
                {field:"roleId",title:"企业创建时间"}
            ]
        })


    }

</SCRIPT>
</html>
