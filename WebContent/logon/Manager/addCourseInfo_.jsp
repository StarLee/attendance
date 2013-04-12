<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link style="text/css" rel="stylesheet"
	href="/attendance/css/content.css">
<title>添加课程信息</title>
<script type="text/javascript" src="/attendance/script/jquery.min.js"></script>
<script type="text/javascript" src="/attendance/script/jquery-ui.min.js"></script>
<script type="text/javascript">
	function g_teachers() {
		var container = document.createElement("div");
		var settings = {
			url : "/attendance/AllTeacherJSON.do",
			type : "POST",
			dataType : "JSON",
			success : function(datas) {
				for (data in datas) {
					var item = document.createElement("div");
					var id = datas[data]["id"];
					var name = datas[data]["teacherName"];
					$(item).append(id);
					$(item).append(name);
					var radio = document.createElement("input");
					$(radio).attr("type", "radio");
					$(radio).attr("name", "teacher");
					$(radio).bind("click", {
						idd : id,
						namee : name
					}, function(event) {
						$("#teachers").attr("value", event.data.namee);
						$("#teacher").attr("value", event.data.namee);
						$("#teacherID").attr("value", event.data.idd);
					});
					$(item).append(radio);
					$(container).append(item);
				}
			}
		};
		$.ajax(settings);
		$(container).dialog({
			width : 500,
			height : 400,
			position : [ 728, 200 ],
			title : "select one teacher",
			close : function(event, ui) {
				$(this).remove();
			}
		});
	}
	function g_labs() {
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
		head.insertCell(head.cells.length).innerHTML = "实验室门号";
		head.insertCell(head.cells.length).innerHTML = "实验室名";
		head.insertCell(head.cells.length).innerHTML = "实验室类型";
		head.insertCell(head.cells.length);
		var settings = {
			url : "/attendance/AjaxLab.do",
			type : "POST",
			dataType : "JSON",
			success : function(datas) {
				for (data in datas) {
					var item = table.insertRow(table.rows.length);
					$(item).css({
						"border-bottom" : "1px solid"
					});
					var id = datas[data]["id"];
					var doorplate = datas[data]["doorplate"];
					var name = datas[data]["labName"];
					var type = datas[data]["typeC"];
					item.insertCell(item.cells.length).innerHTML = id;
					item.insertCell(item.cells.length).innerHTML = doorplate;
					item.insertCell(item.cells.length).innerHTML = name;
					item.insertCell(item.cells.length).innerHTML = type;
					var radio = document.createElement("input");
					$(radio).attr("type", "radio");
					$(radio).attr("name", "teacher");
					$(radio).bind("click", {
						idd : id,
						namee : name
					}, function(event) {
						$("#labs").attr("value", event.data.namee);
						$("#lab").attr("value", event.data.namee);
						$("#labID").attr("value", event.data.idd);
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
			position : [ 728, 150 ],
			title : "select one lab",
			close : function(event, ui) {
				$(this).remove();
			}
		});
	}
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
					$(radio).attr("type", "radio");
					$(radio).attr("name", "teacher");
					$(radio).bind("click", {
						idd : id,
						namee : type
					}, function(event) {
						$("#batcher").attr("value", event.data.namee);
						$("#batchers").attr("value", event.data.namee);
						$("#batcherID").attr("value", event.data.idd);
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
			position : [ 728, 150 ],
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
		<form action="SAddCourseInfo.do" method="post">
			<table class="table_margin">
				<tr>
					<td width="150px"><img
						src="/attendance/css/images/icon_leaf4.png" height="14px">
						课程号</td>
					<td><input type="text" name="courseID" class="text"></td>
				</tr>
				<tr>
					<td><img src="/attendance/css/images/icon_leaf4.png"
						height="14px"> 课程名称</td>
					<td><input type="text" name="courseName" class="text">
					</td>
				</tr>
				<tr>
					<td><img src="/attendance/css/images/icon_leaf4.png"
						height="14px"> 所在实验室</td>
					<td><input type="text" disabled="disabled" name="labNames"
						class="text" id="labs"> 
						<input type="hidden" name="labName"
						class="text" id="lab" id="lab"> 
						<input type="hidden" name="labID"
						id="labID"> <input type="button" onclick="g_labs()"
						value="选择"></td>
				</tr>
				<tr>
					<td><img src="/attendance/css/images/icon_leaf4.png"
						height="14px"> 任课老师</td>
					<td><input type="text" name="teacherNames" disabled="disabled"
						class="text" id="teachers"> 
						<input type="hidden" name="teacherName"
						class="text" id="teacher">
						<input type="hidden"
						name="teacherID" id="teacherID"> <input type="button"
						onclick="g_teachers()" value="选择"></td>
				</tr>
				<tr>
					<td><img src="/attendance/css/images/icon_leaf4.png"
						height="14px"> 所用软硬件</td>
					<td><input type="text" name="software" class="text"></td>
				</tr>
				<tr>
					<td><img src="/attendance/css/images/icon_leaf4.png"
						height="14px"> 周次</td>
					<td><input type="text" name="weektime" class="text"></td>
				</tr>

				<tr>
					<td><img src="/attendance/css/images/icon_leaf4.png"
						height="14px"> 批次</td>
					<td><input type="text" name="batchers" class="text"
						id="batchers" disabled="disabled">
						<input type="hidden" name="batcher" class="text"
						id="batcher">
						
						<input type="hidden"
						name="batcherID" id="batcherID"> <input type="button"
						value="选择" onclick="g_batchers()"></td>

				</tr>
				<tr height="25"></tr>
				<tr>
					<td></td>
					<td><input type="submit" value="提交" class="submit"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>