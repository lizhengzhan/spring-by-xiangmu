<%--
  Created by IntelliJ IDEA.
  User: kang
  Date: 2019/3/19
  Time: 16:45
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
</head>
<body>
<table class="table" id="myTable"></table>
</body>
<script>
    $(function () {
        initBrandTable();
    })

    //初始化表格数据
    function initBrandTable(){
        $("#myTable").bootstrapTable({
            toolbar:"#toolbar",
            url:'<%=request.getContextPath() %>/queryCarAudit',//获取数据地址
            pagination:true, //是否展示分页
            pageList:[5, 10, 20, 50],//分页组件
            pageNumber:1,
            pageSize:5,//默认每页条数
            height:500,
            queryParams:function(){
                return {
                    page:this.pageNumber,
                    rows:this.pageSize,
                    brandName:$("#brandName").val()
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
                {field:"displaceName",title:"排量"},
                {field:"status",title:"状态",formatter:function(value,row,index){
                        if (value==0) {
                            return  "认证中";
                        } else if(value==2){
                            return  "通过";
                        }else if(value ==3){
                            return  "不通过";
                        }
                    }},
                {field:"tools",title:'',formatter:function(value,row,index){
                    if (row.status==1){
                        return  "<button  class=\"badge badge-inverse\"><a href='javascript:openRelation("+row.id+")'></a></button>";
                    }
                    }}
            ]
        })
    }


</script>

</html>
