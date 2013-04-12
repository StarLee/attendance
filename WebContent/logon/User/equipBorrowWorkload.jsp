<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>设备借用工作量</title>
</head>
<body>
	ID	编号
Administrator	管理员
QuantizationID	量化系数
EquipmentName	设备名称
BorrowTime	借出时间
BatcherID	批次的ID
BorrowMan	借用人
<div id="equipBorrowWorkload">
	<table>
		<tr>
			<td>借出设备名称</td>
			<td><input type="text" name="equipmentName">  </td>
		</tr>
		<tr>
			<td>借用人</td>
			<td><input type="text" name="borrowMan"> </td>
		</tr>
		<tr>
			<td>量化系数</td>
			<td>
				
			</td>
		</tr>
	</table>
</div>
</body>
</html>