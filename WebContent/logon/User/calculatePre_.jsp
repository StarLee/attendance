<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link style="text/css" rel="stylesheet" href="/attendance/css/content.css">
<title>统计工作量</title>
<script type="text/javascript" src="/attendance/script/domObject.js"></script>
<script type="text/javascript">
	
	function Sworkload(id)
	{
		var option={name:"workload",action:"/attendance/Workload.do",fieldsHidden:{batcherID:id}};
		var form=new FORM(option); 
		document.body.appendChild(form);
		form.submit();
	}
</script>


</head>
<body>
	<table width="700px" class="table_margin">
		<tr></tr>
		<c:forEach var="items" items="${list }">
			<tr class="bottom_line" align="center">
				<td width="230px">
					<img src="/attendance/css/images/icon_leaf2.png" height="14px">
					${items.semesterC }
				</td>
				<td width="230px">${items.statusC }</td>
				<td><input type="button" value="工作量详细"
					onclick="Sworkload(${items.id})" class="submit"></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>