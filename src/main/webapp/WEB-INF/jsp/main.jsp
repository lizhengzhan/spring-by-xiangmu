<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <!-- 引入jquery js文件 -->
    <script type="text/javascript" src="<%=request.getContextPath() %>/jquery-easyui-1.5/jquery.min.js"></script>
    <!-- 引入bootstrap js/css文件 -->
    <link href="<%=request.getContextPath() %>/js/bootstrap3/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap3/js/bootstrap.min.js"></script>
    <!-- 引入treeview js/css文件 -->
    <link href="<%=request.getContextPath() %>/js/bootstrap-treeview/bootstrap-treeview.min.css" rel="stylesheet">
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap-treeview/bootstrap-treeview.min.js"></script>
    <!-- 引入bootstrap-addTabs js/css文件 -->
    <link href="<%=request.getContextPath() %>/js/bootStrap-addTabs/bootstrap.addtabs.css" rel="stylesheet">
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/bootStrap-addTabs/bootstrap.addtabs.min.js"></script>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">
                金科教育
            </a>
        </div>
        <div class="navbar-right">
            <a class="navbar-brand" href="#">
                欢迎你
            </a>
        </div>
    </div>
</nav>
<div class="container-fluid" style="margin-top:70px">
    <div class="row">
        <div class="col-md-2">
            <div id="myTree"></div>
        </div>
        <div class="col-md-10">
            <div id="myTabs">
                <!-- 新选项卡 -->
                <ul class="nav nav-tabs" id="tablist">
                    <li role="presentation" class="active">
                        <a href="#home" role="tab" data-toggle="tab">欢迎</a>
                    </li>
                </ul>

                <!-- 选项卡下内容 -->
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="home">
                        金科教育，欢迎您！
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">

    $(function(){
        initTree();
    })

    function initTree(){
        $.ajax({
            url:"<%=request.getContextPath() %>/findTree",
            type:"post",
            success:function(data){
                $('#myTree').treeview({
                    data:data,
                    onNodeSelected:function(event, node) {
                        $.addtabs({iframeHeight: 650});
                        $.addtabs.add({
                            id:node.id,
                            title:node.text,
                            url:"<%=request.getContextPath() %>" + node.href
                        });
                    }
                })
            }
        })
    }
</script>
</html>