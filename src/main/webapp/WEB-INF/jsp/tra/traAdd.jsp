<%--
  Created by IntelliJ IDEA.
  User: 瑞瑞
  Date: 2019/3/21
  Time: 17:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%--jquery 的js--%>
    <script  type="text/javascript"  src="jquery-easyui-1.5/jquery.min.js"></script>
    <!-- 引入uploadify css js文件 -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/js/uploadify/uploadify.css">
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/uploadify/jquery.uploadify.min.js"></script>
    <!-- 引入文件上传的插件 -->
    <script src="<%=request.getContextPath() %>/js/bootstrap-fileinput/js/fileinput.js"></script>
    <script src="<%=request.getContextPath() %>/js/bootstrap-fileinput/js/locales/zh.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/js/bootstrap-fileinput/css/fileinput.css">
    <!-- 引入uploadify css js文件 -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/js/uploadify/uploadify.css">
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/uploadify/jquery.uploadify.min.js"></script>

</head>
<body>
    <div style="width:550px">

        <form id="myForm" >
            <div class="row">
                <%--办理人--%>
                <div class="col-md-2">
                    <label for="traName">办理人:</label>
                </div>
                <div class="col-md-4">
                    <input type="text" class="form-control" name="traName" id="traName">
                </div>
                <%--手机号--%>
                <div class="col-md-2">
                    <label for="phone">手机号:</label>
                </div>
                <div class="col-sm-4">
                    <input type="text" class="form-control" name="phone" id="phone">
                </div>
            </div>
            <div class="row">
                <%--身份证号--%>
                <div class="col-md-2">
                    <label for="identity">身份证号:</label>
                </div>
                <div class="col-md-4">
                    <input type="text" class="form-control" name="identity" id="identity">
                </div>
                <%--代办人--%>
                <div class="col-md-2">
                    <label for="people">代办人:</label>
                </div>
                <div class="col-md-4">
                    <input type="text" class="form-control" name="people" id="people">
                </div>
            </div>
            <div class="row">
                <%--车牌号--%>
                <div class="col-md-2">
                    <label for="license">车牌号:</label>
                </div>
                <div class="col-md-4">
                    <input type="text" class="form-control" name="license" id="license">
                </div>
            </div>
            <div class="row">
                <%--身份证图片--%>
                <div class="col-md-2">身份证图片:
                   <%-- <label for="identityImg"></label>--%>
                </div>
                <div class="col-md-10">
                    <textarea name="identityImg"  class="form-control"></textarea>
                    <!--<input name="headimg"  id="hideImg" type="text" >-->
                    <img id="testimg" width="50"> <!-- 上传完显示的图片  -->
                    <div id="fileQueue"></div><!--文件上传的进度条  -->
                    <input id="uploadify" name="headimg" type="file" >
                   <%-- <input type="file" multiple class="projectfile" accept="image/*" name="file" id="identityImg">--%>
                </div>
            </div>
            <div class="row">
                <%--车辆合同图片--%>
                <div class="col-md-2">车辆合同图片:
                    <%--<label for="vehicleImg"></label>--%>
                </div>
                    <div class="col-md-10">
                        <textarea name="vehicleImg"  class="form-control"></textarea>
                        <!--<input name="headimg"  id="hideImg" type="text" >-->
                        <img id="testimg1" width="50"> <!-- 上传完显示的图片  -->
                        <div id="fileQueue1"></div><!--文件上传的进度条  -->
                        <input id="uploadify1" name="headimg1" type="file" >
                        <%-- <input type="file" multiple class="projectfile" accept="image/*" name="file" id="identityImg">--%>
                    </div>
            </div>
        </form>
    </div>
</body>

<script type="text/javascript">

    $(function () {
        preFile();
        preFile1();
    })

    //图片
    //杂七杂八start
    function preFile(){
//上传插件
        $("#uploadify").uploadify({
            //插件自带  不可忽略的参数
            'swf': '<%=request.getContextPath() %>/js/uploadify/uploadify.swf',
            //前台请求后台的url 不可忽略的参数                          //*****要修改路经 !!!!!!!!!!!!!!!!!!!!!!!!
            'uploader':'<%=request.getContextPath() %>/addFiletwo',
            //给div的进度条加背景 不可忽略
            'queueID': 'fileQueue',
            //上传文件文件名 !!!!!!!!!!!!!!!!!!与后台接口参数名字需要完全一致!!!!!!!!!!!!!!!!!!!!!!!!
            'fileObjName':'headimg',
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
                $("#testimg").attr("src",imgurl);
                //给隐藏的文本框赋值 传到后台
                $("[name='identityImg']").html(data); //改!!!!!!!!!!11111
            }
        });
    }








</script>

</html>
