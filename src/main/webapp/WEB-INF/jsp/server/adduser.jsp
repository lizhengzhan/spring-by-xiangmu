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
			    <label for="orderId">订单id:</label>
		  	</div>
		  	<div class="col-md-8">
			    <input type="text" class="form-control" name="orderId" id="orderId">
		  	</div><br>
			  <div class="col-md-4">
				  <label for="adressId">车辆所在地址:</label>
			  </div>
			  <div class="col-md-8">
				  <input type="text" class="form-control" name="adressId" id="adressId">
			  </div><br>
			  <div class="col-md-4">
				  <label for="userId">网站用户ID:</label>
			  </div>
			  <div class="col-md-8">
				  <input type="text" class="form-control" name="userId" id="userId">
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
</script>
</html>