<%--
  Created by IntelliJ IDEA.
  User: 瑞瑞
  Date: 2019/3/21
  Time: 16:19
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
    <!-- 引入uploadify css js文件 -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/js/uploadify/uploadify.css">
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/uploadify/jquery.uploadify.min.js"></script>
</head>
<body>
<div id="toolbar">
    <form class="form-inline">
        <div class="form-group">
            <label for="traName">办理人</label>
            <input type="text" class="form-control" id="traName" placeholder="请输入办理人">
        </div>
        <button onclick="searchTra()" type="button" class="btn btn-info glyphicon glyphicon-search">搜索</button>
        <button onclick="openAdd()" type="button" class="btn btn-info glyphicon glyphicon-plus">新增</button>
        <button onclick="delTra()" type="button" class="btn btn-warning glyphicon glyphicon-minus">删除</button>
    </form>
</div>

<table class="table" id="myTable"></table>
</body>
<SCRIPT>

    $(function () {
        initTraTable();
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

    //条件查询
    function searchTra(){
        $('#myTable').bootstrapTable('refresh');//刷新表格
    }

    //刷新页面
    function searchTra(){
        $('#myTable').bootstrapTable('refresh');
    }

    //打开发布页面
    function openAdd(){
        bootbox.dialog({
            title:'新增信息',
            message: createAddContent("<%=request.getContextPath() %>/toAddTra"),
            closeButton: true,
            buttons : {
                "success" : {
                    "label" : "<i class='glyphicon glyphicon-ok'></i> 保存",
                    "className" : "btn-sm btn-success",
                    "callback" : function() {
                        $.ajax({
                            url:'<%=request.getContextPath() %>/addTra',
                            type:'post',
                            data:$("#myForm").serialize(),
                            success:function(data){
                                searchTra();
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

    //初始化表格数据
    function initTraTable(){
        $("#myTable").bootstrapTable({
            toolbar:"#toolbar",
            url:'<%=request.getContextPath() %>/queryTraList',//获取数据地址
            pagination:true, //是否展示分页
            pageList:[5, 10, 20, 50],//分页组件
            pageNumber:1,
            pageSize:5,//默认每页条数
            height:500,
            queryParams:function(){
                return {
                    page:this.pageNumber,
                    rows:this.pageSize,
                    traName:$("#traName").val(),
                };
            },
            sidePagination:'server',//分页方式：client客户端分页，server服务端分页
            columns:[
                {field:"check",checkbox:true},
                {field:"id",title:"ID"},
                {field:"traName",title:"办理人"},
                {field:"phone",title:"手机号"},
                {field:"identity",title:"身份证号"},
               /* {field:"identityImg",title:"身份证图片"},*/
                {field:"identityImg",title:"身份证图片",formatter:function(value,row,index){
                        return "<img width='50px' height='50px' src='"+value+"'>";
                    }},
                {field:"license",title:"车牌号"},
                /*{field:"vehicleImg",title:"车辆合同图片"},*/
                {field:"vehicleImg",title:"车辆合同图片",formatter:function(value,row,index){
                        return "<img width='50px' height='50px' src='"+value+"'>";
                    }},
                {field:"people",title:"代办人"},
            ]
        })
    }


    //删除用户
    function delTra(){
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
                    $.ajax({
                        url:"<%=request.getContextPath() %>/deleteTra",
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
                            searchTra();//刷新表格
                        }
                    })
                }
            }
        })
    }

    //杂七杂八end//图片
    //杂七杂八start
    function preFile1(){
//上传插件
        $("#uploadify1").uploadify({
            //插件自带  不可忽略的参数
            'swf': '<%=request.getContextPath() %>/js/uploadify/uploadify.swf',
            //前台请求后台的url 不可忽略的参数                          //*****要修改路经 !!!!!!!!!!!!!!!!!!!!!!!!
            'uploader':'<%=request.getContextPath() %>/addFiletwo1',
            //给div的进度条加背景 不可忽略
            'queueID': 'fileQueue1',
            //上传文件文件名 !!!!!!!!!!!!!!!!!!与后台接口参数名字需要完全一致!!!!!!!!!!!!!!!!!!!!!!!!
            'fileObjName':'headimg1',
            //给上传按钮设置文字
            'buttonText': '上传图片',
            //设置文件是否自动上传
            'auto':true,
            //可以同时选择多个文件 默认为true  不可忽略
            'multi':false,
            //上传后队列是否消失
            'removeCompleted':true,
            //队列消失时间
            'removeTimeout' : 1,
            //上传文件的个数，项目中一共可以上传文件的个数
            'uploadLimit':  -1,
            'onFallback':function(){alert("浏览器不支持,请更换其他浏览器,或打开Flash插件");},
            //上传失败
            'onUploadError':function(){
                alert("上传失败");
            },
            //成功回调函数 file：文件对象。data后台输出数据
            'onUploadSuccess':function(file,data,response){
                var imgurl = data
                //给img框赋值进行展示
                $("#testimg1").attr("src",imgurl);
                //给隐藏的文本框赋值 传到后台
                $("[name='vehicleImg']").html(data); //改!!!!!!!!!!11111
            }
        });
    }
    //杂七杂八end



</SCRIPT>
</html>
