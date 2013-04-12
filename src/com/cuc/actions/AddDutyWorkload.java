package com.cuc.actions;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cuc.beans.DutyWorkload;
import com.cuc.beans.User;
import com.cuc.services.DutyWorkloadService;
import com.cuc.services.UserService;

public class AddDutyWorkload
{
	private String administrator;
	private String quantizationID;
	private String batcherID;
	private String times;
	private String type;
	private String description;
	private Map legal=new HashMap();
	
	public String execute()
	{
		DutyWorkload dutyWorkload=new DutyWorkload();
		dutyWorkload.setAdministrator(Integer.parseInt(administrator));
		dutyWorkload.setBatcherID(Integer.parseInt(batcherID));
		dutyWorkload.setDescription(description);
		dutyWorkload.setQuantizationID(Integer.parseInt(quantizationID));
		dutyWorkload.setTimes(Integer.parseInt(times));
		dutyWorkload.setType(type);
		DutyWorkloadService service=new DutyWorkloadService();
		service.addNew(dutyWorkload);
		UserService uservice=new UserService();
		User user=uservice.getSingleUser(Integer.parseInt(administrator));
		user.setBatcherID(Integer.parseInt(batcherID));
		legal.put("type", type);
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
	
	public void setAdministrator(String administrator)
	{
		this.administrator = administrator;
	}
	public void setQuantizationID(String quantizationID)
	{
		this.quantizationID = quantizationID;
	}
	public void setBatcherID(String batcherID)
	{
		this.batcherID = batcherID;
	}
	public void setTimes(String times)
	{
		this.times = times;
	}
	public void setType(String type)
	{
		this.type = type;
	}
	public void setDescription(String description)
	{
		this.description = description;
	}

	public Map getLegal()
	{
		return legal;
	}
}
