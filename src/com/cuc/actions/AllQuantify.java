package com.cuc.actions;

import java.util.List;

import com.cuc.services.QuantifyService;

public class AllQuantify
{
	private List list;
	public String execute()
	{
		QuantifyService service=new QuantifyService();
		list=service.allQuantify();
		return "ok";
	}
	public List getList()
	{
		return list;
	}
}
