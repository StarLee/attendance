<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link style="text/css" rel="stylesheet" href="/attendance/css/content.css">
<title>密码修改</title>
</head>
<body>
	<div>
		<div style="margin-top:20px">${message }</div>
		<form action="/attendance/SModifyPassword.do" method="post">
		<table style="margin: auto;margin-top:20px;">
			<tr>
				<td width="120px">
					<img src="/attendance/css/images/icon_leaf6.png" height="14px">初始密码
				</td>
				<td><input type="password" name="origin" class="text"> </td>
			</tr>
			<tr>
				<td>
					<img src="/attendance/css/images/icon_leaf6.png" height="14px">新密码
				</td>
				<td><input type="password" name="password" class="text"> </td>
			</tr>
			<tr>
				<td>
					<img src="/attendance/css/images/icon_leaf6.png" height="14px">确认密码
				</td>
				<td><input type="password" name="comfirm" class="text"> </td>
			</tr>
			<tr height="20px"></tr>
			<tr>
				<td align="right" colspan="2">
					<input type="submit" value="修改" class="submit">
				</td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>