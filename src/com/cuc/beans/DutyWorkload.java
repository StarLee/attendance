package com.cuc.beans;

import java.util.HashMap;
import java.util.Map;

import com.cuc.services.QuantizationInfoService;

/**
 * ×ø°à¼Ó°à/×ø°à¹¤×÷Á¿
 * @author starlee
 *
 */
public class DutyWorkload
{
	private int id; 
	private int administrator;
	private int quantizationID;
	private int batcherID;
	private int times;
	private String type;
	private String typeC;
	private QuantizationInfo quantizationInfo;
	private String submitTime;
	public String getSubmitTime()
	{
		return submitTime;
	}
	public void setSubmitTime(String submitTime)
	{
		this.submitTime = submitTime;
	}
	private static Map<String,String> typeMap;
	static 
	{
		typeMap=new HashMap<String,String>();
		typeMap.put("1", "×ø°à");
		typeMap.put("2", "¼Ó°à");
	}
	private String description;
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
	public int getAdministrator()
	{
		return administrator;
	}
	public void setAdministrator(int administrator)
	{
		this.administrator = administrator;
	}
	public int getQuantizationID()
	{
		return quantizationID;
	}
	public void setQuantizationID(int quantizationID)
	{
		this.quantizationID = quantizationID;
	}
	public int getBatcherID()
	{
		return batcherID;
	}
	public void setBatcherID(int batcherID)
	{
		this.batcherID = batcherID;
	}
	public int getTimes()
	{
		return times;
	}
	public void setTimes(int times)
	{
		this.times = times;
	}
	public String getType()
	{
		return type;
	}
	public void setType(String type)
	{
		this.type = type;
	}
	public String getDescription()
	{
		return description;
	}
	public void setDescription(String description)
	{
		this.description = description;
	}
	public QuantizationInfo getQuantizationInfo()
	{
		QuantizationInfoService qIService=new QuantizationInfoService();
		
		return qIService.getSingle(quantizationID);
	}
}
