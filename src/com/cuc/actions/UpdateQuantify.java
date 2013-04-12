package com.cuc.actions;

import java.util.ArrayList;
import java.util.List;

import com.cuc.beans.Quantify;
import com.cuc.services.QuantifyService;

public class UpdateQuantify
{
	private String id;
	private String name;
	private String type;
	private List<String> result=new ArrayList<String>();
	
	public List<String> getResult()
	{
		return result;
	}
	public void setId(String id)
	{
		this.id = id;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public void setType(String type)
	{
		this.type = type;
	}
	public String execute()
	{
		QuantifyService service=new QuantifyService();
		Quantify quantify=service.getSingleQuantify(Integer.parseInt(id));
		quantify.setName(name);
		quantify.setType(type);
		service.updateQuantify(quantify);
		result.add("0");
		return "ok";
		
	}
}
