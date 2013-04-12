package com.cuc.actions;

import java.util.Map;

import com.cuc.beans.User;
import com.cuc.services.UserService;

public class UserTotalWorkload
{
	private String userID;
	private String batcherID;
	private Map map;
	public void setUserID(String userID)
	{
		this.userID = userID;
	}
	public void setBatcherID(String batcherID)
	{
		this.batcherID = batcherID;
	}
	public String execute()
	{
		UserService service=new UserService();
		User user=service.getSingleUser(Integer.parseInt(userID));
		user.setBatcherID(Integer.parseInt(batcherID));
		map=user.getTotalWorkMap();
		return "ok";
	}
	public Map getMap()
	{
		return map;
	}
}
