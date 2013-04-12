package com.cuc.actions;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.cuc.beans.User;
import com.cuc.services.UserService;
import com.develop.data.result.PageResult;

public class WorkloadSchema
{
	private String batcherID;
	private List list;
	public void setBatcherID(String batcherID)
	{
		this.batcherID = batcherID;
	}
	public String execute()
	{
		UserService service=new UserService();
		PageResult<User> users=service.getAll();
		Iterator<User> it=users.iterator();
		list=new ArrayList();
		while(it.hasNext())
		{
			User user=it.next();
			user.setBatcherID(Integer.parseInt(batcherID));
			Map userM=user.getTotalWorkMap();
			userM.put("user", user.getName()+"("+user.getUserName()+")");
			userM.put("userID",user.getId());
			list.add(userM);
		}
		return "ok";
	}
	public List getList()
	{
		return list;
	}
}
