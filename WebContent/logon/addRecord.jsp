<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link style="text/css" rel="stylesheet" href="/attendance/css/content.css">
<title>添加记录</title>
</head>
<body>
	<div style="width:750px;height:100%;" class="table_margin">
		<div style="height:40px">
			<form action="/attendance/AddRecord.do" method="post">
				<input type="submit" value="登记今天" class="submit">
			</form>
		</div>
		<div style="height:60px">
				<form name="changeDate" action="/attendance/RecordsOfUser.do"
					method="post">
					<span>当前日期：${requestScope.default }${requestScope.date }</span>
					<input type="text" name="datePicker" disabled="disabled" value="选择日期 " id="datePicker" class="text">
					<input type="hidden" value="${requestScope.default }" name="date">
				</form>
				时间长度${requestScope.hours}小时;
		</div>
		<div style="width:100%;height:310px;overflow:scroll;">		
		<table width="100%">
			<tr height="20px" style="border-bottom: 2px solid #cccccc;">
				<th align="left">序号</th>
				<th>日期</th>
				<th>登记时间</th>
			</tr>
			<c:choose>
				<c:when test="${empty requestScope.records }">
					<tr height="60px" valign="middle">
						<td colspan="3" align="center">你今天还没有记录</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${requestScope.records }" var="record" varStatus="status">
						<tr height="24px;" style="border-bottom: 1px solid #cccccc;">
							<td>
								<img src="/attendance/css/images/icon_leaf4.png" height="14px">${status.count }
							</td>
							<td align="center">${record.loginDate }</td>
							<td align="center">${record.loginTime }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<tr>
				<td></td>
			</tr>
		</table>
		</div>
	</div>
</body>
</html>