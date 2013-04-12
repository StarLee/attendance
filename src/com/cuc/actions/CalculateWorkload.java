package com.cuc.actions;

import java.util.List;

import com.cuc.services.LabManagerBatcherService;

public class CalculateWorkload
{
	private List list;
	public String execute()
	{
		LabManagerBatcherService btService=new LabManagerBatcherService();
		list=btService.allBatcher();
		return "ok";
	}
	public List getList()
	{
		return list;
	}
}
