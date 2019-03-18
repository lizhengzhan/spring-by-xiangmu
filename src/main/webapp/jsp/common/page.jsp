 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 		<center>
    		第 <input id="currentPage" readonly="readonly" value="1" type="text" size="1"> 页
    		共 <input id="totalPage" readonly="readonly" value="1" type="text" size="1">   页
    		共 <input id="totalCount" readonly="readonly" value="0" type="text" size="1" > 条
    		每页显示 <select id="pageSize" onchange="pageList(0)">
    			<option value="3">3</option>
    			<option value="6">6</option>
    			<option value="12">12</option>
    		</select> 条
    		<a onclick="pageList(1)" href="###">首页</a>
    		<a onclick="pageList(2)" href="###">上一页</a>
    		<a onclick="pageList(3)" href="###">下一页</a>
    		<a onclick="pageList(4)" href="###">尾页</a>
    	</center>  	
    	<script type="text/javascript">
    		function toPage(flag){
    			//获取当前页
    			var currentPage = $("#currentPage").val();
    			//获取每页显示条数
    			var pageSize = $("#pageSize").val();
    			//获取总页数
    			var totalPage = $("#totalPage").val();
    			
    			if(flag == 0){
    				$("#currentPage").val(1);
    			}
    			if(flag == 1){
    				if(currentPage == 1){
    					alert("当前已为首页！！！");
    					return ;
    				}
    				$("#currentPage").val(1);
    			}
    			if(flag == 2){
    				if(currentPage == 1 ){
    					alert("当前已为第一页！！！");
    					return ;
    				}
    				$("#currentPage").val(--currentPage);
    			}
    			if(flag == 3){
    				if(currentPage == totalPage){
    					alert("当前已为最后一页！！！");
    					return ;
    				}
    				$("#currentPage").val(++currentPage);
    			}
    			if(flag == 4){
    				if(currentPage == totalPage){
    					alert("当前已为尾页！！！");
    					return ;
    				}
    				$("#currentPage").val(totalPage);
    			} 
    		}
    		
    		function setPage(page){
    			//当前页
    			$("#currentPage").val(page.currentPage);
    			//每页显示条数
    			$("#pageSize").val(page.pageSize);
    			//总页数
    			$("#totalPage").val(page.totalPage);
    			//总条数
    			$("#totalCount").val(page.totalCount);
    		}
    	</script> 