<%--
  Created by IntelliJ IDEA.
  User: kang
  Date: 2019/3/25
  Time: 11:41
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
        <div class="form-group" >
            <input type="text" class="form-control" id="time" placeholder="请输入要搜索的名称" />
            <button type="button" class="btn btn-info glyphicon glyphicon-search" onclick="query()">搜索</button>
        </div>
        <div class="form-group">
            <button type="button" class="btn btn-info glyphicon glyphicon-plus" onclick="openDialog('添加索引')">添加</button>
        </div>
    </form>
</div>

<div  style="margin-top: -43px;">
    <table id="showTab" class="table table-hover table-success"></table>
</div>


<!-- 新增弹框 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4  id="myModalLabel" class="modal-title"></h4>
            </div>
            <!-- 新增修改表单 -->
            <form class="form-horizontal" id="carForm" method="post">
                <input type="hidden" name="id" id="id">
                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">名称</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="name"  id="name" placeholder="名称"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="rtime" class="col-sm-2 control-label" >汽车简介</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="rtime" id="rtime" placeholder="汽车简介"/>
                    </div>
                </div>
            </form>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
                <button type="button" id="FormBtn" class="btn btn-primary" data-dismiss="modal"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存</button>
            </div>
        </div>
    </div>
</div>



</body>
<script  type="text/javascript">

    $(function () {
        initTab();
    })
    //加载汽车列表
    function initTab(){
        $('#showTab').bootstrapTable({
            url:'<%=request.getContextPath()%>/solrSearch',
            method: 'get',
            classes:'table',//边框
            undefinedText:'',//当数据为 undefined 时显示的字符
            pagination:true,//启动分页
            sidePagination: "client",
            pageNumber:1,
            queryParams: function (params) {
                var time = $("#time").val();
                return {
                    rtime:time,
                    offset: params.offset,  //页码
                    limit: params.limit,   //页面大小
                    search : params.search//搜索
                };
            },
            pageSize:5,
            pageList:[ 5, 10, 15, 30 ],
            showRefresh: true,  //显示刷新按钮
            showToggle:true,//显示一行是否改成竖着
            showPaginationSwitch:true,//是否显示 下面的分页框
            search: true, //显示搜索框
            detailView:true,
            toolbal:'#toolbar',
            columns: [{
                field: 'id',
                title: '序号',
                switchable: true
            },{
                field: 'name',
                title: '名称',
                switchable: true
            },{
                field: 'rtime',
                title: '介绍',
                switchable: true
            },{
                field: 'tool',
                title: '操作',width:200,
                formatter:function(value,row,index){
                    var str="<a class=\'btn btn-success glyphicon\' href='JavaScript:queryCarById(\""+row.id+"\")'>修改</a> | "
                        +"<a class=\'btn btn-success glyphicon\' href='JavaScript:deleteCar(\""+row.id+"\")'>删除</a>"
                    return str;
                }
            }],
        })
    }

    /* 条件查询 */
    function query(){
        $('#showTab').bootstrapTable('refresh');
    }


    //新增/修改点击事件
    $("#FormBtn").click(function(){
        if($("#id").val()==null || $("#id").val()==""){
            addCar();
        }else{
            updateCar();
        }
    })

    //打开dialog弹框
    function openDialog(text){
        $("#myModalLabel").html(text);
        $('#myModal').modal();
    }

    //新增方法
    function addCar(){
        $.ajax({
            url:"<%=request.getContextPath()%>/addCar",
            type:"post",
            data:$("#carForm").serialize(),
            success:function (data) {
                if(data==1){
                    alert("success")
                    window.location.reload();
                }
                $.messager.alert("提示","error11");
            },error:function(){
                alert(555)
            }
        })
    }

    //删除
    function deleteCar(id) {
        if(confirm("确认删除索引？")){
            $.ajax({
                url: '<%=request.getContextPath()%>/deleteCar',
                type: 'post',
                data: {id:id},
                dataType: 'json',
                success: function (data) {
                    if (data == 1) {
                        $('#showTab').bootstrapTable('refresh');
                    } else {
                        alert("删除失败")
                    }
                }
            });
        }
    }

    //修改回显
    function queryCarById(id){
        $.ajax({
            type:'post',
            url:'<%=request.getContextPath()%>/queryCarById',
            data:{id:id},
            success:function(data){
                openDialog('修改');
                $("#carForm").form('load',data);
            }
        })
    }
    //修改方法
    function updateCar(){
        $.ajax({
            url:"<%=request.getContextPath()%>/updateCar",
            type:"post",
            data:$("#carForm").serialize(),
            success:function (data) {
                if(data==1){
                    alert("success")
                    window.location.reload();
                }
                $.messager.alert("提示","error");
            },error:function(){
            }
        })
    }

</script>

</html>
