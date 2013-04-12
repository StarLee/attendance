package com.cuc.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.cuc.beans.SessionBean;
import com.cuc.beans.User;
import com.cuc.services.LabRegularWorkloadService;
import com.cuc.services.UserService;
import com.develop.actions.statistics.ActionStatistics;
import com.develop.actions.statistics.WebObject;

public class DeleteRegularWorkload extends SessionSuperAdmin
{
	private String id;
	private String userID;//”√ªßuserID
	private String batcherID;

	private List list;
	public String execute()
	{
		LabRegularWorkloadService service=new LabRegularWorkloadService();
		service.deleteByID(Integer.parseInt(id));
		User user = isSuperAdmin(userID);
		if(batcherID!=null)
			user.setBatcherID(Integer.parseInt(batcherID));
		list=user.getRegularWorkloadlist();
		
		return "ok";
	}
	
	public String getUserID()
	{
		return userID;
	}

	public void setUserID(String userID)
	{
		this.userID = userID;
	}

	public void setId(String id)
	{
		this.id = id;
	}
	public List getList()
	{
		return list;
	}
	public String getBatcherID()
	{
		return batcherID;
	}

	public void setBatcherID(String batcherID)
	{
		this.batcherID = batcherID;
	}
}
