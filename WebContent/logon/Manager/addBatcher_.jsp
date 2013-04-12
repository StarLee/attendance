<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="date" scope="page" class="java.util.Date"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link style="text/css" rel="stylesheet" href="/attendance/css/content.css">
<script type="text/javascript" src="/attendance/script/select.js"></script>
<style type="text/css"><!--@import url(/attendance/css/content.css);--></style>
<title>添加一个批次</title>
</head>
<body>
	<div class="table_margin">
		<h4>新建批次</h4>
		<form action="/attendance/SAddNewBatcher.do" method="post">
			<table class="table_margin">
				<tr>
					<td width="150px">
						<img src="/attendance/css/images/icon_leaf2.png" height="14px">
						请选择年份
					</td>
					<td width="155px">
						<div id="brown">
							<select name="year" id="brown">
								<c:forEach begin="0" end="10" step="1" varStatus="count">
									<option value=${1898+date.year+count.count}>${1898+date.year+count.count}</option>
								</c:forEach>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<img src="/attendance/css/images/icon_leaf2.png" height="14px">
						请选择学期
					</td>
					<td>
						<div id="brown">
							<select name="semester" id="brown">
								<option value="0">上学期</option>
								<option value="1">下学期</option>
							</select>
						</div>
					</td>
				</tr>
				<tr height="20px"></tr>
				<tr>
					<td></td>
					<td align="right">
						<input type="submit" value="创建" class="submit">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>