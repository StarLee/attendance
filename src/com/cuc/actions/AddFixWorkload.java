package com.cuc.actions;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.cuc.beans.EquipFixWorkload;
import com.cuc.beans.SessionBean;
import com.cuc.services.EquipFixWorkloadService;
import com.develop.actions.statistics.ActionStatistics;
import com.develop.actions.statistics.WebObject;

public class AddFixWorkload
{
	private String batcherID;
	private String breakdownDesc;
	private String fixType;
	private String quantizationID;
	private List fixList;
	public String execute()
	{
		EquipFixWorkloadService service=new EquipFixWorkloadService();
		EquipFixWorkload equip=new EquipFixWorkload();
		HttpServletRequest request=(HttpServletRequest) ActionStatistics.getInstance().get(WebObject.SERVLETREQUEST);
		SessionBean bean=(SessionBean)request.getSession().getAttribute("user");
		
		
		
		equip.setAdministrator(bean.getUser().getId());
		equip.setBatcherID(Integer.parseInt(batcherID));
		equip.setBreakdownDesc(breakdownDesc);
		equip.setFixType(fixType);
		equip.setQuantizationID(Integer.parseInt(quantizationID));
		service.addNewRecord(equip);
		fixList=bean.getUser().getFixWorkloadlist();
		return "ok";
	}
	public void setBatcherID(String batcherID)
	{
		this.batcherID = batcherID;
	}
	public void setBreakdownDesc(String breakdownDesc)
	{
		this.breakdownDesc = breakdownDesc;
	}
	public void setFixType(String fixType)
	{
		this.fixType = fixType;
	}
	public void setQuantizationID(String quantizationID)
	{
		this.quantizationID = quantizationID;
	}
	public List getFixList()
	{
		return fixList;
	}
}
