<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<!-- 引入jquery js文件 -->
<script type="text/javascript" src="<%=request.getContextPath() %>/jquery-easyui-1.5/jquery.min.js"></script>
<!-- 引入bootstrap js/css文件 -->
<link href="<%=request.getContextPath() %>/js/bootstrap3/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap3/js/bootstrap.min.js"></script>
<!-- 引入bootstrap-addTabs js/css文件 -->
<link href="<%=request.getContextPath() %>/js/bootStrap-addTabs/bootstrap.addtabs.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/bootStrap-addTabs/bootstrap.addtabs.min.js"></script>


<link rel="stylesheet" href="<%=request.getContextPath() %>/alter/example.scss">
<!-- This is what you need -->
<script src="<%=request.getContextPath() %>/alter/sweet-alert.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/alter/sweet-alert.css">
<body>
    <div class="navbar navbar-inverse col-md-4 navbar-fixed-top container-fluid">
        <ul class="list-group">
            <li class="list-group-item">
                当前评论条数
                <span class="badge list-group-item-success" id="coun">4</span>
            </li>
            <li class="list-group-item">
                <input type="text" class="form-control" id="leaveWord" placeholder="请在这里评论！">
                <button type="button" class="btn btn-default" onclick="saveleaveWord()">提交评论</button>
            </li>
        </ul>
    </div>
    <div id="pccsid" class="col-lg-12">
    </div>
</body>
<script>
var count = 1;
function ChangeDateFormat(date) {
    return date.Format("yyyy-MM-dd hh:mm:ss");
 }



 function saveleaveWord(){
     swal({
             title: "您确定要向我们提交这个建议?",
             text: "您可以对我们提供一些意见！",
             type: "warning",
             showCancelButton: true,
             confirmButtonColor: "#DD6B55",
             confirmButtonText: "是的，这个建议很好!",
             cancelButtonText: "不,我觉得还有些问题!",
             closeOnConfirm: false,
             closeOnCancel: false
         },
         function(isConfirm){
             if (isConfirm) {
                 var leaveWordvalue = $("#leaveWord").val();
                 $.ajax({
                     url:"<%=request.getContextPath() %>/saveleaveWord",
                     type:"post",
                     data:{"leaveWordvalue":leaveWordvalue},
                     success:function(){
                         swal("提交成功!", "是的，我们收到了您的留言！", "success");
                         count = 1;
                         queryAdverti();
                         $("#leaveWord").val("");
                     }
                 })
             } else {
                 swal("已取消", "您可以继续进行编辑！", "error");
             }
         });


 }
$(function(){
    queryAdverti();
})
function queryAdverti(){
$.ajax({
        url:"<%=request.getContextPath() %>/queryAdverti",
            type:"post",
            success:function(data){
                $("#buttsss").attr("style","display:none;");
                var str = "";
                for(var i=0;i<data.length;i++) {
                    str += '<div class="media">' +
                        '<div class="media-left">' +
                        '<img class="media-object" src="./images/36.jpg" alt="...">' +
                        '</div>' +
                        '<div class="media-body">' +
                        '<h4 class="media-heading">' + data[i].userName + '</h4> ' +
                        '<p>' + data[i].leaveWord + '</p> ' +
                        '<p>' + count + '楼  ' + data[i].createdDate + '发表</p> ' +
                        '<hr>' +
                        '</div>' +
                        '</div>';
                    count = count+1;
                }
                $("#pccsid").html(str);
                $("#coun").html(data.length);
        }
    })
}
</script>
</html>
