<%--
  Created by IntelliJ IDEA.
  User: 瑞瑞
  Date: 2019/3/19
  Time: 8:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div style="width:550px">
        <form id="myForm">
                <div class="row">
                    <div class="col-md-2">
                        <label for="brandName">品牌名称:</label>
                    </div>
                    <div class="col-md-4">
                        <input type="text" class="form-control" name="brandName" id="brandName">
                    </div>
                    <%--车系--%>
                    <div class="col-md-2">
                        <label for="carsId">车系:</label>
                    </div>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" name="carsId" id="carsId">
                        <%--<select name="carsId" id="carsId" class="form-control" >
                            <option value="">--请选择--</option>
                        </select>--%>
                    </div>
                </div>
                <div class="row">
                    <%--车龄--%>
                    <div class="col-md-2">
                        <label for="oldId">车龄:</label>
                    </div>
                    <div class="col-md-4">
                        <input type="text" class="form-control" name="oldId" id="oldId">
                    </div>
                    <%--车型--%>
                    <div class="col-md-2">
                        <label for="modelsId">车型:</label>
                    </div>
                    <div class="col-md-4">
                        <input type="text" class="form-control" name="modelsId" id="modelsId">
                    </div>
                </div>
                <div class="row">
                    <%--里程--%>
                    <div class="col-md-2">
                        <label for="mileageId">里程:</label>
                    </div>
                    <div class="col-md-4">
                        <input type="text" class="form-control" name="mileageId" id="mileageId">
                    </div>
                    <%--排量--%>
                    <div class="col-md-2">
                        <label for="displaceId">排量:</label>
                    </div>
                    <div class="col-md-4">
                        <input type="text" class="form-control" name="displaceId" id="displaceId">
                    </div>
                 </div>
        </form>
    </div>
</body>
<%--
<script>
    $(function(){
        $.ajax({
            url : "<%=request.getContextPath() %>/carsList",
            async : true,
            type: "POST",
            dataType: "json",
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            success : function(data) {
                var html = "";
                for(var i in data){
                    html += '<option value="'+data.id+'">'+data.carsName+'</option>';
                }
                $("#carsId").html(html);
            },
            error : function(e){
                alert("代码有问题，请打开F12和debug进行调试！");
            }
        })
    })
    </script>
--%>


</html>
