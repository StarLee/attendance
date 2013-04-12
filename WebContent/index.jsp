<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>登陆</title>
<link href="./css/default.css" rel="stylesheet" style="text/css">
<script type="text/javascript">
	function formSubmit() {
		document.getElementById("logonForm").submit();
	}
</script>
</head>
<body>
	<div style="margin-top: 100px;">
		<div
			style="margin: auto; width: 550px; height: 448px; background-image: url('./imgs/logon_bg.png');">
			<div
				style="margin-top: 203px; margin-left: 125px; position: absolute;">
				<form method="post" action="/attendance/Logon.do" id="logonForm">
					<table>
						<tr style="height: 27px;">
							<td
								style="background-image: url('./imgs/logon_user.png');"></td>
							<td>用户名</td>
							<td><input type="text" name="userName" value="lixing"/></td>
						</tr>
						<tr style="height: 27px;">
							<td
								style="background-image: url('./imgs/logon_password.png'); width: 32px;"></td>
							<td>密码</td>
							<td><input type="password" name="password" value="lixing"/></td>
						</tr>
						<tr>
							<td colspan="3" height="70px"><div onclick="formSubmit()" title="点击登陆"
									style="cursor: pointer; position: relative; float: right; height: 25px; width: 60px; background-image: url('./imgs/logon_submit.jpg');"></div>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>

	</div>
</body>
</html>