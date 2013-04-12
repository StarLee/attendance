package com.cuc.beans;

import java.util.HashMap;
import java.util.Map;

/**
 * 量化信息表
 * @author starlee
 *
 */
public class Quantify
{
	private int id;
	private String Name;
	private String type;
	private String type_zh;
	private static Map<String,String> typeToCode=new HashMap<String,String>();
	public String getType_zh()
	{
		return typeToCode.get(type);
	}
	static
	{
		typeToCode.put("0", "非常态");
		typeToCode.put("1", "常态");
		typeToCode.put("2", "加班/坐班");
		typeToCode.put("3", "课程");
		typeToCode.put("4", "实验室开放");
		typeToCode.put("5", "设备维护");
		typeToCode.put("6", "设备借用");
	}
	public String getType()
	{
		return type;
	}
	public void setType(String type)
	{
		this.type = type;
	}
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public String getName()
	{
		return Name;
	}
	public void setName(String name)
	{
		Name = name;
	}
}
