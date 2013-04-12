<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link style="text/css" rel="stylesheet"
	href="/attendance/css/content.css">
<title>实验室列表</title>
<script type="text/javascript" src="/attendance/script/jquery.min.js"></script>
<script type="text/javascript" src="/attendance/script/jquery-ui.min.js"></script>
<script type="text/javascript">
	function g_batchers() {
		var container = document.createElement("div");
		var table = document.createElement("table");
		$(table).css({
			border : "1px solid",
			width : "100%"
		});
		var head = table.insertRow(table.rows.length);
		$(head).css({
			"border-bottom" : "1px solid"
		});
		head.insertCell(head.cells.length).innerHTML = "编号";
		head.insertCell(head.cells.length).innerHTML = "年份";
		head.insertCell(head.cells.length).innerHTML = "学期";
		head.insertCell(head.cells.length);
		var settings = {
			url : "/attendance/AllBatcher.do",
			type : "POST",
			dataType : "JSON",
			success : function(datas) {
				for (data in datas) {
					var item = table.insertRow(table.rows.length);
					$(item).css({
						"border-bottom" : "1px solid"
					});
					var id = datas[data]["id"];
					var name = datas[data]["year"];
					var type = datas[data]["semesterC"];
					item.insertCell(item.cells.length).innerHTML = id;
					item.insertCell(item.cells.length).innerHTML = name;
					item.insertCell(item.cells.length).innerHTML = type;
					var radio = document.createElement("input");
					$(radio).attr("type", "button");
					$(radio).attr("name", "teacher");
					$(radio).attr("value", "选择");
					$(radio).bind("click", {
						idd : id,
						namee : type
					}, function(event) {
						$("#batcher").attr("value", event.data.namee);
						window.location = "/attendance/AllCourseByBatcher.do?batcherID="+event.data.idd;
					});
					item.insertCell(item.cells.length).appendChild(radio);
				}
			}
		};
		$.ajax(settings);
		$(container).append(table);
		$(container).dialog({
			width : 500,
			height : 400,
			title : "select one batcher",
			close : function(event, ui) {
				$(this).remove();
			}
		});
	}
</script>
</head>
<body>

	<div>

		<div style="margin: 20px;">
			<input type="button" value="添加课程"
				onclick="javascript:location.href='/attendance/AddCourseInfo.do'"
				class="submit" style="margin-left: 600px" /> <input class="submit"
				type="button" value="选择批次" onclick="g_batchers()">
		</div>
		<div style="height: 350px;overflow:scroll;">
			<table width="700px" class="table_margin">
				<tr class="bottom_line">
					<th>课程号</th>
					<th>课程名称</th>
					<th>所在实验室</th>
					<th>教师</th>
					<th>所用软硬件</th>
					<th>周次</th>
					<th>批次</th>
				</tr>
				<c:forEach items="${requestScope.list }" var="course">
					<tr align="center" class="bottom_line">
						<td><img src="/attendance/css/images/icon_leaf3.png"
							height="14px"> ${course.id }</td>
						<td>${course.studentClass}</td>
						<td>${course.lab.labName }</td>
						<td>${course.teacher.teacherName }</td>
						<td>${course.type }</td>
						<td>${course.studyTime }</td>
						<td>${course.batcher.semesterC }</td>
					</tr>
				</c:forEach>

			</table>
		</div>
	</div>
</body>
</html>