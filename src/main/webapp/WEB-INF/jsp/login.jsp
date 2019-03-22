<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>您好！请您登陆！</title>
</head>
<!-- 引入easyui样式文件 -->
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/jquery-easyui-1.5/themes/default/easyui.css">
<!-- 引入easyui图标样式文件 -->
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/jquery-easyui-1.5/themes/icon.css">
<!-- 引入jquery js文件 -->
<script type="text/javascript" src="<%=request.getContextPath() %>/jquery-easyui-1.5/jquery.min.js"></script>
<!-- 引入easyui的js文件 -->
<script type="text/javascript" src="<%=request.getContextPath() %>/jquery-easyui-1.5/jquery.easyui.min.js"></script>
<!-- 引文easyui支持中文js -->
<script type="text/javascript" src="<%=request.getContextPath() %>/jquery-easyui-1.5/locale/easyui-lang-zh_CN.js"></script>

<!-- 登陆框架 -->
<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" media="all" />
<%--
<link rel="stylesheet" href="<%=request.getContextPath() %>/alter/example.scss">--%>
<!-- This is what you need -->
<script src="<%=request.getContextPath() %>/alter/sweet-alert.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/alter/sweet-alert.css">
<body>

<div class="header-w3l">
    <h1>欢迎登陆我们！</h1>
</div>

<div class="mail-form shadow-agile">
    <form action="#" method="post">
        <input type="text" id="loginnumber" name="userName" placeholder="Enter your name...." required=""/>
        <input type="password" id="pwd"  name="userPwd" class="padding-wthree" placeholder="Password" required=""/>
        <input type="button" value="登陆" onclick="loginUser()" id="btnSumit">
    </form>
    <font size="5">下方短信登录</font>
    <!-- 短信登录 -->
    <div class="tab-pane" id="ios">
        <table>
            <tr>
                <td width="50px" height="30px"></td>
                <td width="250px"></td>
            </tr>
            <tr>
                <td height="80px"></td>
                <td>
                    <div class="input-group">
                        <span class="input-group-addon" style="background-color: white;"><span class="glyphicon glyphicon-phone"></span></span>
                        <input type="text" placeholder="请输入预留手机号" id="phone" class="form-control" style="width: 215px;height: 40px;">
                    </div>
                </td>
            </tr>
            <tr>
                <td height="80px"></td>
                <td>
                    <div class="input-group">
                        <span class="input-group-addon" style="background-color: white;"><span class="glyphicon glyphicon-lock"></span></span>
                        <input type="text" placeholder="请输入验证码" id="checkCode" class="form-control" style="width: 120px;height: 40px;">
                        <span class="input-group-addon" style="background-color: greenyellow;width: 200px;padding: 0px;">
                            <input type="button" value="获取验证码"  id="btn"  onclick="getCheckCode()">
                        </span>
                    </div>
                </td>
            </tr>
            <tr>
                <td height="80px"></td>
                <td>
                    <button  style="width: 250px;height: 40px;" onclick="checkCodeLogin()">
                        <font size="3">登录</font>
                    </button>
                </td>
            </tr>
        </table>
    </div>
</div>

<div class="footer-agileits">
    <p>©欢迎访问农场管理</p>
</div>

<script>

    //按钮事件
    $('#btnSumit').click(function() {
    });
    //回车提交事件
    $("body").keydown(function() {
        if (event.keyCode == "13") {//keyCode=13是回车键
            $('#btnSumit').click();
        }
    });

    function loginUser(){
        var loginnumber = $("#loginnumber").val();
        var pwd = $("#pwd").val();
        $.ajax({
            url:"<%=request.getContextPath()%>/loginUser",
            data:{"userName":loginnumber,"password":pwd},
            success:function(data){
                swal(data, "", "error")
                if(data == "登陆成功！"){
                    swal(data, "", "success")
                    setTimeout(function(){location.href="<%=request.getContextPath()%>/toMain"}, 1000);
                }
            },
            error:function(){
                $.messager.alert("提示驾到","删除失败","error");
            }
        })
    }

    //获取验证码
    function getCheckCode(){
        var phone = $('#phone').val();
        var id = 1;
        $.ajax({
            url:'<%=request.getContextPath()%>/http/getCode',
            type:'post',
            //dataType:'json',
            aync:false,
            data: {'phone':phone,"id":id},
            success : function(data) {
                if(data){
                    alert("获取验证码中，60s内有效");
                }else{

                    alert("未正确获取验证码，请稍后重试！");
                }
            },
            error : function(e){
                alert("网络连接失败，请您稍后再试！");
            }
        });

    }

    //验证码登录
    function checkCodeLogin(){
        var phone = $('#phone').val();
        var checkCode = $('#checkCode').val();
        $.ajax({
            url : "<%=request.getContextPath()%>/http/codeLogin",
            async : true,
            type: "POST",
            data: {'phone':phone,'code':checkCode},
            //dataType: "json",
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            success : function(data) {
                if(data){
                    setTimeout(function(){location.href="<%=request.getContextPath()%>/toMain"}, 1000);
                }else{
                    alert("验证码错误");
                }
            },
            error : function(e){
                alert("网络连接失败，请您稍后再试！");
            }
        });
    }

</script>
</body>
</html>
