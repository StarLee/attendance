<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link style="text/css" rel="stylesheet" href="/attendance/css/content.css">
<script type="text/javascript" src="/attendance/script/select.js"></script>
<style type="text/css"><!--@import url(/attendance/css/content.css);--></style>
<title>添加用户</title>
</head>
<body>
	<div style="margin-top: 12px;">
		<form action="/attendance/AddUser.do" method="post">
			<table style="margin: auto;">
				<tr>
					<td width="73px">
						<img src="/attendance/css/images/icon_leaf6.png" height="14px">用户名
					</td>
					<td><input type="text" name="userName" class="text">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div style="float:right">*初始密码为123456</div>	
					</td>
				</tr>
				<tr>
					<td>
						<img src="/attendance/css/images/icon_leaf6.png" height="14px">姓名
					</td>
					<td><input type="text" name="name" class="text">
					</td>
				</tr>
				<tr>
					<td>
						<img src="/attendance/css/images/icon_leaf6.png" height="14px">工作号
					</td>
					<td><input type="text" name="workNum" class="text">
					</td>
				</tr>
				<tr>
					<td>
						<img src="/attendance/css/images/icon_leaf6.png" height="14px">类型
					</td>
					<td>
						<div id="brown">
							<select name="type" id="brown">
								<option value="1">坐班</option>
								<option value="2">半坐班</option>
								<option value="3">实验室管理</option>
							</select>
						</div>
					</td>
				</tr>
				<tr height="20px"></tr>
				<tr>
					<td colspan="2"><input type="submit" name="submit" value="提交" 
						class="submit" style="float:right;">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>