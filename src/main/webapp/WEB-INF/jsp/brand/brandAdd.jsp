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

                <div class="col-md-2">
                    <label for="carsId">车系:</label>
                </div>
                <div class="col-md-4">
                    <%--<input name="carsId" class="easyui-combobox" data-options="prompt:'职位',valueField:'jobId',textField:'jobName',url:'${ctx }/employee/selectJobList.do'">
                    <select class="form-control"  name="carsId" id="carsId">
                        <option value="1">开发部</option>
                        <option value="2">财务部</option>
                        <option value="3">总裁办</option>
                    </select>--%>
                        <div class="dropdown">
                            <button type="button" class="btn dropdown-toggle" id="carsId" data-toggle="dropdown">车系
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" role="menu" aria-labelledby="carsId">
                                <li role="presentation" id="cars">

                                </li>
                            </ul>
                        </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-2">
                    <label for="oldName">车龄:</label>
                </div>
                <div class="col-md-4">
                    <select class="form-control"  name="oldName" id="oldName">
                        <option value="1">开发部</option>
                        <option value="2">财务部</option>
                        <option value="3">总裁办</option>
                    </select>
                </div>

                <div class="col-md-2">
                    <label for="modelsName">车型:</label>
                </div>
                <div class="col-md-4">
                    <select class="form-control"  name="modelsName" id="modelsName">
                        <option value="1">开发部</option>
                        <option value="2">财务部</option>
                        <option value="3">总裁办</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col-md-2">
                    <label for="mileageName">里程:</label>
                </div>
                <div class="col-md-4">
                    <select class="form-control"  name="mileageName" id="mileageName">
                        <option value="1">开发部</option>
                        <option value="2">财务部</option>
                        <option value="3">总裁办</option>
                    </select>
                </div>

                <div class="col-md-2">
                    <label for="displaceName">排量:</label>
                </div>
                <div class="col-md-4">
                    <select class="form-control"  name="displaceName" id="displaceName">
                        <option value="1">开发部</option>
                        <option value="2">财务部</option>
                        <option value="3">总裁办</option>
                    </select>
                </div>
            </div>
        </form>
    </div>
</body>
    <script>
        $(function () {
            initUserTable();
        })
        //初始课程类型
        function initUserTable(){
            $("#cars").combobox({
                url:"<%=request.getContextPath() %>/carsList",
                valueField:"id",
                textField:"carsName"
                /* multiple:true*/
            })
        }
    </script>
</html>
