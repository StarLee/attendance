<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="/attendance/script/jquery.min.js"></script>
<script type="text/javascript" src="/attendance/script/jquery-ui.min.js"></script>
<script type="text/javascript" src="/attendance/script/jquery.form.js"></script>
<script type="text/javascript" src="/attendance/script/domObject.js"></script>
<script type="text/javascript">
$(function(){
	//$("#detailDialog").dialog({autoOpen:false,width:500,height:200,title:'详细信息'});
	$("#dutyDialog").dialog({autoOpen:false,width:500,height:270,title:'添加工作量'});
	$("#dutyForm").ajaxForm({resetForm:true,dataType:"json",success:updateDuty});
	$("#tabs").tabs();
});

function updateDuty(data)
{
	if(data[0].type==1)
		updateDutyTable(data[0].list,"legalDutyWorkload");
	else
		updateDutyTable(data[0].list,"extralDutyWorkload");
	$("#dutyDialog").dialog("close");
}

function deleteDuty(id)
{
	if(confirm("Attention:此项操作是不可逆的"))
	{
		var options={
				dataType:"json",
				url:"/attendance/DeleteDutyWorkload.do",
				type:"POST",
				data:"id="+id,
				success:function(data)
				{
					if(data[0].type==1)
						updateDutyTable(data[0].list,"legalDutyWorkload");
					else
						updateDutyTable(data[0].list,"extralDutyWorkload");
				}
		}
		$.ajax(options);
	}
}

function updateDutyTable(data,elementID)
{
	var div=document.getElementById(elementID);
	$(div).empty();
	var table=document.createElement("table");
	table.width="100%";
	table.border="1px";
	for(var i=0;i<data.length;i++)
	{
		var tr=table.insertRow(table.rows.length);	
		var legalDutyWorkload=data[i];
		addTd(tr,legalDutyWorkload.id );
		addTd(tr,legalDutyWorkload.quantizationInfo.quantifyO.name)
		addTd(tr,legalDutyWorkload.quantizationInfo.standard+legalDutyWorkload.quantizationInfo.unit);
		addTd(tr,legalDutyWorkload.typeC );
		addTd(tr,legalDutyWorkload.times);
		addTd(tr,legalDutyWorkload.submitTime);
		var input=document.createElement("input");
		input.type="button";
		input.value="删除";
		$(input).bind("click",{id:legalDutyWorkload.id},function(event){
			deleteDuty(event.data.id);
		})
		var td=tr.insertCell(tr.cells.length);
		$(td).append(input);
	}	
	$(div).append(table);
}
function addTd(tr,data)
{
	var td=tr.insertCell(tr.cells.length);
	td.innerHTML=data;
	return td;
}

function openAction(id)
{
	//$("#detailDialog").empty();
	var option={
			dataType:"json",
			url:"/attendance/GetSingleOpenWorkload.do",
			data:"id="+id,
			type: "POST",
			success:function(data)
			{
				var table=document.createElement("table");
				table.border="1px";
				table.width="100%";
				var row1=addTr(table);
				addTd(row1,"开放内容");
				addTd(row1,data[0].openContent);
				var row2=addTr(table);
				addTd(row2,"参与学生");
				var td1=addTd(row2,data[0].attendStudentNum);
				var row3=addTr(table);
				addTd(row3,"开放时间");
				addTd(row3,data[0].openTime);
				var row4=addTr(table);
				addTd(row4,"实验室");
				td2=addTd(row4,data[0].labToAdmin.lab.labName);
				var detailDialog=generateDetailDialg();
				$(detailDialog).append(table);
				
				var del=document.createElement("input");
				del.type="button";
				del.value="删除";
				$(del).bind("click",{id:data[0].id},function(event){
					if(confirm("Attention:此项操作是不可逆的"))
					{
						$.ajax(
								{
									url:"/attendance/DeleteOpenWorkload.do",
									dataType:"json",
									data:{id:event.data.id,userID:userid,batcherID:batcherid},
									success:updateOpen
								});	
						}
					$("#tabs").tabs({ selected: 1 });
					$(detailDialog).dialog("close");
				});
				
				var updateButton=document.createElement("input");
				updateButton.type="button";
				updateButton.value="修改";
				$(updateButton).bind("click",{id:data[0].id,pre:detailDialog},function(event){
					u_open(event.data.id,event.data.pre);
				});
				$(detailDialog).append(del);
				$(detailDialog).append(updateButton);
				$(detailDialog).dialog({width:500,height:200,title:'详细信息'});
			}};
	$.ajax(option);
}

function updateOpen(openWorkloadlist)
{
	var table=document.getElementById("openWorkload");
	$(table).empty();
	var len=openWorkloadlist.length;
	for(var i=0;i<len;i++)
	{
		var openWorkload=openWorkloadlist[i];
		var tr=table.insertRow(table.rows.length);
		addTd(tr,openWorkload.id);
		addTd(tr,openWorkload.quantization.quantifyO.name);
		addTd(tr,openWorkload.labToAdmin.lab.labName+openWorkload.labToAdmin.lab.doorplate);
		addTd(tr,openWorkload.quantization.standard+openWorkload.quantization.unit);
		addTd(tr,openWorkload.attendStudentNum);
		addTd(tr,openWorkload.openTime);
		var td6=tr.insertCell(tr.cells.length);
		var deleteButton=document.createElement("input");
		deleteButton.type="button";
		deleteButton.value="操作";
		$(deleteButton).bind("click",{id:openWorkload.id},function(event){
			openAction(event.data.id);
		});
		td6.appendChild(deleteButton);
		
	}
	$("#labOpenWorkload").dialog("close");
	$( "#tabs" ).tabs({ selected: 1 });
}





function borrowAction(id)
{
	//$("#detailDialog").empty();
	var options={
			url:"/attendance/GetSingleBorrowWorkload.do",
			dataType:"json",
			data:"id="+id,
			type: "POST",
			success:function(data)
			{
				var table=createTable(4,2);
				table.border="1px";
				table.width="100%";
				table.rows[0].cells[0].innerHTML="设备名称";
				table.rows[0].cells[1].innerHTML=data[0].equipmentName;
				table.rows[1].cells[0].innerHTML="借用人";
				table.rows[1].cells[1].innerHTML=data[0].borrowMan;
				table.rows[2].cells[0].innerHTML="借出时间";
				table.rows[2].cells[1].innerHTML=data[0].borrowTime;
				table.rows[3].cells[0].innerHTML="量化系数";
				table.rows[3].cells[1].innerHTML=data[0].quantizationInfo.standard+data[0].quantizationInfo.unit;
				var detailDialog=generateDetailDialg();
				$(detailDialog).append(table);
				var del=document.createElement("input");
				del.type="button";
				del.value="删除";
				$(del).bind("click",{id:data[0].id},function(event){
					if(confirm("Attention:此项操作是不可逆的"))
					{
					$.ajax(
							{
								url:"/attendance/DeleteBorrowWorkload.do",
								dataType:"json",
								data:{id:event.data.id,userID:userid,batcherID:batcherid},
								success:updateBorrow
							});	
					}
					$("#tabs").tabs({ selected: 2 });
					$(detailDialog).dialog("close");
				});
				var updateButton=document.createElement("input");
				updateButton.type="button";
				updateButton.value="修改";
				$(updateButton).bind("click",{id:data[0].id,pre:detailDialog},function(event){
					u_borrow(event.data.id,event.data.pre);
				});
				$(detailDialog).append(del);
				$(detailDialog).append(updateButton);
				$(detailDialog).dialog({width:500,height:200,title:'详细信息'});
				//$("#detailDialog").append(table);
				//$("#detailDialog").dialog("open");
			}
	};
	$.ajax(options);
}

function updateBorrow(borrowWorkloadlist)
{
	var table=document.getElementById("borrowWorkload");
	$(table).empty();
	var len=borrowWorkloadlist.length;
	for(var i=0;i<len;i++)
	{
		var borrowWorkload=borrowWorkloadlist[i];
		var tr=table.insertRow(table.rows.length);
		addTd(tr,borrowWorkload.id);
		addTd(tr,borrowWorkload.borrowMan);
		addTd(tr,borrowWorkload.equipmentName);
		addTd(tr,borrowWorkload.quantizationInfo.quantifyO.name );
		addTd(tr,borrowWorkload.quantizationInfo.standard+borrowWorkload.quantizationInfo.unit);
		var td6=tr.insertCell(tr.cells.length);
		var deleteButton=document.createElement("input");
		deleteButton.type="button";
		deleteButton.value="操作";
		$(deleteButton).bind("click",{id:borrowWorkload.id},function(event){
			borrowAction(event.data.id);
		});
		td6.appendChild(deleteButton);
	}
	$("#equipBorrowWorkload").dialog("close");
	$( "#tabs" ).tabs({ selected: 2 });
}

function generateDetailDialg()
{
	var div=document.createElement("div");
	$(div).attr("id","detailDialog");
	return div;
}
var userid=${currentUser.id};
var batcherid=${batcher.id };
function regularDelete(id)
{
	if(confirm("Attention:此项操作是不可逆的"))
	{
			$.ajax({
				dataType:"json",
				url:"/attendance/DeleteRegularWorkload.do",
				data:{id:id,userID:userid,batcherID:batcherid},
				type: "POST",
				success:updateRegular
			});
	}
}
function updateRegular(datas)
{
		$("#regWorkload").empty();
		for(var i=0;i<datas.length;i++)
		{
			var tr=document.createElement("tr");
			var td1=tr.insertCell(tr.cells.length);
			td1.innerHTML=datas[i].id;
			var td2=tr.insertCell(tr.cells.length);
			td2.innerHTML=datas[i].labToAdmin.lab.labName+"("+datas[i].labToAdmin.lab.doorplate+")";
			var td3=tr.insertCell(tr.cells.length);
			td3.innerHTML=datas[i].quantizationInfo.quantifyO.name;
			var td4=tr.insertCell(tr.cells.length);
			td4.innerHTML=datas[i].quantizationInfo.standard+datas[i].quantizationInfo.unit ;
			var td5=tr.insertCell(tr.cells.length);
			td5.innerHTML=datas[i].submitTime;
			var td6=tr.insertCell(tr.cells.length);
			var deleteButton=document.createElement("input");
			deleteButton.type="button";
			deleteButton.value="删除";
			$(deleteButton).bind("click",{id:datas[i].id},function(event){
				regularDelete(event.data.id);
			});
			td6.appendChild(deleteButton);
			var td7=tr.insertCell(tr.cells.length);
			var updateButton=document.createElement("input");
			updateButton.type="button";
			updateButton.value="修改";
			$(updateButton).bind("click",{id:datas[i].id},function(event){
				u_regular(event.data.id);
			});
			td7.appendChild(updateButton);
			
			$("#regWorkload").append(tr);
			//$("#dialog").dialog("close");
		}
}

function fixAction(id)
{
	//$("#detailDialog").empty();
	var options={
			url:"/attendance/GetSingleFixBorrowWorkload.do",
			dataType:"json",
			data:"id="+id,
			type: "POST",
			success:function(data)
			{
				var table=createTable(4,2);
				table.border="1px";
				table.width="100%";
				table.rows[0].cells[0].innerHTML="故障描述";
				table.rows[0].cells[1].innerHTML=data[0].breakdownDesc;
				table.rows[1].cells[0].innerHTML="维修类型";
				table.rows[1].cells[1].innerHTML=data[0].fixTypeC;
				table.rows[2].cells[0].innerHTML="维修时间";
				table.rows[2].cells[1].innerHTML=data[0].fixTime;
				table.rows[3].cells[0].innerHTML="量化系数";
				table.rows[3].cells[1].innerHTML=data[0].quantizationInfo.standard+data[0].quantizationInfo.unit;
				var detailDialog=generateDetailDialg();
				var del=document.createElement("input");
				del.type="button";
				del.value="删除";
				$(del).bind("click",{id:data[0].id},function(event){
					if(confirm("Attention:此项操作是不可逆的"))
					{
						$.ajax(
								{
									url:"/attendance/DeleteFixWorkload.do",
									dataType:"json",
									data:{id:event.data.id,userID:userid,batcherID:batcherid},
									success:updateFix
								});	
					}
					$("#tabs").tabs({ selected: 3 });
					$(detailDialog).dialog("close");
				});
				var updateButton=document.createElement("input");
				updateButton.type="button";
				updateButton.value="修改";
				$(updateButton).bind("click",{id:data[0].id,pre:detailDialog},function(event){
					u_fix(event.data.id,event.data.pre);
				});
				$(detailDialog).append(table);
				$(detailDialog).append(del);
				$(detailDialog).append(updateButton);
				$(detailDialog).dialog({width:500,height:200,title:'详细信息'});
				//$("#detailDialog").append(table);
				//$("#detailDialog").dialog("open");
			}
	};
	$.ajax(options);
}
function updateFix(fixWorkloadList)
{
	var table=document.getElementById("fixWorkload");
	$(table).empty();
	var len=fixWorkloadList.length;
	for(var i=0;i<len;i++)
	{
		var fixWorkload=fixWorkloadList[i];
		var tr=table.insertRow(table.rows.length);
		addTd(tr,fixWorkload.id);
		addTd(tr,fixWorkload.fixTypeC);
		addTd(tr,fixWorkload.fixTime);
		addTd(tr,fixWorkload.quantizationInfo.quantifyO.name);
		addTd(tr,fixWorkload.quantizationInfo.standard +fixWorkload.quantizationInfo.unit);
		var td6=tr.insertCell(tr.cells.length);
		var deleteButton=document.createElement("input");
		deleteButton.type="button";
		deleteButton.value="操作";
		$(deleteButton).bind("click",{id:fixWorkload.id},function(event){
			fixAction(event.data.id);
		});
		td6.appendChild(deleteButton);
	}
	$("#equipFixWorkload").dialog("close");
	$( "#tabs" ).tabs({ selected: 3 });
}




function showDutyInput()
{
	$("#dutyDialog").dialog("open");
}
function createTable(rows,cols)
{
	var table=document.createElement("table");
	for(var i=0;i<rows;i++)
	{
		var row=table.insertRow(table.rows.length);	
		for(var j=0;j<cols;j++)
		{
			row.insertCell(row.cells.length);	
		}
	}
	return table;
}

function addTr(table)
{
	return table.insertRow(table.rows.length);
}
function loadTotal(userID,batcherID)
{
	 var div=document.createElement("div");
	 $(div).html("正在统计时数，请稍候……");
	 var options={
			   url:"/attendance/UserTotalWorkload.do",
			   type:"post",
			   dataType:"json",
			   data:"userID="+userID+"&batcherID="+batcherID,
			   success:function(data) {updateTotal(data,div)}
			   };
	 $.ajax(options);
}
function updateTotal(data,div)
{
	var datas=data[0];
	var table=document.createElement("table");
	table.width="100%";
	table.border="1px";
	var title=["常规工作量","开放工作量","设备借用工作量","设备维护工作量","坐班工作量","加班工作量","课程工作量","工作量总和（小时）"];
	var dataContent=[datas.regular,datas.open,datas.borrow,datas.fix,datas.legal,datas.extra,datas.course,datas.all];
	tempTable(table, title);
	tempTable(table, dataContent);
	$(div).html(table);
	$("#totalTab").html(div);
	$("#tabs").tabs("select",6);
}

function tempTable(table,data)
{
	var row=table.insertRow(table.rows.length);
	for(var i=0;i<data.length;i++)
	{
		row.insertCell(row.cells.length).innerHTML=data[i];
	}
}

function pop_Dialog(datas,workloadid,url,func)
{
	var div=document.createElement("div");
	if(datas.length==0)
	{
		$(div).html("批次下没有此项系数");
	}
	else
		{
			var table=document.createElement("table");
			$(table).attr({width:"100%",border:"1px solid"});
			var n=0;
			var tr=null;
			for(n=0;n<datas.length;n++)
			{
				if(n%3==0)
					tr=table.insertRow(table.rows.length);
				var td=tr.insertCell(tr.cells.length);
				var input=document.createElement("input");
				$(input).attr("type","checkbox");
				var param={quantizationID:datas[n].id,dialog:div,workloadID:workloadid}
				$(input).bind("click",param,function(eve){
					var params={batcherID:batcherid,id:eve.data.workloadID,userID:userid,quantizationid:eve.data.quantizationID};
					u_Quantization(url,params,func,eve.data.dialog);
				});
				$(td).append(input);
				$(td).append(datas[n].quantifyO.name+"("+datas[n].standard+":"+datas[n].unit+")");
			}
			var lastr=table.rows[table.rows.length-1];
			while(lastr.cells.length<3)
			{
				tr.insertCell(tr.cells.length);
			}
			$(div).html(table);
		}
	$(div).dialog({
		title:"please select item",
		width:750,
		height:400
	});
}

//function u_Quantization(eve)
function u_Quantization(url,params,succFuc,div)
{
	
	var options={
			 //url:"/attendance/UpdateRegularWorkload.do",
			 url:url,
			 type:"post",
			 dataType:"json",
			 //data:{batcherID:batcherid,id:eve.data.workloadID,userID:userid,quantizationid:eve.data.quantizationID},
			 data:params,
			 success:succFuc
	};
	$.ajax(options);
	$(div).dialog("close");
}

function g_Quantization(workloadid,type,url,func)
{
	var options={
			 url:"/attendance/GetQuantizationBatcher.do",
			 type:"post",
			 dataType:"json",
			 data:{batcherID:batcherid,type:type},
			 success:function(data){pop_Dialog(data,workloadid,url,func);}
	};
	$.ajax(options);	
}

function u_regular(workloadid)
{
	var url="/attendance/UpdateRegularWorkload.do";
	var func=updateRegular;
	g_Quantization(workloadid,"1",url,func);
}

function u_open(workloadid,pre)
{
	
	var url="/attendance/UpdateOpenWorkload.do";
	var func=updateOpen;
	g_Quantization(workloadid,"4",url,func);
	$(pre).dialog("close");
}
function u_borrow(workloadid,pre)
{
	var url="/attendance/UpdateBorrowWorkload.do";
	var func=updateBorrow;
	g_Quantization(workloadid,"6",url,func);
	$(pre).dialog("close");
}
function u_fix(workloadid,pre)
{
	var url="/attendance/UpdateFixWorkload.do";
	var func=updateFix;
	g_Quantization(workloadid,"5",url,func);
	$(pre).dialog("close");
}
</script>
<style type="text/css">
#dialog {
	font-size: 14px;
}

#dialog table td {
	border: 1px solid #cccccc;
}

#dialog table {
	width: 100%;
}

hr {
	margin-bottom: 5px;
	margin-bottom: 5px;
}

#tabs {
	font-size: 12px;
}

#detailDialog {
	font-size: 12px;
}

#dutyDialog {
	font-size: 14px;
}

#dutyDialog input,select {
	margin-bottom: 3px;
	margin-top: 3px;
}
</style>
<title>实验室</title>
</head>
<body>
	<div style="height: 35px; padding: 10px;">${batcher.semesterC },
		目前状态：${batcher.statusC }, 用户：${currentUser.userName }</div>

	<hr>
	<div id="tabs">
		<ul>
			<li><a href="#regularTab"><span>常规工作量</span> </a></li>
			<li><a href="#openTab"><span>实验室开放工作量</span> </a></li>
			<li><a href="#borrowTab"><span>设备借用工作量</span> </a></li>
			<li><a href="#fixTab"><span>设备维护工作量</span> </a></li>
			<li><a href="#dutyTab"><span>坐班/加班工作量</span> </a></li>
			<li><a href="#courseTab"><span>实验室课程工作量</span> </a></li>
			<li><a href="#totalTab"><span
					onclick="loadTotal(${currentUser.id},${batcher.id})">工作量统计</span> </a>
			</li>
		</ul>
		<div id="regularTab">
			常规工作量
			<table width="100%" border="1px" id="regWorkload">
				<c:forEach items="${currentUser.regularWorkloadlist }"
					var="regularWorkload">
					<tr>
						<td>${regularWorkload.id }</td>
						<td>${regularWorkload.labToAdmin.lab.labName
							}(${regularWorkload.labToAdmin.lab.doorplate })</td>
						<td>${regularWorkload.quantizationInfo.quantifyO.name}</td>
						<td>${regularWorkload.quantizationInfo.standard
							}${regularWorkload.quantizationInfo.unit }</td>
						<td>${regularWorkload.submitTime }</td>
						<td><input type="button" value="删除"
							onclick="regularDelete(${regularWorkload.id },${currentUser.id })"></td>
						<td><input type="button" value="修改"
							onclick="u_regular(${regularWorkload.id })"></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div id="openTab">
			实验室开放工作量
			<table width="100%" border="1px" id="openWorkload">
				<c:forEach items="${currentUser.openWorkloadlist }"
					var="openWorkload">
					<tr>
						<td>${openWorkload.id }</td>
						<td>${openWorkload.quantization.quantifyO.name}</td>
						<td>${openWorkload.labToAdmin.lab.labName
							}(${openWorkload.labToAdmin.lab.doorplate })</td>
						<td>${openWorkload.quantization.standard
							}${openWorkload.quantization.unit }</td>
						<td>${openWorkload.attendStudentNum }</td>
						<td>${openWorkload.openTime }</td>
						<td><input type="button" value="操作"
							onclick="openAction(${openWorkload.id })"></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div id="borrowTab">
			设备借用工作量
			<table width="100%" border="1px" id="borrowWorkload">
				<c:forEach items="${currentUser.borrowWorkloadlist }"
					var="borrowWorkload">
					<tr>
						<td>${borrowWorkload.id }</td>
						<td>${borrowWorkload.borrowMan }</td>
						<td>${borrowWorkload.equipmentName }</td>
						<td>${borrowWorkload.quantizationInfo.quantifyO.name }</td>
						<td>${borrowWorkload.quantizationInfo.standard
							}${borrowWorkload.quantizationInfo.unit }</td>
						<td><input type="button" value="操作"
							onclick="borrowAction(${borrowWorkload.id })"></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div id="fixTab">
			设备修理
			<table width="100%" border="1px" id="fixWorkload">
				<c:forEach items="${currentUser.fixWorkloadlist }" var="fixWorkload">
					<tr>
						<td>${fixWorkload.id }</td>
						<td>${fixWorkload.fixTypeC }</td>
						<td>${fixWorkload.fixTime }</td>
						<td>${fixWorkload.quantizationInfo.quantifyO.name }</td>
						<td>${fixWorkload.quantizationInfo.standard
							}${fixWorkload.quantizationInfo.unit }</td>
						<td><input type="button" value="操作"
							onclick="fixAction(${fixWorkload.id })"></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div id="dutyTab">
			<input type="button" onclick="showDutyInput()" value="坐班/加班">
			<div>坐班</div>
			<div id="legalDutyWorkload">
				<table width="100%" border="1px">
					<c:forEach items="${currentUser.legalDutyWorkloadlist }"
						var="legalDutyWorkload">
						<tr>
							<td>${legalDutyWorkload.id }</td>
							<td>${legalDutyWorkload.quantizationInfo.quantifyO.name}</td>
							<td>${legalDutyWorkload.quantizationInfo.standard
								}${legalDutyWorkload.quantizationInfo.unit }</td>
							<td>${legalDutyWorkload.typeC }</td>
							<td>${legalDutyWorkload.times }</td>
							<td>${legalDutyWorkload.submitTime }</td>
							<td><input type="button" value="删除"
								onclick="deleteDuty(${legalDutyWorkload.id })"></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div>加班</div>
			<div id="extralDutyWorkload">
				<table width="100%" border="1px">
					<c:forEach items="${currentUser.extralDutyWorkloadlist }"
						var="extralDutyWorkload">
						<tr>
							<td>${extralDutyWorkload.id }</td>
							<td>${extralDutyWorkload.quantizationInfo.quantifyO.name}</td>
							<td>${extralDutyWorkload.quantizationInfo.standard
								}${extralDutyWorkload.quantizationInfo.unit }</td>
							<td>${extralDutyWorkload.typeC }</td>
							<td>${extralDutyWorkload.times }</td>
							<td>${extralDutyWorkload.submitTime }</td>
							<td><input type="button" value="删除"
								onclick="deleteDuty(${extralDutyWorkload.id })"></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<div id="courseTab">
			实验室课程工作量
			<table width="100%" border="1px" id="regWorkload">
				<c:forEach items="${currentUser.courseWorkloadlist }"
					var="courseWorkload">
					<tr>
						<td>${courseWorkload.id }</td>
						<td>${courseWorkload.labToAdmin.lab.labName
							}(${courseWorkload.labToAdmin.lab.doorplate })</td>
						<td>${courseWorkload.quantizationInfo.quantifyO.name}</td>
						<td>${courseWorkload.quantizationInfo.standard
							}${courseWorkload.quantizationInfo.unit }</td>
						<td>${courseWorkload.course.studentClass}</td>
						<td>${courseWorkload.submitTime }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div id="totalTab">工作量统计</div>
	</div>

	<div id="dutyDialog">
		<form action="/attendance/AddDutyWorkload.do" method="post"
			id="dutyForm">
			<input type="hidden" name="administrator" value="${currentUser.id }">
			<input type="hidden" name="batcherID" value="${batcher.id }">
			<table width="100%" cellpadding="5" cellspacing="5">
				<tr>
					<td>次数</td>
					<td><input type="text" name="times"></td>
				</tr>
				<tr>
					<td>描述</td>
					<td><textarea rows="5" cols="30" name="description"></textarea>
					</td>
				</tr>
				<tr>
					<td>类型</td>
					<td><select name="type">
							<option value="1">坐班</option>
							<option value="2">加班</option>
					</select></td>
				</tr>
				<tr>
					<td>系数</td>
					<td><c:choose>
							<c:when test="${empty quantizationList}">批次下没有坐加班系数，请添加</c:when>
							<c:otherwise>
								<select name="quantizationID">
									<c:forEach items="${quantizationList }" var="quantization">
										<option value="${quantization.id }">
											${quantization.quantifyO.name }(${quantization.standard
											}${quantization.unit })</option>
									</c:forEach>
								</select>
							</c:otherwise>
						</c:choose></td>
				</tr>
			</table>
			<div>
				<input type="submit" value="保存">
			</div>
		</form>
	</div>
</body>
</html>