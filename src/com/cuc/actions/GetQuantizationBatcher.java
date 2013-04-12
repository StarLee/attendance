package com.cuc.actions;

import java.util.List;

import com.cuc.services.QuantizationInfoMixService;
import com.cuc.services.QuantizationInfoService;

public class GetQuantizationBatcher
{
	private String batcherID;
	private String type;
	public void setType(String type)
	{
		this.type = type;
	}

	private List list;

	public String execute()
	{
		if(type==null)
		{
			QuantizationInfoService service = new QuantizationInfoService();
			list = service
					.getQuantizationInfoByBatcher(Integer.parseInt(batcherID));
		}
		else
		{
			QuantizationInfoMixService service = new QuantizationInfoMixService();
			list=service.getQuantizationInfoByBatcherType(Integer.parseInt(batcherID), type);
		}
		return "ok";
	}

	public void setBatcherID(String batcherID)
	{
		this.batcherID = batcherID;
	}

	public List getList()
	{
		return list;
	}
}
