package com.cuc.actions;

import com.cuc.beans.QuantizationInfo;
import com.cuc.services.QuantizationInfoService;
import com.develop.actions.test.Basic;

public class UpdateQuantizationStandard implements Basic
{
	private String id;
	private String standard;
	private String quantifyID;
	public String getQuantifyID()
	{
		return quantifyID;
	}
	public void setId(String id)
	{
		this.id = id;
	}
	public void setStandard(String standard)
	{
		this.standard = standard;
	}
	public String execute()
	{
		QuantizationInfoService service=new QuantizationInfoService();
		QuantizationInfo info=service.getSingle(Integer.parseInt(id));
		info.setStandard(standard);
		quantifyID=String.valueOf(info.getQuantifyID());
		service.updateStandard(info);
		return "ok";
	}
	
}
