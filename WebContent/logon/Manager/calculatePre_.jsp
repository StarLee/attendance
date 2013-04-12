<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link style="text/css" rel="stylesheet" href="/attendance/css/content.css">
<title>审批工作量</title>
<script type="text/javascript" src="/attendance/script/jquery.min.js"></script>
<script type="text/javascript" src="/attendance/script/jquery-ui.min.js"></script>
<script type="text/javascript" src="/attendance/script/jquery.form.js"></script>
<script type="text/javascript" src="/attendance/script/domObject.js"></script>
<script type="text/javascript">
	
	function Sworkload(id)
	{
		var option={name:"workload",action:"/attendance/Workload.do",fieldsHidden:{batcherID:id}};
		var form=new FORM(option); 
		document.body.appendChild(form);
		form.submit();
	}
	function changeStatus(id,status)
	{
		var options={
				dataType:"json",
				type:"post",
				data:"id="+id,
				success:updateShow
		};
		if(status=='0')
		{
			options.url="/attendance/UpdateBatcherStop.do";
			$.ajax(options);
		}
		else if(status=='1')
		{
			options.url="/attendance/UpdateBatcherStart.do";
			$.ajax(options);
		}
				
	}
	function updateShow(data)
	{
		$("#batcherShow").empty();
		var table=document.createElement("table");
		table.width="100%";
		table.border="1px";
		for(var i=0;i<data.length;i++)
		{
			var tr=table.insertRow(table.rows.length);
			var td=tr.insertCell(tr.cells.length);
			td.innerHTML=data[i].semesterC;
			var status=document.createElement("input");
			status.type="button";
			status.value=data[i].statusC;
			$(status).bind("click",{id:data[i].id,status:data[i].status},function(event){
				changeStatus(event.data.id,event.data.status);
			});
			var oper=document.createElement("input");
			oper.type="button";
			oper.value="操作";
			$(oper).bind("click",{id:data[i].id,status:data[i].status},function(event){
				getUser(event.data.id);
			});
			var list=document.createElement("input");
			list.type="button";
			list.value="工作量列表";
			$(list).bind("click",{id:data[i].id,status:data[i].status},function(event){
				getAllUserWorkloadOutLine(event.data.id);
			});
			tr.insertCell(tr.cells.length).appendChild(status);
			tr.insertCell(tr.cells.length).appendChild(oper);
			tr.insertCell(tr.cells.length).appendChild(list);
		}
		$("#batcherShow").append(table);
	}
	function getUser(id)
	{
		var divDialog=document.createElement("div");
		document.body.appendChild(divDialog);
		$(divDialog).dialog({autoOpen:false,width:400,height:300,title:'请选择用户'});
		var options={
				url:"/attendance/MAllUser.do",
				dataType:"json",
				type:"post",
				success:function(data)
				{
					var form=document.createElement("form");
					var select=document.createElement("table");
					form.method="post";
					form.action="/attendance/MWorkload.do";
					for(var i=0;i<data.length;i++)
					{
						var options=select.insertRow(select.rows.length);
						var td=options.insertCell(options.cells.length);
						var radio=document.createElement("input");
						$(radio).attr("name","userID");
						$(radio).attr("type","radio");
						$(radio).attr("value",data[i].id);
						$(radio).bind("click",{fo:form},function(eve){$(eve.data.fo).submit();});
						$(td).append(radio);
						$(td).append(data[i].name+"("+data[i].userName+")");
						
					}
					var hidden=document.createElement("input");
					hidden.type="hidden";
					hidden.value=id;
					hidden.name="batcherID";
					$(form).append(hidden);
					$(form).append(select);
					$(divDialog).append(form);
					$(divDialog).dialog("open");
				}
		};
		$.ajax(options);
	}
	function getAllUserWorkloadOutLine(id)
	{
		var option={name:"workload",action:"/attendance/SWorkloadSchema.do",fieldsHidden:{batcherID:id}};
		var form=new FORM(option); 
		document.body.appendChild(form);
		form.submit();
	}
</script>

<style type="text/css">

</style>
</head>
<body>
	<div id="batcherShow">
	<table width="700px" class="table_margin">
		<tr></tr>
		<c:forEach var="items" items="${list }">
			<tr class="bottom_line"  align="center">
				<td width="210px">
					<img src="/attendance/css/images/icon_leaf1.png" height="14px">
					${items.semesterC }
				</td>
				<td width="140px"><input type="button" value="${items.statusC }"
					onclick="changeStatus(${items.id},${items.status })" class="button_green"></td>
				<td width="140px"><input type="button" value="操作"
					onclick="getUser(${items.id})" class="button_green"></td>
				<td><input type="button" value="工作量列表"
					onclick="getAllUserWorkloadOutLine(${items.id})" class="submit"></td>	
			</tr>
		</c:forEach>
	</table>
	</div>
</body>
</html>