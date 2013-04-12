<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>欢迎</title>
<link style="text/css" rel="stylesheet"
	href="/attendance/css/default.css">
<link style="text/css" rel="stylesheet" href="/attendance/css/basic.css">
<link style="text/css" rel="stylesheet"
	href="/attendance/css/jquery-ui.css">
<script type="text/javascript" src="/attendance/script/jquery.min.js"></script>
<script type="text/javascript" src="/attendance/script/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#datePicker").datepicker({
			dateFormat : "yy-mm-dd",
			showOn : "button",
			onClose:formSubmit
		});
	});
	function formSubmit()
	{
		$("input[name='date']").attr("value",$("#datePicker").attr("value"));
		$("form[name='changeDate']").submit();
	}
</script>
<style type="text/css">
h2
{
	color: white;
}

</style>
</head>
<body>
	<div class="default">
		<div>
			<%@include file="../Manager/top_index.jsp" %>
		</div>
		<div>
			
			<table class="content">
				<tr>
					<td height="100%">
						<%@include file="../Manager/left_index.jsp" %>
					</td>
					<td width="100%" height="100%">
						<table style="height: 100%; width: 100%;">
							<tr height="22px">
								<td>
									<div class="right">
										<div class="tab"></div>
									</div>
								</td>
							</tr>
							<tr>
								<td class="right_content" width="100%" height="100%">
									<div style="overflow: scroll; height: 447px;">
										${message }
									</div>
								</td>
							</tr>
							<tr>
								<td class="right_bottom"></td>
							</tr>
						</table></td>
				</tr>
			</table>
		</div>
		<div class="bottom"></div>
	</div>
</body>
</html>