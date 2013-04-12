<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户信息</title>
<link style="text/css" rel="stylesheet"
	href="/attendance/css/jquery-ui.css">
<link style="text/css" rel="stylesheet"
	href="/attendance/css/content.css">


<script type="text/javascript" src="/attendance/script/jquery.min.js"></script>
<script type="text/javascript" src="/attendance/script/jquery-ui.min.js"></script>
<script type="text/javascript" src="/attendance/script/jquery.form.js"></script>
<style type="text/css">
.user_head {
	color: rgb(37, 112, 56);
}

#dialog {
	font-size: 14px;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#dialog").dialog({
			autoOpen : false,
			width : 200,
			height : 100,
			title : "请选择时间"
		});
		$("#dialogLabs").dialog({
			autoOpen : false,
			width : 500,
			height : 300,
			title : "所有实验室",
			close : clearContent
		});
		
		var options = { 
		        success:showResponse,
		        dataType:  "json", 
		        clearForm: true,     
		        resetForm: true ,  
		    }; 
		    $('#LabRelation').ajaxForm(options); 
		
	});
	function openDialog() {
		$("#dialog").dialog("open");
	}
	function getLabs() {
		$("#batcherID").attr("value",$("#batcher option:selected").attr("value"));
		$.ajax({
			type : "POST",
			url : "/attendance/AjaxLab.do",
			dataType : "JSON",
			data : "batcherID=" + $("#batcher option:selected").attr("value"),
			success : addLabsContent
		});
		$("#dialog").dialog("close");
	}
	function addLabsContent(data) {
		var n = data.length;
		var table = document.getElementById("content");
		var row;
		var first;
		for ( var i = 0; i < n; i++) {

			if (i % 3 == 0) {

				row = table.insertRow(0);
			}
			first = row.insertCell(row.length);
			first.innerHTML = '<input type="checkbox" name="labID" value="'+data[i].id+'">'
					+ data[i].doorplate + data[i].labName;
		}
		$("#dialogLabs").dialog("open");
	}
	function clearContent() {
		$("#content").empty();
	}
	function showResponse(data)
	{
		//更新内容
		$("#dialogLabs").dialog("close");
	}
	function g_delete(id)
	{
		if(confirm("警告，如果已经记录在在，将无法这个关联"))
		{
			window.location="/attendance/DeleteLabToAdmin.do?id="+id;	
		}
	}
	function g_Quantization(coursediv,labtoadmin,batcherid,libid,courseid,url,func)
	{
		var options={
				 url:"/attendance/GetQuantizationBatcher.do",
				 type:"post",
				 dataType:"json",
				 data:{batcherID:batcherid,type:"3"},
				 success:function(data){pop_Dialog(coursediv,data,labtoadmin,batcherid,libid,courseid,url,func);}
		};
		$.ajax(options);	
	}
	
	function pop_Dialog(coursediv,datas,labtoadmin,batcherid,labid,courseid,url,func)
	{
		var div=document.createElement("div");
		var table=document.createElement("table");
		$(table).attr({width:"100%",border:"1px solid"});
		var n=0;
		var tr=null;
		$(div).append("labtoadmin:"+labtoadmin+"batcherid:"+batcherid+"libid:"+labid+"courseid:"+courseid);
		if(datas.length==0)
			{
				$(div).append("没有发现在课程系统，请添加指定批次下的系数");
			}
		else{
		for(n=0;n<datas.length;n++)
		{
			if(n%3==0)
				tr=table.insertRow(table.rows.length);
			var td=tr.insertCell(tr.cells.length);
			var input=document.createElement("input");
			$(input).attr("type","checkbox");
			var param={quantizationID:datas[n].id,dialog:div,coursediv:coursediv}
			$(input).bind("click",param,function(eve){
				//var params={batcherID:batcherid,userID:userid,quantizationid:eve.data.quantizationID};
				var params={batcherid:batcherid,courseID:courseid,labid:labid,labToAdminID:labtoadmin,quantizationID:eve.data.quantizationID};
				i_Quantization(params,coursediv,eve.data.dialog);
			});
			$(td).append(input);
			$(td).append(datas[n].quantifyO.name);
		}
		var lastr=table.rows[table.rows.length-1];
		while(lastr.cells.length<3)
		{
			tr.insertCell(tr.cells.length);
		}
		$(div).append(table);
		}
		$(div).dialog({
			title:"please select item",
			width:500,
			height:400
		});
	}
	
	function i_Quantization(params,coursediv,dialog)
	{
		var options={
				data:params,
				type:"post",
				dataType:"json",
				url:"/attendance/AddNewCourseWorkload.do",
				success:function(data)
				{
					u_course(coursediv,params.labToAdminID,params.batcherid,params.labid);
					$(dialog).dialog("close");
				}
		}
		$.ajax(options);
	}
	
	function u_course(div,labtoadmin,bid,lid)
	{
		var options={
				dataType:"json",
				type:"post",
				data:{batcherid:bid,labid:lid},
				url:"/attendance/GetLabsCourse.do",
				success:function(datas)
				{
					
					
					if(datas.length==0)
					{	
						$(div).append("当前实验室没有课程");
					}
					else
						{
						var table=document.createElement("table");
						var trtitle=table.insertRow(table.rows.length);
						$(table).css("width","100%");
						$(table).attr("border","1px");
						var tdtitle=trtitle.insertCell(trtitle.cells.length);
						$(tdtitle).append("课程");
						var tdtitle1=trtitle.insertCell(trtitle.cells.length);
						for(data in datas)
							{
								var tr=table.insertRow(table.rows.length);
								var td=tr.insertCell(tr.cells.length);
								$(td).append(datas[data].studentClass);
								var tdinput=tr.insertCell(tr.cells.length);
								var input=document.createElement("input");
								$(input).attr("type","button");
								$(input).attr("value","加入工作量");
								$(input).bind("click",{coursediv:div,labtoadmin:labtoadmin,bid:bid,lid:lid,courseid:datas[data].id},function(eve){
									g_Quantization(eve.data.coursediv,eve.data.labtoadmin,eve.data.bid,eve.data.lid,eve.data.courseid);
								});
								if(datas[data].hasAddToWorkload=="1")
									$(tdinput).append("已添加");
								else
									$(tdinput).append(input);
							}
						$(div).html(table);
						}
					$(div).dialog({
						title:"belongs course",
						width:350,
						height:400
					});
				}
		};
		$.ajax(options);
	}
	
	function g_course(labtoadmin,bid,lid)
	{
		var div=document.createElement("div");
		u_course(div,labtoadmin,bid,lid);
	}
</script>
</head>
<body>
	<div>
		<table width="700px" class="table_margin">
			<tr class="bottom_line">
				<td class="user_head">姓名：</td>
				<td>${user.name}</td>
				<td class="user_head">工作号：</td>
				<td>${user.workNum }</td>
				<td class="user_head">用户类型：</td>
				<td>${user.typeC}</td>
				<td class="user_head">用户状态：</td>
				<td>${user.statusC }</td>
				<td><input type="button" onclick="openDialog()" value="关联实验室"
					class="submit"></td>
			</tr>
		</table>
		<div style="margin-top: 15px; margin-bottom: 5px; font-weight: bold">其分属的实验室</div>
		<table width="700px" class="table_margin">
			<tr class="bottom_line">
				<th width="230px">实验室</th>
				<th width="230px">学期</th>
				<td></td>
			</tr>
			<c:forEach var="lab" items="${allLabToAdmin}">
				<tr class="bottom_line" align="center">
					<td><img src="/attendance/css/images/icon_leaf6.png"
						height="14px" />${lab.lab.labName }(${lab.lab.doorplate})</td>
					<td>${lab.batcher.semesterC }</td>
					<td><input type="button" value="统计工作量"
						onclick="g_course(${lab.id},${lab.batcher.id },${lab.lab.id })"></td>
					<td><input type="button" value="删除"
						onclick="g_delete(${lab.id})"></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div id="dialog">
		<table width="100%">
			<tr>
				<td><select name="batcherID" id="batcher">
						<c:forEach var="batcher" items="${allBatchers }">
							<option value="${batcher.id }">${batcher.semesterC }</option>
						</c:forEach>
				</select></td>
				<td><input type="button" value="选择" onclick="getLabs()">
				</td>
			</tr>
		</table>
	</div>
	<div id="dialogLabs">
		<form action="/attendance/AddNewLabToAdmin.do" method="post"
			id="LabRelation">
			<input type="hidden" name="batcherID" id="batcherID"> <input
				type="hidden" name="adminID" value="${user.id}">
			<table id="content" width="100%">
			</table>
			<input type="submit" value="保存">
		</form>
	</div>
</body>
</html>