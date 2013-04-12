<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link style="text/css" rel="stylesheet" href="/attendance/css/content.css">
<!-- <script type="text/javascript" src="/attendance/script/select.js"></script> -->
<style type="text/css"><!--@import url(/attendance/css/content.css);--></style>
<title>量化参数的量化系数</title>
<script type="text/javascript" src="/attendance/script/jquery.min.js"></script>
<script type="text/javascript" src="/attendance/script/jquery-ui.min.js"></script>
<script type="text/javascript">
function g_info(ids) {
	var container = document.createElement("div");
	var settings = {
		url : "/attendance/QuantizationInfo.do",
		type : "POST",
		data:{id:ids},
		dataType : "JSON",
		success : function(datas) {
			var url="/attendance/UpdateQuantizationStandard.do";
			for (data in datas) {
				var item = document.createElement("div");
				var id = datas[data]["id"];
				var name = datas[data].batcherO.semesterC;
				$(item).append(name);
				$(item).append("<br/>");
				var radio = document.createElement("form");
				$(radio).attr("method", "post");
				$(radio).attr("action", url);
				var input=document.createElement("input");
				$(input).attr("type","text");
				$(input).attr("name","standard")
				$(radio).append(input);
				var inputid=document.createElement("input");
				$(inputid).attr("type","hidden");
				$(inputid).attr("value",id);
				$(inputid).attr("name","id");
				$(radio).append(inputid);
				var submitt=document.createElement("input");
				$(submitt).attr("type","submit");
				$(submitt).attr("value","保存");
				$(radio).append(submitt);
				$(item).append(radio);
				$(container).append(item);
			}
		}
	};
	$.ajax(settings);
	$(container).dialog({
		width :350,
		height : 200,
		title : "input value your expecting ",
		close : function(event, ui) {
			$(this).remove();
		}
	});
}
</script>
</head>
<body>
	<div class="table_margin">
		<div><h4>项目：${quantify.name }</h4></div>
		<div style="margin-top:20px;margin-bottom:10px">
			<img src="/attendance/css/images/icon_leaf4.png" height="14px">
			参数列表
		</div>
		<table width="640px">
			<tr class="bottom_line">
				<th width="240px">学期</th>
				<th width="200px">标准</th>
				<th>单位</th>
				<th/>
			</tr>
			<c:forEach var="info" items="${list }">
				<tr class="bottom_line" align="center">
					<td>${info.batcherO.semesterC }</td>
					<td>${info.standard }</td>
					<td>${info.unit }</td>
					<td>
						<input type="button" value="修改" onclick="g_info(${info.id})">
					</td>
				</tr>
			</c:forEach>
		</table>
		<form method="post" action="/attendance/AddQuantizationInfo.do">
		
		<input type="hidden" name="quantifyID" value="${quantify.id }">
			<table class="table_margin">
				<tr>
					<td>
						<img src="/attendance/css/images/icon_leaf2.png" height="14px">
						请选择时间					
					</td>
					<td>
							<select name="batcherID">
								<c:forEach var="batcher" items="${batcherList}">
									<option value=${batcher.id }>${batcher.semesterC }</option>
								</c:forEach>
							</select>
					</td>
				</tr>
				<tr>
					<td>
						<img src="/attendance/css/images/icon_leaf2.png" height="14px">
						系数标准
					</td>
					<td><input type="text" name="standard" class="text">
					</td>
				</tr>
				<tr>
					<td>
						<img src="/attendance/css/images/icon_leaf2.png" height="14px">
						单位
					</td>
					<td><input type="text" name="unit" class="text">
					</td>
				</tr>
				<tr align="right">
					<td colspan="2"><input type="submit" value="保存" class="submit"> </td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>