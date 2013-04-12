package com.cuc.beans;

import java.util.HashMap;
import java.util.Map;

/**
 * ������Ϣ��
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
		typeToCode.put("0", "�ǳ�̬");
		typeToCode.put("1", "��̬");
		typeToCode.put("2", "�Ӱ�/����");
		typeToCode.put("3", "�γ�");
		typeToCode.put("4", "ʵ���ҿ���");
		typeToCode.put("5", "�豸ά��");
		typeToCode.put("6", "�豸����");
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
