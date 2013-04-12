package com.cuc.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.cuc.beans.SessionBean;
import com.cuc.beans.User;
import com.cuc.services.EquipBorrowWorkloadService;
import com.develop.actions.statistics.ActionStatistics;
import com.develop.actions.statistics.WebObject;

public class DeleteBorrowWorkload extends SessionSuperAdmin
{
	private String id;
	private List borrowList;
	private String userID;
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
	private String batcherID;
	public void setId(String id)
	{
		this.id = id;
	}
	public String execute()
	{
		EquipBorrowWorkloadService service=new EquipBorrowWorkloadService();
		service.deleteByID(Integer.parseInt(id));
		User user = isSuperAdmin(userID);
		if(batcherID!=null)
			user.setBatcherID(Integer.parseInt(batcherID));
		borrowList=user.getBorrowWorkloadlist();
		return "ok";
	}
	public List getBorrowList()
	{
		return borrowList;
	}
}
