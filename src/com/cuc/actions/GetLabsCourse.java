package com.cuc.actions;

import java.util.List;

import com.cuc.services.CourseService;

public class GetLabsCourse
{
	private String batcherid;
	private String labid;
	private List list;
	public List getList()
	{
		return list;
	}
	public void setBatcherid(String batcherid)
	{
		this.batcherid = batcherid;
	}
	public void setLabid(String labid)
	{
		this.labid = labid;
	}
	public String execute()
	{
		CourseService service=new CourseService();
		list=service.getLabsCourse(Integer.parseInt(batcherid), Integer.parseInt(labid));
		return "ok";
	}
}
