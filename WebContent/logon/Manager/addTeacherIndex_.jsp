<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>添加教师</title>
</head>
<body>
	<br />
	<form action="/attendance/AddTeacher.do" method="post">
		教师姓名:<input type="text" name="name" /> <input type="submit" value="保存">
	</form>
	<hr />
	<table style="width: 90%; margin: auto;">
		<tr style="border-bottom: 1px solid;">
			<th>姓名</th>
			<th/>
		</tr>
		<c:forEach items="${requestScope.list }" var="item">
			<tr style="border-bottom: 1px solid;">
				<td>${item.teacherName }</td>
				<td><a href="/attendance/DeleteTeacher.do?id=${item.id }">删除</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>