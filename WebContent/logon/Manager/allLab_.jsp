<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link style="text/css" rel="stylesheet" href="/attendance/css/content.css">
<title>实验室列表</title>
</head>
<body>
	<div style="margin:20px;">
		<input type="button" value="查看课程" onclick="javascript:location.href='/attendance/AllCourse.do'" 
			class="submit"/>
	</div>
	
	<div>
	<table width="700px" class="table_margin">
		<tr class="bottom_line">
			<th>实验室名称</th>
			<th>实验室门号</th>
			<th>实验室面积</th>
			<th>类型</th>
		</tr>
		<c:forEach items="${requestScope.list }" var="lab">
			<tr align="center" class="bottom_line">
				<td>
					<img src="/attendance/css/images/icon_leaf1.png" height="14px">
					${lab.labName}
				</td>
				<td>${lab.doorplate}</td>
				<td>${lab.labArea}</td>
				<td>${lab.typeC}</td>
				
			</tr>
		</c:forEach>
		
	</table>
	</div>
	<div style="margin:20px;">
		<input type="button" value="新建实验室" onclick="javascript:location.href='/attendance/AddNewLab.do'" 
			class="submit" style="margin-left:600px"/>
	</div>
</body>
</html>