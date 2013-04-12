package com.cuc.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.cuc.beans.SessionBean;
import com.cuc.beans.User;
import com.cuc.services.LabOpenWorkloadService;
import com.develop.actions.statistics.ActionStatistics;
import com.develop.actions.statistics.WebObject;

public class DeleteOpenWorkload extends SessionSuperAdmin
{
	private String id;
	private String batcherID;
	private String userID;
	public String getBatcherID()
	{
		return batcherID;
	}
	public void setBatcherID(String batcherID)
	{
		this.batcherID = batcherID;
	}
	public String getUserID()
	{
		return userID;
	}
	public void setUserID(String userID)
	{
		this.userID = userID;
	}
	private List openList;
	public void setId(String id)
	{
		this.id = id;
	}
	public String execute()
	{
		LabOpenWorkloadService service=new LabOpenWorkloadService();
		service.deleteByID(Integer.parseInt(id));
		User user = isSuperAdmin(userID);
		if(batcherID!=null)
			user.setBatcherID(Integer.parseInt(batcherID));
		openList=user.getOpenWorkloadlist();
		return "ok";
	}
	public List getOpenList()
	{
		return openList;
	}

}
