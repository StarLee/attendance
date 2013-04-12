package com.cuc.beans;

import java.util.HashMap;
import java.util.Map;

/**
 * 实验室信息
 * @author starlee
 *
 */
public class LabInfo
{
	private int id;
	private String labName;
	private String doorplate;
	private String labIntro;
	private int labArea;
	private String type;
	private static Map<String,String> typeMap;
	static
	{
		typeMap=new HashMap<String, String>();
		typeMap.put("1", "机房");
		typeMap.put("2", "实验室机房");
		typeMap.put("1", "实验室");
	}
	public String getTypeC()
	{
		return typeMap.get(type);
	}
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public String getLabName()
	{
		return labName;
	}
	public void setLabName(String labName)
	{
		this.labName = labName;
	}
	public String getDoorplate()
	{
		return doorplate;
	}
	public void setDoorplate(String doorplate)
	{
		this.doorplate = doorplate;
	}
	public String getLabIntro()
	{
		return labIntro;
	}
	public void setLabIntro(String labIntro)
	{
		this.labIntro = labIntro;
	}
	public int getLabArea()
	{
		return labArea;
	}
	public void setLabArea(int labArea)
	{
		this.labArea = labArea;
	}
	public String getType()
	{
		return type;
	}
	public void setType(String type)
	{
		this.type = type;
	}
}
