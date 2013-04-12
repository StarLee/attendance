package com.cuc.actions;

import com.cuc.beans.QuantizationInfo;
import com.cuc.services.QuantizationInfoService;
import com.develop.actions.test.Basic;

public class GetQuantizationInfoDetail implements Basic
{
	private QuantizationInfo quantization;
	private String id;
	public void setId(String id)
	{
		this.id = id;
	}

	public QuantizationInfo getQuantization()
	{
		return quantization;
	}

	public String execute()
	{
		QuantizationInfoService service=new QuantizationInfoService();
		quantization=service.getSingle(Integer.parseInt(id));
		return "ok";
	}
	
}
