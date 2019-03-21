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
            <div class="col-md-4">
                <label for="yuYueName">预约人:</label>
            </div>
            <div class="col-md-8">
                <input type="text" name="id" id="id" style="display: none">
                <input type="text" class="form-control" name="yuYueName" id="yuYueName">
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <label for="yuYuePhone">预约手机号:</label>
            </div>
            <div class="col-md-8">
                <input type="text" class="form-control" name="yuYuePhone" id="yuYuePhone">
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <label for="cheId">车辆ID:</label>
            </div>
            <div class="col-md-8">
                <select class="form-control"  name="cheId" id="cheId">
                    <option value="121">121</option>
                    <option value="23">23</option>
                    <option value="442">442</option>
                </select>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <label for="chePinPai">车辆品牌:</label>
            </div>
            <div class="col-md-8">
                <select class="form-control"  name="chePinPai" id="chePinPai">
                    <option value="aodi">aodi</option>
                    <option value="benchi">benchi</option>
                    <option value="dazhong">dazhong</option>
                </select>
            </div>
        </div>
        <div>
            <div class="col-md-4">
                <label>客服:</label>
            </div>
            <div class="col-md-8">
                <input type="text" class="form-control" name="keFuId" id="keFuId">
            </div>
        </div>

    </form>
</div>
</body>
</html>
