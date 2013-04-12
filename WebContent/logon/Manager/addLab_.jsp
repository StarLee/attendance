<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link style="text/css" rel="stylesheet" href="/attendance/css/content.css">
<script type="text/javascript" src="/attendance/script/select.js"></script>
<style type="text/css"><!--@import url(/attendance/css/content.css);--></style>
<title>新建实验室</title>
</head>

<body>


<div>
	<form action="/attendance/SAddNewLab.do" method="post">
	<table class="table_margin">
		<tr>
			<td width="150px">
				<img src="/attendance/css/images/icon_leaf4.png" height="14px">
				实验室名称
			</td>
			<td>
				<input type="text" name="labName" class="text">
			</td>
		</tr>
		<tr>
			<td>
				<img src="/attendance/css/images/icon_leaf4.png" height="14px">
				实验室门牌号
			</td>
			<td>
				<input type="text" name="doorplate" class="text">
			</td>
		</tr>
		<tr>
			<td>
				<img src="/attendance/css/images/icon_leaf4.png" height="14px">
				实验室介绍
			</td>
			<td>
				<input type="text" name="labIntro" class="text">
			</td>
		</tr>
		<tr>
			<td>
				<img src="/attendance/css/images/icon_leaf4.png" height="14px">
				实验室面积
			</td>
			<td>
				<input type="text" name="labArea" class="text">
			</td>
		</tr>
		<tr>
			<td>
				<img src="/attendance/css/images/icon_leaf4.png" height="14px">
				实验室类型
			</td>
			<td>
				<div id="brown">
					<select name="type" id="brown" >
						<option value="1">机房</option>
						<option value="2">机房实验室</option>
						<option value="3">纯实验室</option>
					</select>
				</div>
			</td>
		</tr>
		<tr height="25"></tr>
		<tr>
			<td>
				
			</td>
			<td>
				<input type="submit" value="提交" class="submit">
			</td>
		</tr>
	</table>
	</form>
</div>

</body>
</html>