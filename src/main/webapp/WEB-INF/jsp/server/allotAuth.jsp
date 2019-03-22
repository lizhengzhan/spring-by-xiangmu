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
			    <label for="userName">认证员:</label>
		  	</div>
		  	<div class="col-md-8">
				<select name="userName" id="userName" class="form-control" >
					<option value="">--请选择--</option>
				</select>
		  	</div>
		  </div>
		</form>
	</div>
</body>
<script type="text/javascript">
	$(function () {
		var html = "";
		$("#userName").append(html);
		/*$("#input_area").append(html);*/
		$.ajax({
			url:"<%=request.getContextPath() %>/server/allotAuth",
			type:"post",
			success:function(data){
				$.each(data, function (idx, item) {
					html += "<option value=" + item.id + " >" + item.userName + "</option>";
				});
				$("#userName").append(html);
			}
		});
	});
</script>
</html>