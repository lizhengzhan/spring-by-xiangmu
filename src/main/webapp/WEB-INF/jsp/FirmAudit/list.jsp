<%--
  Created by IntelliJ IDEA.
  User: kang
  Date: 2019/3/20
  Time: 19:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>企业审核</title>
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
    <style type="text/css">
        .fixed-table-header{
            background-color:red;
        }
    </style>
</head>
<body>


    <table class="table" id="FiemAuditTable"></table>

</body>
<script type="text/javascript">



    $(function () {
        initCooperivateTable();
    })

    function searchUser(){
        $('#FiemAuditTable').bootstrapTable('refresh');
    }


    //初始化表格数据
    function initCooperivateTable(){
        $("#FiemAuditTable").bootstrapTable({
            toolbar:"#toolbar",
            url:'<%=request.getContextPath() %>/queryFirmAudit',//获取数据地址
            pagination:true, //是否展示分页
            pageList:[5, 10, 20, 50],//分页组件
            pageNumber:1,
            striped: true,
            pageSize:5,//默认每页条数
            height: 650,
            showRefresh: true,
            queryParams:function(){
                return {
                    page:this.pageNumber,
                    rows:this.pageSize
                };
            },
            sidePagination:'server',//分页方式：client客户端分页，server服务端分页
            columns:[
                {field:"check",checkbox:true},
                {field:"id",title:"id"},
                {field:"phone",title:"手机"},
                {field:"email",title:"邮箱"},
                {field:"fullName",title:"地址"},
                {field:"capital",title:"注册资金"},
                {field:"credit",title:"统一社用社代码"},
                {field:"registration",title:"纳税人识别号"},
                {field:"registrationNumber",title:"注册号"},
                {field:"organ",title:"组织机构代码"},
                {field:"companyType",title:"公司类型"},
                {field:"info",title:"简介"},
                {field:"status",title:"审核",formatter:function(value,row,index){
                        if (value==1) {
                            return  "正在审核中";
                        }else if(value==2){
                            return  "审核通过";
                        }
                    }},
                {field:"toolls",title:"",formatter:function(value,row,index){
                        if (row.status==1){
                            return "<button type=\"button\" class=\"btn btn-default\" onclick='FiemAuditVia("+row.id+")'>审核</button>\n";
                        }
                    }}
            ]
        })
    }

    //审核
    function FiemAuditVia(id) {
        $.ajax({
            url:"<%=request.getContextPath()%>/FiemAuditVia",
            type:"post",
            data:{id:id},
            success:function(){
                bootbox.alert({
                    size: "small",
                    title: "提示",
                    message: "审核成功！",
                    buttons: {
                        ok: {
                            label: '确定',
                            className: 'btn-success'
                        }
                    },
                    callback: function(){}
                });
                searchUser();//刷新表格
            }
        })
    }
    
</script>
</html>
