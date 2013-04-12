package com.cuc.actions;

import com.cuc.beans.LabOpenWorkload;
import com.cuc.services.LabOpenWorkloadService;

public class GetSingleOpenWorkload
{
	private String id;
	private LabOpenWorkload openWorkload;
	public String execute()
	{
		LabOpenWorkloadService service=new LabOpenWorkloadService();
		openWorkload=service.getSingle(Integer.parseInt(id));
		return "ok";
	}
	
	public void setId(String id)
	{
		this.id = id;
	}

	public LabOpenWorkload getOpenWorkload()
	{
		return openWorkload;
	}
}
