package com.cuc.actions;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.cuc.beans.LabOpenWorkload;
import com.cuc.beans.SessionBean;
import com.cuc.services.LabOpenWorkloadService;
import com.develop.actions.statistics.ActionStatistics;
import com.develop.actions.statistics.WebObject;

public class AddOpenWorkload
{
	private String attendStudentNum;
	private String labToAdminID;
	private String openContent;
	private String quantizationID;
	private List openList;
	public String execute()
	{
		
		LabOpenWorkloadService service=new LabOpenWorkloadService();
		LabOpenWorkload labOpenWorkload=new LabOpenWorkload();
		HttpServletRequest request=(HttpServletRequest) ActionStatistics.getInstance().get(WebObject.SERVLETREQUEST);
		SessionBean bean=(SessionBean)request.getSession().getAttribute("user");
		labOpenWorkload.setAttendStudentNum(Integer.parseInt(attendStudentNum));
		labOpenWorkload.setLabToAdminID(Integer.parseInt(labToAdminID));
		labOpenWorkload.setOpenContent(openContent);
		labOpenWorkload.setQuantizationID(Integer.parseInt(quantizationID));
		service.addNewRecord(labOpenWorkload);
		openList=bean.getUser().getOpenWorkloadlist();
		return "ok";
	}
	public List getOpenList()
	{
		return openList;
	}
	public void setAttendStudentNum(String attendStudentNum)
	{
		this.attendStudentNum = attendStudentNum;
	}
	
	public void setLabToAdminID(String labToAdminID)
	{
		this.labToAdminID = labToAdminID;
	}
	public void setOpenContent(String openContent)
	{
		this.openContent = openContent;
	}
	public void setQuantizationID(String quantizationID)
	{
		this.quantizationID = quantizationID;
	}
}
