<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link style="text/css" rel="stylesheet" href="/attendance/css/content.css">
<title>所有用户的工作量简表</title>
<style type="text/css">
.even{
	background-color:rgba(201,178,147,0.3);
}
.odd{
	background-color:rgba(255,255,255,0.3);
}
</style>
 <script type="text/javascript">
 $(function(){
 	$(".interleaved tr:even").addClass("even");
 	$(".interleaved tr:odd").addClass("odd");})
 </script>
</head>

<body>
	<table class="table_margin interleaved" width="120%" style="overflow:scroll;">
		<tr align="center" style="font-weight:bold" class="bottom_line">
			<td>序号</td>
			<td>用户</td>
			<td>常规工作量</td>
			<td>开放工作量</td>
			<td>设备借用工作量</td>
			<td>设备维护工作量</td>
			<td>坐班工作量</td>
			<td>加班工作量</td>
			<td>实验室课程工作量</td>
			<td>工作量总量</td>
		</tr>
		<c:forEach items="${list }" var="user">
			<tr align="center" class="bottom_line">
				<td>${user.userID }</td>
				<td>${user.user }</td>
				<td>${user.regular }</td>
				<td>${user.open }</td>
				<td>${user.borrow }</td>
				<td>${user.fix }</td>
				<td>${user.legal }</td>
				<td>${user.extra }</td>
				<td>${user.course }</td>
				<td>${user.all }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>