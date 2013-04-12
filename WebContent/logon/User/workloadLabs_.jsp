<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link style="text/css" rel="stylesheet"
	href="/attendance/css/content.css">
<script type="text/javascript" src="/attendance/script/jquery.min.js"></script>
<script type="text/javascript" src="/attendance/script/jquery-ui.min.js"></script>
<script type="text/javascript" src="/attendance/script/jquery.form.js"></script>
<script type="text/javascript" src="/attendance/script/domObject.js"></script>
<script type="text/javascript">
$(function(){
	$("#dialog").dialog({autoOpen:false,width:600,height:400,title:'请选择系数'});
	$("#dialogItems").dialog({autoOpen:false,width:600,height:400,title:'请选择项目'});
	$("#equipBorrowWorkload").dialog({autoOpen:false,width:420,height:200,title:'填写借用信息'});
	$("#equipFixWorkload").dialog({autoOpen:false,width:500,height:300,title:'填写设备维护信息'});
	$("#labOpenWorkload").dialog({autoOpen:false,width:500,height:300,title:'填写开放信息'});
	$("#detailDialog").dialog({autoOpen:false,width:500,height:300,title:'详细信息，请操作'})
	$("form[name='equipBorrowWorkloadF']").ajaxForm({dataType:"json",resetForm:true,success:updateBorrow});
	$("form[name='equipFixWorkloadF']").ajaxForm({dataType:"json",resetForm:true,success:updateFix});
	$("form[name='openWorkloadF']").ajaxForm({dataType:"json",resetForm:true,success:updateOpen});
	$("#tabs").tabs();
});

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
			$("#regWorkload").append(tr);
			$("#dialog").dialog("close");
		}
}
function addTd(tr,data)
{
	var td=tr.insertCell(tr.cells.length);
	td.innerHTML=data;
	return td;
}

function showItems()
{
	$("#dialogItems").dialog("open");	
}
function doAjax(url,data,relateID)
{
	$.ajax(
			{
				dataType:"json",
				type:"post",
				url:url,
				data:data,
				success:function(datas)
				{
					$("#dialog").empty();
					var form=document.createElement("form");
					form.action="/attendance/AddNewRegularWorkload.do";
					form.method="post";
					var button=document.createElement("input");
					button.type="button";
					button.value="确定";
					var hiddenValue=document.createElement("input");
					hiddenValue.type="hidden";
					hiddenValue.name="labToAdminID";
					hiddenValue.value=relateID;
					form.appendChild(hiddenValue);
					$(button).bind("click",{myform:form},function(event)
					{
						$(event.data.myform).submit(); 
					});
					form.appendChild(button);
					form.appendChild(document.createElement("hr"));
					var table=document.createElement("table");
					var len=datas.length;
					var row=undefined;
					for(var i=0;i<len;i++)
					{
						item=datas[i];
						if(i%4==0)
						{
							row=table.insertRow(table.rows.length);
						}
						var cell=row.insertCell(0);
						var input=document.createElement("input");
						input.type='checkbox';
						input.name='quantizationID';
						input.value=item.id;
						cell.appendChild(input);
						cell.appendChild(document.createTextNode(item.quantifyO.name+":"+item.standard+item.unit));
						form.appendChild(table);
						$("#dialog").append(form);
						$("#dialog").dialog("open");
					}
					var options={
							clearForm:true,
							dataType:'json',
							success:updateRegular
								};
					$(form).submit(function() { 
				        $(this).ajaxSubmit(options); 
				        return false; 
				    }); 
				}
			});
}

function ajaxData(labID,relateID,type)
{
	var url="/attendance/GetQuantizationBatcher.do";
	var data="batcherID="+${batcher.id}+"&labID="+labID+"&type="+type;
	doAjax(url,data,relateID);
	$("#dialogItems").dialog("close");
	$( "#tabs" ).tabs({ selected: 0 });
}

function doExtraAjax(url,data,target)
{
	$.ajax(
			{
				dataType:"json",
				type:"post",
				url:url,
				data:data,
				type: "POST",
				success:function(datas)
				{
					$(target).empty();
					var len=datas.length;
					var select=document.createElement("select");
					for(var i=0;i<len;i++)
					{
						item=datas[i];
						select.name="quantizationID";
						var option=document.createElement("option");
						option.value=item.id;
						option.innerHTML=item.quantifyO.name+":"+item.standard+item.unit;
						$(select).append(option);
					}
					$(target).append(select);
				}});
			
}

function showBorrow()
{
	$("#equipBorrowWorkload").dialog("open");
	var url="/attendance/GetQuantizationBatcher.do";
	var data="batcherID="+${batcher.id}+"&type=6";
	doExtraAjax(url,data,document.getElementById("selectQuantizationEB"));
	$("#dialogItems").dialog("close");
}
function showFix()
{
	$("#equipFixWorkload").dialog("open");
	var url="/attendance/GetQuantizationBatcher.do";
	var data="batcherID="+${batcher.id}+"&type=5";
	doExtraAjax(url,data,document.getElementById("selectQuantizationEF"));
	$("#dialogItems").dialog("close");
}
function showOpen()
{
	$("#labOpenWorkload").dialog("open");
	var url="/attendance/GetQuantizationBatcher.do";
	var data="batcherID="+${batcher.id}+"&type=4";
	doExtraAjax(url,data,document.getElementById("selectQuantizationLO"));
	$("#dialogItems").dialog("close");
}
function regularDelete(id)
{
	$.ajax({
		dataType:"json",
		url:"/attendance/DeleteRegularWorkload.do",
		data:"id="+id,
		type: "POST",
		success:updateRegular
	});	
}
function openAction(id)
{
	$("#detailDialog").empty();
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
				$("#detailDialog").append(table);
				var modify=document.createElement("input");
				modify.type="button";
				modify.value="修改";
				$(modify).bind("click",{data:data},function(event){
					var input1=document.createElement("input");
					input1.type="text";
					input1.value=td1.innerHTML;
					$(td1).empty();
					td1.appendChild(input1);
					
					var input2=document.createElement("input");
					input2.type="text";
					input2.value=td2.innerHTML;
					$(td2).empty();
					td2.appendChild(input2);
					this.value="保存";
				});
				$("#detailDialog").append(modify);
				var del=document.createElement("input");
				del.type="button";
				del.value="删除";
				$(del).bind("click",{id:data[0].id},function(event){
					$.ajax(
							{
								url:"/attendance/DeleteOpenWorkload.do",
								dataType:"json",
								data:"id="+event.data.id,
								success:updateOpen
							});	
					$("#tabs").tabs({ selected: 1 });
					$("#detailDialog").dialog("close");
				});
				$("#detailDialog").append(del);
				$("#detailDialog").dialog("open");
			}};
	$.ajax(option);
}

function borrowAction(id)
{
	$("#detailDialog").empty();
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
				var del=document.createElement("input");
				del.type="button";
				del.value="删除";
				$(del).bind("click",{id:data[0].id},function(event){
					$.ajax(
							{
								url:"/attendance/DeleteBorrowWorkload.do",
								dataType:"json",
								data:"id="+event.data.id,
								success:updateBorrow
							});	
					$("#tabs").tabs({ selected: 2 });
					$("#detailDialog").dialog("close");
				});
				$("#detailDialog").append(del);
				$("#detailDialog").append(table);
				$("#detailDialog").dialog("open");
			}
	};
	$.ajax(options);
}
function fixAction(id)
{
	$("#detailDialog").empty();
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
				var del=document.createElement("input");
				del.type="button";
				del.value="删除";
				$(del).bind("click",{id:data[0].id},function(event){
					$.ajax(
							{
								url:"/attendance/DeleteFixWorkload.do",
								dataType:"json",
								data:"id="+event.data.id,
								success:updateFix
							});	
					$("#tabs").tabs({ selected: 3 });
					$("#detailDialog").dialog("close");
				});
				$("#detailDialog").append(del);
				$("#detailDialog").append(table);
				$("#detailDialog").dialog("open");
			}
	};
	$.ajax(options);
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
	$("#allWorkload").empty();
	 var options={
			   url:"/attendance/UserTotalWorkload.do",
			   type:"post",
			   dataType:"json",
			   data:"userID="+userID+"&batcherID="+batcherID,
			   success:updateTotal
			   };
	 $.ajax(options);
}
function updateTotal(data)
{
	var datas=data[0];
	var table=document.createElement("table");
	table.width="100%";
	table.border="1px";
	var title=["常规工作量","开放工作量","设备借用工作量","设备维护工作量","坐班工作量","加班工作量","实验室课程工作量","工作量总和（小时）"];
	var dataContent=[datas.regular,datas.open,datas.borrow,datas.fix,datas.legal,datas.extra,datas.course,datas.all];
	tempTable(table, title);
	tempTable(table, dataContent);
	$("#allWorkload").append(table);
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
function showOthers(id)
{
	var div=document.createElement("div");
	$(div).dialog({autoOpen:false,width:900,height:400});
	var options={
			url:"/attendance/WorkloadSchema.do",
			type:"post",
			dataType:"json",
			data:"batcherID="+id,
			success:function(data)
			{
				
				var table=document.createElement("table");
				table.width="100%";
				table.border="1px";
				var title=["用户名","常规工作量","开放工作量","设备借用工作量","设备维护工作量","坐班工作量","加班工作量","实验室课程工作量","工作量总和（小时）"];
				tempTable(table, title);
				for(var i=0;i<data.length;i++)
				{
					var datas=data[i];
					var dataContent=[datas.user,datas.regular,datas.open,datas.borrow,datas.fix,datas.legal,datas.extra,datas.course,datas.all];
					tempTable(table, dataContent);
				}
				$(div).append(table);
				$(div).dialog("open");
			}
	};
	$.ajax(options);
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
</style>
<title>实验室</title>
</head>
<body>
	<div style="height: 35px; padding: 15px">${batcher.semesterC
		},目前状态：${batcher.statusC }</div>
	<div style="padding-bottom: 10px; padding-left: 30px;">
		<c:if test="${batcher.status eq 0 }">
			<input type="button" value="添加工作量" onclick="showItems()"
				class="submit" />
		</c:if>

	</div>

	<div id="tabs">
		<ul>
			<li><a href="#regularTab"><span>常规工作量</span> </a></li>
			<li><a href="#openTab"><span>实验室开放工作量</span> </a></li>
			<li><a href="#borrowTab"><span>设备借用工作量</span> </a></li>
			<li><a href="#fixTab"><span>设备维护工作量</span> </a></li>
			<li><a href="#dutyTab"><span>坐班/加班工作量</span> </a></li>
			<li><a href="#courseTab"><span>实验室课程工作量</span> </a></li>
			<li><a href="#totalTab"><span
					onclick="loadTotal(${user.user.id},${batcher.id})">工作量统计</span> </a></li>
		</ul>
		<div id="regularTab">
			常规工作量
			<table width="100%" border="1px" id="regWorkload">
				<c:forEach items="${user.user.regularWorkloadlist }"
					var="regularWorkload">
					<tr>
						<td>${regularWorkload.id }</td>
						<td>${regularWorkload.labToAdmin.lab.labName
							}(${regularWorkload.labToAdmin.lab.doorplate })</td>
						<td>${regularWorkload.quantizationInfo.quantifyO.name}</td>
						<td>${regularWorkload.quantizationInfo.standard
							}${regularWorkload.quantizationInfo.unit }</td>
						<td>${regularWorkload.submitTime }</td>

						<c:if test="${batcher.status eq 0 }">
							<td><input type="button" value="删除"
								onclick="regularDelete(${regularWorkload.id })"></td>
						</c:if>


					</tr>
				</c:forEach>
			</table>
		</div>
		<div id="openTab">
			实验室开放工作量
			<table width="100%" border="1px" id="openWorkload">
				<c:forEach items="${user.user.openWorkloadlist }" var="openWorkload">
					<tr>
						<td>${openWorkload.id }</td>
						<td>${openWorkload.quantization.quantifyO.name}</td>
						<td>${openWorkload.labToAdmin.lab.labName
							}(${openWorkload.labToAdmin.lab.doorplate })</td>
						<td>${openWorkload.quantization.standard
							}${openWorkload.quantization.unit }</td>
						<td>${openWorkload.attendStudentNum }</td>
						<td>${openWorkload.openTime }</td>
						<c:if test="${batcher.status eq 0 }">
							<td><input type="button" value="操作"
								onclick="openAction(${openWorkload.id })"></td>
						</c:if>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div id="borrowTab">
			设备借用工作量
			<table width="100%" border="1px" id="borrowWorkload">
				<c:forEach items="${user.user.borrowWorkloadlist }"
					var="borrowWorkload">
					<tr>
						<td>${borrowWorkload.id }</td>
						<td>${borrowWorkload.borrowMan }</td>
						<td>${borrowWorkload.equipmentName }</td>
						<td>${borrowWorkload.quantizationInfo.quantifyO.name }</td>
						<td>${borrowWorkload.quantizationInfo.standard
							}${borrowWorkload.quantizationInfo.unit }</td>
						<c:if test="${batcher.status eq 0 }">
							<td><input type="button" value="操作"
								onclick="borrowAction(${borrowWorkload.id })"></td>
						</c:if>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div id="fixTab">
			设备修理
			<table width="100%" border="1px" id="fixWorkload">
				<c:forEach items="${user.user.fixWorkloadlist }" var="fixWorkload">
					<tr>
						<td>${fixWorkload.id }</td>
						<td>${fixWorkload.fixTypeC }</td>
						<td>${fixWorkload.fixTime }</td>
						<td>${fixWorkload.quantizationInfo.quantifyO.name }</td>
						<td>${fixWorkload.quantizationInfo.standard
							}${fixWorkload.quantizationInfo.unit }</td>
						<c:if test="${batcher.status eq 0 }">
							<td><input type="button" value="操作"
								onclick="fixAction(${fixWorkload.id })"></td>
						</c:if>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div id="dutyTab">
			<div>坐班</div>
			<div id="legalDutyWorkload">
				<table width="100%" border="1px">
					<c:forEach items="${user.user.legalDutyWorkloadlist }"
						var="legalDutyWorkload">
						<tr>
							<td>${legalDutyWorkload.id }</td>
							<td>${legalDutyWorkload.quantizationInfo.quantifyO.name}</td>
							<td>${legalDutyWorkload.quantizationInfo.standard
								}${legalDutyWorkload.quantizationInfo.unit }</td>
							<td>${legalDutyWorkload.typeC }</td>
							<td>${legalDutyWorkload.times }</td>
							<td>${legalDutyWorkload.submitTime }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div>加班</div>
			<div id="extralDutyWorkload">
				<table width="100%" border="1px">
					<c:forEach items="${user.user.extralDutyWorkloadlist }"
						var="extralDutyWorkload">
						<tr>
							<td>${extralDutyWorkload.id }</td>
							<td>${extralDutyWorkload.quantizationInfo.quantifyO.name}</td>
							<td>${extralDutyWorkload.quantizationInfo.standard
								}${extralDutyWorkload.quantizationInfo.unit }</td>
							<td>${extralDutyWorkload.typeC }</td>
							<td>${extralDutyWorkload.times }</td>
							<td>${extralDutyWorkload.submitTime }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		
		<div id="courseTab">
			实验室课程工作量
			<table width="100%" border="1px" id="regWorkload">
				<c:forEach items="${user.user.courseWorkloadlist }"
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
		
		<div id="totalTab">
			<span>我的工作量</span>|<span style="cursor: pointer;"
				onclick="showOthers(${batcher.id})">其它成员的工作量</span>
			<div id="allWorkload"></div>
		</div>
	</div>

	<div id="dialogItems">
		<table border="1px" width="100%">
			<c:forEach items="${labs }" var="lab">
				<tr>
					<td>${lab.lab.labName }${lab.lab.doorplate }</td>
					<td><input type="button" value="选择"
						onclick="ajaxData(${lab.lab.id},${lab.id },'1')"></td>
				</tr>
			</c:forEach>
			<tr>
				<td>设备借用工作量</td>
				<td><input type="button" value="选择" onclick="showBorrow()">
				</td>
			</tr>
			<tr>
				<td>设备维修工作量</td>
				<td><input type="button" value="选择" onclick="showFix()">
				</td>
			</tr>
			<tr>
				<td>实验室开放工作量</td>
				<td><input type="button" value="选择" onclick="showOpen()">
				</td>
			</tr>
		</table>
	</div>
	<div id="dialog">
		<!-- 不可删除 -->
	</div>

	<!-- ----------------------------其它----------------------------- -->
	<div id="equipBorrowWorkload">
		<form action="/attendance/AddBorrowWorkload.do" method="post"
			name="equipBorrowWorkloadF">
			<input type="hidden" name="batcherID" value="${batcher.id}">
			<table>
				<tr>
					<td>借出设备名称</td>
					<td><input type="text" name="equipmentName"></td>
				</tr>
				<tr>
					<td>借用人</td>
					<td><input type="text" name="borrowMan"></td>
				</tr>
				<tr>
					<td>量化系数</td>
					<td>
						<div id="selectQuantizationEB"></div>
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="保存"></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="equipFixWorkload">
		<form action="/attendance/AddFixWorkload.do" method="post"
			name="equipFixWorkloadF">
			<input type="hidden" name="batcherID" value="${batcher.id}">
			<table>
				<tr>
					<td>故障描述</td>
					<td><textarea rows="4" cols="30" name="breakdownDesc"></textarea>
					</td>
				</tr>
				<tr>
					<td>维修类型</td>
					<td><select name="fixType">
							<option value="1">自修</option>
							<option value="2">外修</option>
					</select></td>
				</tr>
				<tr>
					<td>量化系数</td>
					<td>
						<div id="selectQuantizationEF"></div>
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="保存"></td>
				</tr>
			</table>
		</form>
	</div>

	<div id="labOpenWorkload">
		<form action="/attendance/AddOpenWorkload.do" method="post"
			name="openWorkloadF">
			<input type="hidden" name="batcherID" value="${batcher.id}">
			<table>
				<tr>
					<td>选择实验室</td>
					<td><select name="labToAdminID">
							<c:forEach items="${labs }" var="lab">
								<option value="${lab.id}">${lab.lab.labName
									}${lab.lab.doorplate }</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td>学生人数</td>
					<td><input type="text" name="attendStudentNum"></td>
				</tr>
				<tr>
					<td>开放内容</td>
					<td><textarea rows="4" cols="30" name="openContent"></textarea>
					</td>
				</tr>
				<tr>
					<td>量化系数</td>
					<td>
						<div id="selectQuantizationLO"></div>
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="保存"></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="detailDialog"></div>

</body>
</html>