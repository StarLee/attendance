package com.cuc.actions;

import com.cuc.beans.LabInfo;
import com.cuc.services.LabInfoService;

public class AddNewLab
{
	private String labName;
	private String doorplate;
	private String labIntro;
	private String labArea;
	private String type;
	public String execute()
	{
		LabInfoService service=new LabInfoService();
		LabInfo info=new LabInfo();
		info.setDoorplate(doorplate);
		info.setLabArea(Integer.parseInt(labArea));
		info.setLabIntro(labIntro);
		info.setLabName(labName);
		info.setType(type);
		service.addALab(info);
		return "ok";
	}
	public void setLabName(String labName)
	{
		this.labName = labName;
	}
	public void setDoorplate(String doorplate)
	{
		this.doorplate = doorplate;
	}
	public void setLabIntro(String labIntro)
	{
		this.labIntro = labIntro;
	}
	public void setLabArea(String labArea)
	{
		this.labArea = labArea;
	}
	public void setType(String type)
	{
		this.type = type;
	}
	
}
