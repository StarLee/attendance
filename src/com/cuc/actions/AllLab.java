package com.cuc.actions;

import java.util.List;

import com.cuc.services.LabInfoService;

public class AllLab
{
	private List list;

	public List getList()
	{
		return list;
	}
	public String execute()
	{
		LabInfoService service=new LabInfoService();
		list=service.allLab();
		return "ok";
	}
}
