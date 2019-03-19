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
    <!-- 引入弹框的js、css -->
    <script src="<%=request.getContextPath() %>/js/bootstrap-bootbox/bootbox.js"></script>
</head>
<body>
<div id="toolbar">
    <form class="form-inline">
        <div class="form-group">
            <label for="name">客户名：</label>
            <input type="text" class="form-control" id="name" placeholder="请输入客户名">
        </div>
        <button onclick="searchUser()" type="button" class="btn btn-info glyphicon glyphicon-search">搜索</button>
        <button onclick="openAdd()" type="button" class="btn btn-info glyphicon glyphicon-plus">新增</button>
        <button onclick="delUser()" type="button" class="btn btn-warning glyphicon glyphicon-minus">删除</button>
    </form>
</div>
<table class="table" id="myTable"></table>
</body>
<SCRIPT>

    $(function () {
        initConsumerTable();
    })
    //初始化表格数据
    function initConsumerTable(){
        $("#myTable").bootstrapTable({
            toolbar:"#toolbar",
            url:'<%=request.getContextPath() %>/jinRong/queryConsumerList',//获取数据地址
            pagination:true, //是否展示分页
            pageList:[5, 10, 20, 50],//分页组件
            pageNumber:1,
            pageSize:5,//默认每页条数
            height: 400,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            queryParams:function(){
                return {
                    page:this.pageNumber,
                    rows:this.pageSize,
                    name:$("#name").val()
                };
            },
            //sidePagination:'server',//分页方式：client客户端分页，server服务端分页
            columns:[
                {field:"check",checkbox:true},
                {field:"consumerId",title:"id"},
                {field:"wangZhanId",title:"网站用户ID"},
                {field:"consumerName",title:"客户姓名"},
                {field:"consumerCastId",title:"身份证"},
                {field:"consumerPhone",title:"手机"},
                {field:"consumerCode",title:"验证码"},
                {field:"consumerCity",title:"城市"},
                {field:"consumerJob",title:"职业"},
                {field:"consumerIncome",title:"收入"},
                {field:"keFuId",title:"客服"},
                {field:"tools",title:"操作",formatter:function(value,row,index){
                        return "<a href='javascript:openUpdate("+row.consumerId+")'>修改</a>";
                    }}
               ]
        })
    }

    //条件查询
    function searchUser(){
        $('#myTable').bootstrapTable('refresh');//刷新表格
    }

    //打开添加页面
    function openAdd(){
        bootbox.dialog({
            title:'添加用户信息',
            message: createAddContent("<%=request.getContextPath() %>/jinRong/toAdd"),
            closeButton: true,
            buttons : {
                "success" : {
                    "label" : "<i class='glyphicon glyphicon-ok'></i> 保存",
                    "className" : "btn-sm btn-success",
                    "callback" : function() {
                        $.ajax({
                            url:'<%=request.getContextPath() %>/jinRong/saveConsumer',
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
                        ids+=ids==""?arr[i].consumerId:","+arr[i].consumerId;
                    }
                    alert(ids);
                    $.ajax({
                        url:"<%=request.getContextPath() %>/jinRong/delConsumer",
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

    //打开修改页面
    function openUpdate(id){
        bootbox.dialog({
            title:'修改用户信息',
            message: createAddContent("<%=request.getContextPath() %>/jinRong/toUpdate"),
            closeButton: true,
            buttons : {
                "success" : {
                    "label" : "<i class='glyphicon glyphicon-ok'></i> 保存",
                    "className" : "btn-sm btn-success",
                    "callback" : function() {
                        $.ajax({
                            url:'<%=request.getContextPath() %>/jinRong/saveConsumer',
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
            url:"<%=request.getContextPath() %>/jinRong/queryConsumerById",
            type:"post",
            data:{id:id},
            async:false,
            success:function(data){
                $("#consumerId").val(data.consumerId);
                $("#consumerName").val(data.consumerName);
                $("#consumerCastId").val(data.consumerCastId);
                $("#consumerPhone").val(data.consumerPhone);
                $("#consumerCode").val(data.consumerCode);
                $("#keFuId").val(data.keFuId);
                $("input[name='consumerCity']").each(function(){
                    var city = $(this).val();
                    if(city==data.consumerCity){
                        $(this).prop("checked",true);
                    }
                });
                $("input[name='consumerJob']").each(function(){
                    var job = $(this).val();
                    if(job==data.consumerJob){
                        $(this).prop("checked",true);
                    }
                });$("input[name='consumerIncome']").each(function(){
                    var income = $(this).val();
                    if(income==data.consumerIncome){
                        $(this).prop("checked",true);
                    }
                });

            }
        })
    }

</SCRIPT>
</html>

