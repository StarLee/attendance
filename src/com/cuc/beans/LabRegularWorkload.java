package com.cuc.beans;

import com.cuc.services.LabToAdminService;
import com.cuc.services.QuantizationInfoService;

/**
 * 实验室常规工作量
 * @author starlee
 *
 */
public class LabRegularWorkload
{
	private int id;
	private int labToAdminID;
	private LabToAdmin labToAdmin;
	private QuantizationInfo quantizationInfo;
	private int quantizationID;
	private String description="";
	private String submitTime;
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public int getLabToAdminID()
	{
		return labToAdminID;
	}
	public void setLabToAdminID(int labToAdminID)
	{
		this.labToAdminID = labToAdminID;
	}
	public int getQuantizationID()
	{
		return quantizationID;
	}
	public void setQuantizationID(int quantizationID)
	{
		this.quantizationID = quantizationID;
	}
	public String getDescription()
	{
		return description;
	}
	public void setDescription(String description)
	{
		this.description = description;
	}
	public String getSubmitTime()
	{
		return submitTime;
	}
	public void setSubmitTime(String submitTime)
	{
		this.submitTime = submitTime;
	}
	public LabToAdmin getLabToAdmin()
	{
		LabToAdminService lTAService=new LabToAdminService();
		return lTAService.getSingleRecord(labToAdminID);
	}
	public QuantizationInfo getQuantizationInfo()
	{
		QuantizationInfoService qIService=new QuantizationInfoService();
		
		return qIService.getSingle(quantizationID);
	}
	

}
