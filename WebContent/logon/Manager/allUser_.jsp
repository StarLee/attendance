<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link style="text/css" rel="stylesheet" href="/attendance/css/content.css">
<title>所有用户名单</title>
<script type="text/javascript" src="/attendance/script/jquery.min.js"></script>
<script type="text/javascript" src="/attendance/script/jquery-ui.min.js"></script>
<style type="text/css">
.userTable tr
{
	border-bottom: 1px solid rgb(201,178,104);
}

</style>
<script type="text/javascript">
	function changeStatus(id,status)
	{
		$("#status").attr("value",status);
		$("#userID").attr("value",id);
		$("form[name='statusChange']").submit();
	}
	function lookup(id)
	{
		$("#infoID").attr("value",id);
		$("form[name='infoForm']").submit();
	}
</script>
</head>
<body>
	<form action="/attendance/UserStatusChange.do" method="post" name="statusChange">
		<input id="status" type="hidden" name="status">
		<input id="userID" type="hidden" name="id">
	</form>
	<form action="/attendance/GetUser.do" method="post" name="infoForm">
		<input  type="hidden" name="id" id="infoID">
	</form>
	<table class="userTable table_margin">
		<tr>
			<th width="130px">名字</th>
			<th width="150px">用户ID</th>
			<th width="150px">当前状态</th>
			<th width="220px">改变状态</th>
		</tr>
		<c:forEach items="${requestScope.list}" var="users">
			<tr align="center">
				<td>
					 <img src="/attendance/css/images/icon_leaf5.png" height="14px">${users.name }(${users.userName})
				</td>
				<td>${users.id }</td>
				<c:if test="${users.status eq 0}">
					<td>启用</td>
				</c:if>
				<c:if test="${users.status eq 1}">
					<td>停用</td>
				</c:if>
				<td>
				<input type="button" value="注销" name="changeStatus" onclick="changeStatus(${users.id},${users.status})" class="button_green"/>
				<input type="button" value="查看" onclick="lookup(${users.id})" class="button_green"> 
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>