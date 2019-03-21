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
    <script  type="text/javascript"  src="<%=request.getContextPath() %>/jquery-easyui-1.5/jquery.min.js"></script>
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
<div class="panel-body" style="padding-bottom:0px;">
    <div class="panel panel-default">
        <div class="panel-heading">查询条件</div>
        <div class="panel-body">
            <form id="formSearch" class="form-horizontal">
                <div class="form-group" style="margin-top:10px">
                    <label class="control-label col-sm-1" for="userName">用户名称</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="userName">
                    </div>
                    <div class="col-sm-4" style="text-align:left;">
                        <button type="button" style="margin-left:50px" id="btn_query" class="btn btn-primary" onclick="searchUser()">查询</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div id="toolbars" class="btn-group">
        <button id="btn_add" type="button" class="btn btn-default">
            <span class="glyphicon glyphicon-plus" aria-hidden="true" onclick="openAdd()">新增</span>
        </button>
        <button id="btn_delete" type="button" class="btn btn-default">
            <span class="glyphicon glyphicon-remove" aria-hidden="true" onclick="delUser()">删除</span>
        </button>
    </div>
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

    //批量删除
    function delUser(){
        bootbox.confirm({
            size: "small",
            title:"提示",
            message: "是否确认删除",
            buttons: {
                confirm: {
                    label: '确定',
                    className: 'btn-success'
                },
                cancel: {
                    label: '取消',
                    className: 'btn-danger'
                }
            },
            callback: function(result){
                if(result){
                    var arr = $('#myTable').bootstrapTable('getSelections'); //获取表选择的行
                    var ids = "";
                    for(var i=0;i<arr.length;i++){
                        ids+=ids==""?arr[i].userId:","+arr[i].userId;
                    }
                    $.ajax({
                        url:"<%=request.getContextPath() %>/user/delUserAll",
                        type:"post",
                        data:{ids:ids},
                        success:function(){
                            bootbox.alert({
                                size: "small",
                                title: "提示",
                                message: "删除成功！",
                                buttons: {
                                    ok: {
                                        label: '确定',
                                        className: 'btn-success'
                                    }
                                },
                                callback: function(){}
                            })
                            searchUser();//刷新表格
                        }
                    })
                }
            }
        })
    }

    //打开添加页面
    function openAdd(){
        bootbox.dialog({
            title:'添加用户信息',
            message: createAddContent("<%=request.getContextPath() %>/toUserAdd"),
            closeButton: true,
            buttons : {
                "success" : {
                    "label" : "<i class='glyphicon glyphicon-ok'></i> 保存",
                    "className" : "btn-sm btn-success",
                    "callback" : function() {
                        $.ajax({
                            url:'<%=request.getContextPath() %>/user/addUserAdd',
                            type:'post',
                            data:$("#myForm").serialize(),
                            success:function(data){
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

    //打开修改页面
    function openUpdate(id){
        bootbox.dialog({
            title:'修改用户信息',
            message: createAddContent("<%=request.getContextPath() %>/toUserAdd"),
            closeButton: true,
            buttons : {
                "success" : {
                    "label" : "<i class='glyphicon glyphicon-ok'></i> 保存",
                    "className" : "btn-sm btn-success",
                    "callback" : function() {
                        $.ajax({
                            url:'<%=request.getContextPath() %>/user/addUserAdd',
                            type:'post',
                            data:$("#myForm").serialize(),
                            success:function(data){
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
        //回显数据
        $.ajax({
            url:"<%=request.getContextPath() %>/user/queryUserById",
            type:"post",
            data:{id:id},
            async:true,
            success:function(data){
                $("#userName2").val(data.userName);
                $("#loginNumber").val(data.loginNumber);
                $("#password").prop("disabled","true");
                $("#password").val("**************");
                $("#email").val(data.email);
                $("#consumerCode").val(data.consumerCode);
                $("#userSex").val(data.userSex);
                $("#userBirthday").val(data.userBirthday.substr(0,10));
                $("#userId").val(data.userId);
                $("#grades").val(data.grade);
                $("#roleId").val(data.roleId);
                $("#areapids").val(data.areapid);
            }
        })
    }

    function openUpdatePassword(id){
        bootbox.dialog({
            title:'修改用户信息',
            message: createAddContent("<%=request.getContextPath() %>/toUserUpdatePassword"),
            closeButton: true,
            buttons : {
                "success" : {
                    "label" : "<i class='glyphicon glyphicon-ok'></i> 保存",
                    "className" : "btn-sm btn-success",
                    "callback" : function() {
                        $.ajax({
                            url:'<%=request.getContextPath() %>/user/updateUserPassword',
                            type:'post',
                            data:$("#myForm").serialize(),
                            success:function(data){
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
        $("#userId").val(id);
    }


    //条查刷新
    function searchUser(){
        $('#myTable').bootstrapTable('refresh');
    }

    //初始化表格数据
    function initCompanyTable(){
        $("#myTable").bootstrapTable({
            toolbar:"#toolbars",
            url:'<%=request.getContextPath() %>/user/queryUser',//获取数据地址
            striped: true,                      //是否显示行间隔色
            pagination: true,                   //是否显示分页（*）
            pageList:[5, 10, 20, 50],//分页组件
            pageNumber:1,
            pageSize:5,//默认每页条数
            showColumns: false,                  //是否显示所有的列
            showRefresh: true,                  //是否显示刷新按钮
            minimumCountColumns: 2,             //最少允许的列数
            clickToSelect: true,                //是否启用点击选中行
            height: 400,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
            cardView: false,                    //是否显示详细视图
            detailView: false,                   //是否显示父子表
            queryParams:function(){
                return {
                    page:this.pageNumber,
                    rows:this.pageSize,
                    userName:$("#userName").val()
                };
            },
            sidePagination:'server',//分页方式：client客户端分页，server服务端分页
            columns:[
                {field:"check",checkbox:true},
                {field:"userId",title:"id"},
                {field:"userName",title:"用户名称"},
                {field:"loginNumber",title:"登陆账号"},
                {field:"email",title:"电子邮箱"},
                {field:"userSex",title:"用户性别",formatter:function(value,row,index){
                        return value==null?'暂未设置':value==1?'男':'女';
                    }},
                {field:"userBirthday",title:"用户生日",formatter:function(value,row,index){
                        return value==null?'暂未设置':value.substr(0,10);
                    }},
                {field:"text",title:"用户角色",formatter:function(value,row,index){
                        return value==null?'暂未设置':value;
                    }},
                {field:"fullName",title:"用户所在地",formatter:function(value,row,index){
                        return value==null?'暂未设置':value;
                    }},
                {field:"tools",title:"操作",formatter:function(value,row,index){
                        return "<a href='javascript:openUpdate("+row.userId+")'>修改</a>     <a href='javascript:openUpdatePassword("+row.userId+")'>修改密码</a>";
                }}
            ]
        })


    }

</SCRIPT>
</html>
