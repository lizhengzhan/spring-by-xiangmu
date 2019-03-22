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
				<label for="id">id:</label>
			</div>
			<div class="col-md-8">
				<input type="text" name="grades" id="grades" style="display: none">
				<input type="text" name="areapids" id="areapids" style="display: none">
				<input type="text" readonly="true" class="form-control" name="id" id="id">
			</div><br>
			<div class="col-md-4">
				<label for="orderId">订单号:</label>
			</div>
			<div class="col-md-8">
				<input type="text" class="form-control" name="orderId" id="orderId">
			</div><br>
			<div class="col-md-2">
				<label for="adressId">所在地:</label>
			</div>
			<div class="col-sm-5">
				<select name="input_province" id="input_province" class="form-control" >
					<option value="">--请选择--</option>
				</select>
			</div>
			<div class="col-sm-5">
				<select name="adressId" id="adressId" class="form-control">
					<option value=""></option>
				</select>
			</div>
			<div class="col-md-4">
				<label for="userWang">网站用户:</label>
			</div>
			<div class="col-md-8">
				<input type="text" class="form-control" name="userWang" id="userWang">
			</div><br>
			<div class="col-md-4">
				<label for="authMen">认证人:</label>
			</div>
			<div class="col-md-8">
				<input type="text" class="form-control" name="authMen" id="authMen">
			</div><br>
			<div class="col-md-4">
				<label for="makeMoney">打款账号:</label>
			</div>
			<div class="col-md-8">
				<input type="text" class="form-control" name="makeMoney" id="makeMoney">
			</div><br>
			<div class="col-md-4">
				<label for="getMoney">收款人:</label>
			</div>
			<div class="col-md-8">
				<input type="text" class="form-control" name="getMoney" id="getMoney">
			</div>
		</div>
	</form>
</div>
</body>
<script type="text/javascript">
	$(function () {
		var html = "";
		$("#input_city").append(html);
		/*$("#input_area").append(html);*/
		$.ajax({
			url:"<%=request.getContextPath() %>/area/queryArea?ids=0",
			type:"post",
			success:function(data){
				$.each(data, function (idx, item) {
					html += "<option value=" + item.id + " >" + item.name + "</option>";
				});
				$("#input_province").append(html);
				$("#input_province").val($("#grades").val());
				$("#input_province").change();
			}
		});
	});

	$("#input_province").change(function () {
		if ($(this).val() == "") return;
		$("#adressId option").remove();
		var code = $(this).find("option:selected").val();
		$.ajax({
			url:"<%=request.getContextPath() %>/area/queryArea2?ids="+code,
			type:"post",
			success:function(data){
				var areapids = $("#areapids").val();
				var html = "<option value=''>--请选择--</option>";
				$.each(data, function (idx, item) {
					if(areapids == item.id){
						html += "<option value=" + item.id + " selected = 'selected'>" + item.name + "</option>";
					}else {
						html += "<option value=" + item.id + " >" + item.name + "</option>";
					}
				});
				$("#adressId").append(html);
			}
		});
	});
</script>
</html>