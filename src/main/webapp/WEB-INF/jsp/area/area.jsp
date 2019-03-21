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
    <!-- 引入弹框的js、css -->
    <script src="<%=request.getContextPath() %>/js/bootstrap-bootbox/bootbox.js"></script>
</head>
<body>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="ibox float-e-margins">
        <div class="panel panel-default">
            <div class="panel-heading">查询条件</div>
            <input type="text" id="pid" style="display: none" value="0">
            <input type="text" id="parentidss" style="display: none" value="0">
            <input type="text" id="zhuangtai" style="display: none" value="0">
            <div class="panel-body">
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:10px">
                        <label class="control-label col-sm-1" for="name">地区名称</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="name">
                        </div>
                        <div class="col-sm-4" style="text-align:left;">
                            <button type="button" style="margin-left:50px" id="btn_query" class="btn btn-primary" onclick="searchUser()">查询</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div id="toolbars" class="btn-group">
            <a class="btn btn-primary" href="javascript:openAdd()"><i class="fa fa-plus"></i> 添加</a>
            <a class="btn btn-primary" href="javascript:queryList()"><i class="fa fa-arrow-up"></i>返回到地区</a>
        </div>
    </div>
</div>
<table class="table" id="myTable"></table>
</body>
<script>
    $(function () {
        var pid = $("#pid").val();
        initCompanyTable(pid);

    });

    function queryAreaById(pid) {
        $("#pid").val(pid);
        var zhuangt = $("#zhuangtai").val();
        if(zhuangt != null && zhuangt != ""){
            alert("已是最后一级不可进行选择！！！");
        }else{
            $('#myTable').bootstrapTable('destroy');
            $("#name").val("");
            initCompanyTable(pid);
        }
    }

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
            title:'添加地区信息',
            message: createAddContent("<%=request.getContextPath() %>/toAreaAdd"),
            closeButton: true,
            buttons : {
                "success" : {
                    "label" : "<i class='glyphicon glyphicon-ok'></i> 保存",
                    "className" : "btn-sm btn-success",
                    "callback" : function() {
                        $.ajax({
                            url:'<%=request.getContextPath() %>/area/addAreaAdd',
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
        $("#parentId").val($("#parentidss").val());
        if($("#zhuangtai").val() == ""){
            $("#grade").val(0);
        }else{
            $("#grade").val($("#zhuangtai").val());
        }

    }

    //打开修改页面
    function openUpdate(id){
        bootbox.dialog({
            title:'修改用户信息',
            message: createAddContent("<%=request.getContextPath() %>/toAreaAdd"),
            closeButton: true,
            buttons : {
                "success" : {
                    "label" : "<i class='glyphicon glyphicon-ok'></i> 保存",
                    "className" : "btn-sm btn-success",
                    "callback" : function() {
                        $.ajax({
                            url:'<%=request.getContextPath() %>/area/addAreaAdd',
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
            url:"<%=request.getContextPath() %>/area/queryAreaByid",
            type:"post",
            data:{id:id},
            async:false,
            success:function(data){
                $("#id").val(data.id);
                $("#grade").val(data.grade);
                if(data.grade != 0){
                    var lenth = data.fullName.length;
                    var len = data.name.length;
                    $("#fullName").val(data.fullName.substr(0,lenth-len));
                }else{
                    $("#fullName").val(data.fullName);
                }
                $("#parentId").val(data.parentId);
                $("#name2").val(data.name);
            }
        })
    }

    //条查刷新
    function searchUser(){
        $('#myTable').bootstrapTable('refresh');
    }

    function queryList(){
        var zhuangt = $("#zhuangtai").val();
        if(zhuangt == null && zhuangt == ""){
            alert("已是第一级不可进行操作！！！");
        }else {
            $('#myTable').bootstrapTable('destroy');
            initCompanyTable(0)
        }
    }
    //初始化表格数据
    function initCompanyTable(id){
        $("#myTable").bootstrapTable({
            toolbar:"#toolbars",
            url:'<%=request.getContextPath() %>/area/queryAreaList?ids='+id,//获取数据地址
            striped: true,                      //是否显示行间隔色
            pagination: true,                   //是否显示分页（*）
            pageList:[5, 10, 20, 50],//分页组件
            pageNumber:1,
            pageSize:5,//默认每页条数
            showColumns: false,                  //是否显示所有的列
            showRefresh: true,                  //是否显示刷新按钮
            minimumCountColumns: 2,             //最少允许的列数
            clickToSelect: true,                //是否启用点击选中行
            height: 350,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
            cardView: false,                    //是否显示详细视图
            detailView: false,                   //是否显示父子表
            queryParams:function(){
                return {
                    page:this.pageNumber,
                    rows:this.pageSize,
                    name:$("#name").val(),
                };
            },
            sidePagination:'server',//分页方式：client客户端分页，server服务端分页
            columns:[
                {field:"check",checkbox:true},
                {field:"id",title:"id"},
                {field:"createDate",title:"创建日期",formatter:function(value,row,index){
                    return value==null?'暂未设置':value.substr(0,10);
                }},
                {field:"modifyDate",title:"修改日期",formatter:function(value,row,index){
                    return value==null?'暂未设置':value.substr(0,10);
                }},
                {field:"fullName",title:"地区",formatter:function(value,row,index) {
                    return value == null ? '暂未设置' : "<a href='javascript:queryAreaById("+row.id+")'>"+value+"</a>";
                }},
                {field:"grade",title:"第几级",formatter:function(value,row,index){
                    if(value != 0){
                        $("#zhuangtai").val(value);
                    }else{
                        $("#zhuangtai").val("");
                    }
                    $("#parentidss").val(row.parentId);
                    return value==null?'暂未设置':value==2?"当前在"+(value)+"级":"当前在"+(value+1)+"级";
                }},
                {field:"name",title:"地名",formatter:function(value,row,index){
                    return value==null?'暂未设置':value;
                }},
                {field:"tools",title:"操作",formatter:function(value,row,index){
                    return "<a href='javascript:openUpdate("+row.id+")'>修改</a>";
                }}
            ]
        })
    }
</script>
</html>