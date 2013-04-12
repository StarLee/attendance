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
					<div>欢迎${sessionScope.user.user.userName }</div>
					<div style="height:20px;"></div>
					<div class="left_btn">
							<a title="添加新的用户" href="/attendance/AddUserIndex.do" class="btn">
							添加用户&nbsp;&nbsp;</a>
					</div>
					<div class="left_btn">
							<a title="查看用户信息" href="/attendance/AllUser.do" class="btn">
							管理用户&nbsp;&nbsp;</a>			
					</div>
					<div class="left_btn">
							<a title="教师管理" href="/attendance/AddTeacherIndex.do" class="btn">
							教师管理&nbsp;&nbsp;</a>
					</div>
					<div class="left_btn">
							<a title="查看实验室信息" href="/attendance/AllLab.do" class="btn">
							管理实验室</a>		
					</div>
					<div class="left_btn">
							<a title="新建日期批次" href="/attendance/AddNewBatcher.do" class="btn">
							批次管理&nbsp;&nbsp;</a>
					</div>
					<div class="left_btn">
							<a title="新建量化系数" href="/attendance/AddQuantify.do" class="btn">
							量化管理&nbsp;&nbsp;</a>
					</div>
					<div class="left_btn">
							<a title="审核普通用户工作" href="/attendance/MPreCalculate.do" class="btn">
							审核工作&nbsp;&nbsp;</a>
					</div>
					<div class="left_btn">
							<a title="退出系统登录" href="/attendance/Logout.do" class="btn">
							退出&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
					</div>
					</td>
		</tr>
	</table>

</div>

</body>
</html>