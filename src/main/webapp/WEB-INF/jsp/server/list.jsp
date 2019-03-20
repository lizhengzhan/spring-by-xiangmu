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
    <button onclick="openAdd()" type="button" class="btn btn-info glyphicon glyphicon-plus">新增</button>
    <button onclick="delUser()" type="button" class="btn btn-warning glyphicon glyphicon-minus">删除</button>
</div>
    <table class="table" id="myTable"></table>
</body>
<SCRIPT>

    $(function () {
        initCompanyTable();
    })
    //初始化表格数据
    function initCompanyTable(){
        $("#myTable").bootstrapTable({
            toolbar:"#toolbar",
            url:'<%=request.getContextPath() %>/server/queryList',//获取数据地址
            pagination:true, //是否展示分页
            pageList:[5, 10, 20, 50],//分页组件
            pageNumber:1,
            pageSize:5,//默认每页条数
            queryParams:function(){
                return {
                    page:this.pageNumber,
                    rows:this.pageSize,
                };
            },
            sidePagination:'server',//分页方式：client客户端分页，server服务端分页
            columns:[
                {field:"check",checkbox:true},
                {field:"id",title:"id"},
                {field:"orderId",title:"订单id"},
                {field:"adressId",title:"车辆所在地址"},
                {field:"userId",title:"网站用户ID"},
                {field:"authMen",title:"认证人"},
                {field:"status",title:"退车状态",
                    formatter: function(value,row,index){
                       if(value==0){
                           return "未分配";
                       }
                       if(value==1){

                           return "已分配";
                       }
                       if(value==2){
                           return "已处理";
                       }
                    }
                },
                {field:"makeMoney",title:"打款账号"},
                {field:"getMoney",title:"收款人"},
                {field:"123",title:"操作",
                    formatter: function(value,row,index){
                        return '<input type="button" value="修改" onclick="queryServerById('+row.id+')">----<input type="button" value="分配认证员" onclick="allotAuth('+row.id+')" >';
                    }
                }

            ]
        })
    }

    //打开添加页面
    function openAdd(){
        alert("12123123");
        bootbox.dialog({
            title:'添加用户信息',
            message: createAddContent("<%=request.getContextPath() %>/toServerAdd"),
            closeButton: true,
            buttons : {
                "success" : {
                    "label" : "<i class='glyphicon glyphicon-ok'></i> 保存",
                    "className" : "btn-sm btn-success",
                    "callback" : function() {
                        $.ajax({
                            url:'<%=request.getContextPath() %>/server/addServer',
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

    //打开修改页面
    function queryServerById(id){
        bootbox.dialog({
            title:'修改用户信息',
            message: createAddContent("<%=request.getContextPath() %>/toUpdate"),
            closeButton: true,
            buttons : {
                "success" : {
                    "label" : "<i class='glyphicon glyphicon-ok'></i> 保存",
                    "className" : "btn-sm btn-success",
                    "callback" : function() {
                        $.ajax({
                            url:'<%=request.getContextPath() %>/server/addServer',
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
        //回显数据
        $.ajax({
            url:"<%=request.getContextPath() %>/server/queryServerById",
            type:"post",
            data:{id:id},
            async:false,
            success:function(data){
                //alert(data);
                $("#id").val(data.id);
                $("#orderId").val(data.orderId);
                $("#adressId").val(data.adressId);
                $("#userId").val(data.userId);
                $("#authMen").val(data.authMen);
                $("#status").val(data.status);
                $("#makeMoney").val(data.makeMoney);
                $("#getMoney").val(data.getMoney);
                //});
                //debugger
                //回显图片
                /* $('#testimg').val(data.headImg);
                uploadImg(data.headImg); */
            }
        })
    }


    //删除
    //删除用户
    function delUser(){
        //bootbox.alert("Your message here…");
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
                        ids+=ids==""?arr[i].id:","+arr[i].id;
                    }
                    alert(ids);
                    $.ajax({
                        url:"<%=request.getContextPath() %>/server/delServerById",
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

</SCRIPT>
</html>
