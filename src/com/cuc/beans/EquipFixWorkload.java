package com.cuc.beans;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.cuc.services.LabManagerBatcherService;
import com.cuc.services.QuantizationInfoService;
import com.cuc.services.UserService;
import com.cuc.services.util.TimeTransform;

/**
 * 设备维护工作量
 * @author starlee
 *
 */
public class EquipFixWorkload
{
	private int id;
	private int administrator;//本来与EquipBorrowWorkload想用继承，还是放弃吧
	private int quantizationID;
	private int batcherID;
	
	public User getUser()
	{
		UserService service=new UserService();
		return service.getSingleUser(administrator);
	}
	public QuantizationInfo getQuantizationInfo()
	{
		QuantizationInfoService service=new QuantizationInfoService();
		return service.getSingle(quantizationID);
	}
	public LabManageBatcher getBatcher()
	{
		LabManagerBatcherService service=new LabManagerBatcherService();
		return service.getSingleBatcher(batcherID);
	}
	private String breakdownDesc;
	private String fixType;
	
	private  static Map<String,String> fixTypeMap;
	static{
		fixTypeMap=new HashMap<String,String>();
		fixTypeMap.put("1", "自修");
		fixTypeMap.put("2", "外修");
	}
	
	public String getFixTypeC()
	{
		return (String)fixTypeMap.get(fixType);
	}
	
	private String fixTime=TimeTransform.defaultFormat(new Date());
	
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
	public String getBreakdownDesc()
	{
		return breakdownDesc;
	}
	public void setBreakdownDesc(String breakdownDesc)
	{
		this.breakdownDesc = breakdownDesc;
	}
	public String getFixType()
	{
		return fixType;
	}
	public void setFixType(String fixType)
	{
		this.fixType = fixType;
	}
	public String getFixTime()
	{
		return fixTime;
	}
	public void setFixTime(String fixTime)
	{
		this.fixTime = fixTime;
	}
}
