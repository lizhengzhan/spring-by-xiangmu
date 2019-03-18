<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <style type="text/css">
        .row{
            margin-bottom:10px
        }
    </style>
</head>
<body>
<div style="width:550px">
    <form id="myForm">
        <div class="row">
            <div class="col-md-2">
                <label for="consumerName">姓名:</label>
            </div>
            <div class="col-md-4">
                <input type="text" name="consumerId" id="consumerId" style="display: none">
                <input type="text" class="form-control" name="consumerName" id="consumerName">
            </div>

            <div class="col-md-2">
                <label for="consumerCastId">身份证:</label>
            </div>
            <div class="col-md-4">
                <input type="text" class="form-control" name="consumerCastId" id="consumerCastId">
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <label for="consumerPhone">手机号:</label>
            </div>
            <div class="col-md-4">
                <input type="text" class="form-control" name="consumerPhone" id="consumerPhone">
            </div>
            <div class="col-md-2">
                <label for="consumerCode">验证码:</label>
            </div>
            <div class="col-md-4">
                <input type="text" class="form-control" name="consumerCode" id="consumerCode">
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <label for="consumerCity">上牌城市:</label>
            </div>
            <div class="col-md-4">
                <select class="form-control"  name="consumerCity" id="consumerCity">
                    <option value="北京">北京</option>
                    <option value="南京">南京</option>
                    <option value="杭州">杭州</option>
                </select>
            </div>
            <div class="col-md-2">
                <label for="consumerJob">工作情况:</label>
            </div>
            <div class="col-md-4">
                <select class="form-control"  name="consumerJob" id="consumerJob">
                    <option value="开发">开发</option>
                    <option value="会计">会计</option>
                    <option value="产品">产品</option>
                </select>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <label>收入情况:</label>
            </div>
            <div class="col-md-4">
                <select class="form-control"  name="consumerIncome" id="consumerIncome">
                    <option value="5w-10w">5w-10w</option>
                    <option value="10w-15w">10w-15w</option>
                    <option value="15w-20w">15w-20w</option>
                </select>
            </div>
            <div class="col-md-2">
                <label>客服:</label>
            </div>
            <div class="col-md-4">
                <input type="text" class="form-control" name="keFuId" id="keFuId">
            </div>
        </div>

    </form>
</div>
</body>
</html>