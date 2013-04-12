package com.cuc.actions;

import java.util.List;

import com.cuc.beans.Quantify;
import com.cuc.services.LabManagerBatcherService;
import com.cuc.services.QuantifyService;
import com.cuc.services.QuantizationInfoService;
/**
 * 获取一个量化参数的量化系数
 * @author starlee
 *
 */
public class GetQuantizationInfo
{
	private String quantifyID;
	private List list;
	private Quantify quantify;
	private List batcherList;
	
	public List getBatcherList()
	{
		return batcherList;
	}
	public String execute()
	{
		QuantizationInfoService qIService=new QuantizationInfoService();
		list=qIService.getQuantizationInfo(Integer.parseInt(quantifyID));
		QuantifyService qService=new QuantifyService();
		quantify=qService.getSingleQuantify(Integer.parseInt(quantifyID));
		LabManagerBatcherService labBService=new LabManagerBatcherService();
		batcherList=labBService.allBatcher();
		return "ok";
	}
	public Quantify getQuantify()
	{
		return quantify;
	}
	public List getList()
	{
		return list;
	}
	public void setQuantifyID(String quantifyID)
	{
		this.quantifyID = quantifyID;
	}
}
