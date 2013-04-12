package com.cuc.actions;

import java.util.List;

import com.cuc.beans.Quantify;
import com.cuc.services.QuantifyService;

public class AddQuantify
{
	private String name;
	private String type;
	
	private List list;
	public String execute()
	{
		Quantify quantify=new Quantify();
		quantify.setName(name);
		quantify.setType(type);
		QuantifyService service=new QuantifyService();
		service.addQuantify(quantify);
		list=service.allQuantify();
		return "ok";
	}
	public void setType(String type)
	{
		this.type = type;
	}
	public List getList()
	{
		return list;
	}
	public void setName(String name)
	{
		this.name = name;
	}
}
