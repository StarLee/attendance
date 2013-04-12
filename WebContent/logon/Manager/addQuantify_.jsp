<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link style="text/css" rel="stylesheet" href="/attendance/css/content.css">
<title>添加量化</title>
<script type="text/javascript" src="/attendance/script/jquery.min.js"></script>
<script type="text/javascript" src="/attendance/script/jquery-ui.min.js"></script>
<script type="text/javascript" src="/attendance/script/jquery.form.js"></script>
<script type="text/javascript">
	$(function() {
		var options = {
			success : showResponse,
			dataType : "json",
			clearForm : true,
			resetForm : true,
		};
		$("#quantify").ajaxForm(options);
		g_allQuantify_d();
	});
	function showResponse(data) {
		$("#listTable").empty();
		var length = data.length;
		for ( var i = 0; i < length; i++) {
			$("#listTable")
					.append(
							"<tr><td><div>"
									+ data[i].name
									+ "</div></td><td><div><input type='button'  value='系数维护' onclick='sforward("
									+ data[i].id + ")'></div></td></tr>");
		}
	}
	
	function sforward(id)
	{
		$("#quantifyID").attr("value",id);
		$("#xishu").submit();
	}
	function g_allQuantify_d()
	{
		var div=document.createElement("div");
		g_allQuantify(div);
		$(div).dialog(
				{
					title:"all Quantify",
					width:700,
					height:600
				});
	}
	function g_allQuantify(div)
	{
		var options={
				dataType:"json",
				url:"/attendance/AllQuantify.do",
				type:"post",
				success:function(datas){u_all(datas,div)}
		};
		$.ajax(options);
	}
	function u_all(datas,div)
	{
		var table=document.createElement("table");
		$(table).css("width","100%");
		for(data in datas)
		{
			var tr=table.insertRow(table.rows.length);
			var td1=c_td(tr);
			$(td1).append("<img src='/attendance/css/images/icon_leaf3.png' height='14px'>");
			$(td1).append(datas[data].name);
			var td2=c_td(tr);
			$(td2).append(datas[data].type_zh);
			var modify_input=document.createElement("input");
			
			$(modify_input).attr("type","button");
			$(modify_input).attr("value","修改");
			$(modify_input).attr("class","button_green");
			$(modify_input).bind("click",{idd:datas[data].id,name:datas[data].name,divv:div},function(eve){g_modify(eve.data.idd,eve.data.name,eve.data.divv)});
			
			var td_modify=c_td(tr);
			$(td_modify).append(modify_input);
			var input=document.createElement("input");
			$(input).attr("type","button");
			$(input).attr("value","系数维护");
			$(input).attr("class","button_green");
			$(input).bind("click",{idd:datas[data].id},function(eve){sforward(eve.data.idd )});
			
			var td3=c_td(tr);
			$(td3).append(input);
		}
		$(div).html(table);
	}
	function c_td(tr)
	{
		return tr.insertCell(tr.cells.length);
	}
	function g_modify(id,name,divv)
	{
		
		var div=document.createElement("div");
	
		var form=document.createElement("form");
		var input=document.createElement("input");
		$(input).attr("type","text");
		$(input).attr("value",name);
		$(input).attr("name","name");
		var inputidd=document.createElement("input");
		$(inputidd).attr("type","hidden");
		$(inputidd).attr("value",id);
		$(inputidd).attr("name","id");
		
		var select=document.createElement("select");
		$(select).attr("name","type");
		var option=c_options(select,{value:"0",text:"非常态"});
		$(option).attr("selected","selected");
		c_options(select,{value:"1",text:"常态"});
		c_options(select,{value:"2",text:"坐班/加班"});
		c_options(select,{value:"3",text:"课程"});
		c_options(select,{value:"4",text:"实验室开放"});
		c_options(select,{value:"5",text:"设备维护"});
		c_options(select,{value:"6",text:"设备借用"});
		$(form).append(inputidd);
		$(form).append(input);
		$(form).append(select);
		var submit=document.createElement("input");
		$(submit).attr("type","button");
		$(submit).attr("value","保存");
		$(submit).attr("name","submit");
		$(submit).bind("click",{formm:form,divv:div},function(eve){
			$(eve.data.formm).submit();
			
		});
		$(form).append(submit);
		
		
		var options = {
				success : function(data){
					$(div).dialog("close");	
					g_allQuantify(divv);
				},
				dataType : "json",
				clearForm : true,
				resetForm : true,
				type:"post",
				url:"/attendance/UpdateQuantify.do"
			};
		
		$(form).ajaxForm(options);
		//g_allQuantify(div);
		$(div).append(form);
		$(div).dialog(
				{
					title:"Quantify:"+name,
					width:300,
					height:200
				});
	}
	function c_options(select,options)
	{
		var option1=document.createElement('option');
		$(option1).attr("value",options.value);
		$(option1).html(options.text);
		$(select).append(option1);
		return option1;
	}
	function g_allBatcher()
	{
		var options={
				url:"/attendance/AllBatcher.do",
				dataType:"json",
				type:"post",
				success:function(datas)
				{
					var div=document.createElement("div");
					var table=document.createElement("table");
					$(table).css("width","100%");
					$(table).attr("border","1px");
					for(var data in datas)
					{
						var tr=table.insertRow(table.rows.length);
						var name=tr.insertCell(tr.cells.length);
						$(name).html(datas[data].semesterC);
						var button=tr.insertCell(tr.cells.length);
						var input=document.createElement("input");
						$(input).attr("type","button");
						$(input).attr("value","选择");
						$(input).bind("click",{bid:datas[data].id},function(eve){
							g_Quantization(eve.data.bid);
							$(div).dialog("close");
						});
						$(button).html(input);
					}
					$(div).html(table);
					$(div).dialog({
						title:"选择批次",
						width:300,
						height:300
					});
				}
		};
		$.ajax(options);
	}
	
	function g_Quantization(batcherid)
	{
		var options={
				 url:"/attendance/GetQuantizationBatcher.do",
				 type:"post",
				 dataType:"json",
				 data:{batcherID:batcherid},
				 success:function(data){pop_Dialog(data);}
		};
		$.ajax(options);	
	}
	function pop_Dialog(datas)
	{
		var div=document.createElement("div");
		var table=document.createElement("table");
		$(table).attr({width:"100%",border:"1px solid"});
		var n=0;
		var tr=null;
		var batcher;
		for(n=0;n<datas.length;n++)
		{
			if(n%3==0)
				tr=table.insertRow(table.rows.length);
			var td=tr.insertCell(tr.cells.length);
			batcher=datas[n].batcherO.semesterC;
			$(td).append(datas[n].quantifyO.name+"("+datas[n].standard+":"+datas[n].unit+")");
		}
		var lastr=table.rows[table.rows.length-1];
		while(lastr.cells.length<3)
		{
			tr.insertCell(tr.cells.length);
		}
		$(div).html(table);
		$(div).dialog({
			title:"all items:"+batcher,
			width:750,
			height:400
		});
	}
</script>
<style type="text/css">
.listTable td {
	border: 1px solid #ccccef;
}
</style>
</head>
<body>
	<div class="table_margin">
		<div>
			<h4>添加新的量化系数</h4>
		</div>
		<form action="/attendance/SAddQuantify.do" method="post" id="quantify">
			<table width="600px" class="table_margin">
				<tr>
					<td width="200px">
						<img src="/attendance/css/images/icon_leaf4.png" height="14px"/>
						量化系数名称
					</td>
					<td width="200px"><input type="text" name="name" class="text">
					</td>
					<td width="100">
						<select name="type">
							<option value="0" selected="selected">非常态</option>
							<option value="1">常态</option>
							<option value="2">坐班/加班</option>
							<option value="3">课程</option>
							<option value="4">实验室开放</option>
							<option value="5">设备维护开放</option>
							<option value="6">设备借用开放</option>
						</select>
					</td>
					<td colspan="2"><input type="submit" value="保存" class="submit">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div style="margin:20px 0px 20px 75px" class="rattan">
	</div>
	<div class="table_margin">
		<div>
			<h4><input type="button" value="量化系数列表" onclick="g_allQuantify_d()"></h4>
		</div>
		<br/>
		<div>
			<h4><input type="button" value="批次量化系数" onclick="g_allBatcher()"></h4>
		</div>
		<form action="/attendance/GetInfo.do" method="post" id="xishu">
			<input type="hidden" name="quantifyID" id="quantifyID">
		</form>
		<div id="content">
			
		</div>
	</div>
</body>
</html>