package com.cuc.actions;

import java.util.List;

import com.cuc.services.LabManagerBatcherService;

public class UpdateBatcherStart
{
	private String id;
	private List batcherList;
	public String execute()
	{
		LabManagerBatcherService service=new LabManagerBatcherService();
		service.updateStart(Integer.parseInt(id));
		batcherList=service.allBatcher();
		return "ok";
	}
	public void setId(String id)
	{
		this.id = id;
	}
	public List getBatcherList()
	{
		return batcherList;
	}
}
