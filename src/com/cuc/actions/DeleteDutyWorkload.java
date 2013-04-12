package com.cuc.actions;

import java.util.HashMap;
import java.util.Map;

import com.cuc.beans.DutyWorkload;
import com.cuc.beans.User;
import com.cuc.services.DutyWorkloadService;
import com.cuc.services.UserService;

public class DeleteDutyWorkload
{
	private String id;
	private Map legal=new HashMap();
	
	public void setId(String id)
	{
		this.id = id;
	}
	public String execute()
	{
		DutyWorkloadService service=new DutyWorkloadService();
		DutyWorkload workload= service.getSingleDuty(Integer.parseInt(id));
		service.deleteByID(Integer.parseInt(id));
		UserService uservice=new UserService();
		User user=uservice.getSingleUser(workload.getAdministrator());
		user.setBatcherID(workload.getBatcherID());
		String type=workload.getType();
		legal.put("type",type );
		if(type.equals("1"))
		{
			legal.put("list", user.getLegalDutyWorkloadlist());
		}
		else
		{
			legal.put("list", user.getExtralDutyWorkloadlist());
		}
		return "ok";
	}
	public Map getLegal()
	{
		return legal;
	}
}
