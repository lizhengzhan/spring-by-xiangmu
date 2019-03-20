<%--
  Created by IntelliJ IDEA.
  User: 瑞瑞
  Date: 2019/3/18
  Time: 10:03
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
                <label for="brandName">品牌</label>
                <input type="text" class="form-control" id="brandName" placeholder="请输入品牌">
            </div>
            <div class="form-group">
                <label for="carsId">车系</label>
                <input type="text" class="form-control" id="carsId" placeholder="请输入车系">
            </div>
            <button onclick="searchBrand()" type="button" class="btn btn-info glyphicon glyphicon-search">搜索</button>
            <button onclick="openAdd()" type="button" class="btn btn-info glyphicon glyphicon-plus">发布</button>
            <button onclick="delBrand()" type="button" class="btn btn-warning glyphicon glyphicon-minus">删除</button>
        </form>
    </div>

    <table class="table" id="myTable"></table>
</body>
<SCRIPT>

    $(function () {
        initBrandTable();
    })



    $("#cars").change(function () {
        if ($(this).val() == "") return;
        $("#cars option").remove();
        var code = $(this).find("option:selected").val();
        var html = "<option value=''>--请选择--</option>";
        $.ajax({
            url:"<%=request.getContextPath() %>/carsList",
            type:"post",
            success:function(data){
                $.each(data, function (idx, item) {
                    html += "<option value=" + item.id + " >" + item.carsName + "</option>";
                });
            }
        });
    });
    //初始课程类型
 /*   function initBrandTable(){
        $("#cars").dropdown({
            url:"<%=request.getContextPath() %>/carsList",
            valueField:"id",
            textField:"carsName"
            /!* multiple:true*!/
        })
    }*/

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

    //打开发布页面
    function openAdd(){
        bootbox.dialog({
            title:'发布买车信息',
            message: createAddContent("<%=request.getContextPath() %>/toBrandAdd"),
            closeButton: true,
            buttons : {
                "success" : {
                    "label" : "<i class='glyphicon glyphicon-ok'></i> 发布",
                    "className" : "btn-sm btn-success",
                    "callback" : function() {
                        $.ajax({
                            url:'<%=request.getContextPath() %>/addBrand',
                            type:'post',
                            data:$("#myForm").serialize(),
                            success:function(data){
                                searchBrand();
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

    //删除用户
    function delBrand(){
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
                        url:"<%=request.getContextPath() %>/deleteBrand",
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
                            searchBrand();//刷新表格
                        }
                    })
                }
            }
        })
    }

    //条件查询
    function searchBrand(){
        $('#myTable').bootstrapTable('refresh');//刷新表格
    }
    //初始化表格数据
    function initBrandTable(){
        $("#myTable").bootstrapTable({
            toolbar:"#toolbar",
            url:'<%=request.getContextPath() %>/queryBrandList',//获取数据地址
            pagination:true, //是否展示分页
            pageList:[5, 10, 20, 50],//分页组件
            pageNumber:1,
            pageSize:5,//默认每页条数
            height:500,
            queryParams:function(){
                return {
                    page:this.pageNumber,
                    rows:this.pageSize,
                    brandName:$("#brandName").val(),
                    carsId:$("#carsId").val()
                };
            },
            sidePagination:'server',//分页方式：client客户端分页，server服务端分页
            columns:[
                {field:"check",checkbox:true},
                {field:"id",title:"id"},
                {field:"brandName",title:"品牌名称"},
                {field:"carsName",title:"车系"},
                {field:"oldName",title:"车龄"},
                {field:"modelsName",title:"车型"},
                {field:"mileageName",title:"里程"},
                {field:"displaceName",title:"排量"}
            ]
        })
    }

</SCRIPT>
</html>
