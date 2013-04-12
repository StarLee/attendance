package com.cuc.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.cuc.beans.SessionBean;
import com.cuc.beans.User;
import com.cuc.services.EquipFixWorkloadService;
import com.develop.actions.statistics.ActionStatistics;
import com.develop.actions.statistics.WebObject;

public class DeleteFixWorkload extends SessionSuperAdmin
{
	private String id;
	private List fixList;
	public String getUserID()
	{
		return userID;
	}
	public void setUserID(String userID)
	{
		this.userID = userID;
	}
	public String getBatcherID()
	{
		return batcherID;
	}
	public void setBatcherID(String batcherID)
	{
		this.batcherID = batcherID;
	}
	private String userID;
	private String batcherID;
	public String execute()
	{
		EquipFixWorkloadService service=new EquipFixWorkloadService();
		service.deleteByID(Integer.parseInt(id));
		User user = isSuperAdmin(userID);
		if(batcherID!=null)
			user.setBatcherID(Integer.parseInt(batcherID));
		fixList=user.getFixWorkloadlist();
		return "ok";
	}
	public List getFixList()
	{
		return fixList;
	}
	public void setId(String id)
	{
		this.id = id;
	}
}
