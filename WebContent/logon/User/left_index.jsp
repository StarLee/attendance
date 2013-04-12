<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link style="text/css" rel="stylesheet" href="/attendance/css/left_index.css">
</head>

<body>
<div class="left">
	<table width="100%">
		<tr>
			<td width="5px;"></td>
			<td>
				<table>
					<tr>
						<td>
							<div>欢迎${sessionScope.user.user.userName }</div></td>
					</tr>
					<tr>
						<td><a href="/attendance/CModifyPassword.do" class="btn">修改密码&nbsp;&nbsp;</a></td>
					</tr>
					<tr>
						<td><a href="/attendance/PreCalculate.do" class="btn">工作量服务</a></td>
					</tr>
					<tr>
						<td><a href="/attendance/Logout.do" class="btn">退出&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></td>
					</tr>
				</table></td>
		</tr>
	</table>

</div>

</body>
</html>