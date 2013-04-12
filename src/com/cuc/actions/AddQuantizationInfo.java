package com.cuc.actions;

import com.cuc.beans.QuantizationInfo;
import com.cuc.services.QuantizationInfoService;

public class AddQuantizationInfo
{
	private String batcherID;
	private String quantifyID;

	private String standard;
	private String unit;
	public void setBatcherID(String batcherID)
	{
		this.batcherID = batcherID;
	}
	public void setQuantifyID(String quantifyID)
	{
		this.quantifyID = quantifyID;
	}
	public void setStandard(String standard)
	{
		this.standard = standard;
	}
	public void setUnit(String unit)
	{
		this.unit = unit;
	}
	public String getQuantifyID()
	{
		return quantifyID;
	}
	public String execute()
	{
		QuantizationInfoService service=new QuantizationInfoService();
		QuantizationInfo info=new QuantizationInfo();
		info.setBatcherID(Integer.parseInt(batcherID));
		info.setQuantifyID(Integer.parseInt(quantifyID));
		info.setStandard(standard);
		info.setUnit(unit);
		service.addNewQuantizationInfo(info);
		return "ok";
	}
}
