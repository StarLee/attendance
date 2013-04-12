package com.cuc.beans;

import com.cuc.services.LabManagerBatcherService;
import com.cuc.services.QuantifyService;

/**
 * 量化系数表
 * @author starlee
 *
 */
public class QuantizationInfo
{
	private int id;
	private int quantifyID;
	private Quantify quantifyO;
	private String standard;
	private String unit;
	private int batcherID;
	private LabManageBatcher batcherO;
	public int getId()
	{
		return id;
	}
	public Quantify getQuantifyO()
	{ 
		QuantifyService service=new QuantifyService();
		quantifyO=service.getSingleQuantify(quantifyID);
		return quantifyO;
	}
	public LabManageBatcher getBatcherO()
	{
		LabManagerBatcherService service=new LabManagerBatcherService();
		batcherO=service.getSingleBatcher(batcherID);
		return batcherO;
	}
	public void setId(int id)
	{
		this.id = id;
	}

	public int getQuantifyID()
	{
		return quantifyID;
	}
	public void setQuantifyID(int quantifyID)
	{
		this.quantifyID = quantifyID;
	}
	public String getStandard()
	{
		return standard;
	}
	public void setStandard(String standard)
	{
		this.standard = standard;
	}
	public String getUnit()
	{
		return unit;
	}
	public void setUnit(String unit)
	{
		this.unit = unit;
	}
	public int getBatcherID()
	{
		return batcherID;
	}
	public void setBatcherID(int batcherID)
	{
		this.batcherID = batcherID;
	}
}
