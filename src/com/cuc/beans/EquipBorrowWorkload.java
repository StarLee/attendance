package com.cuc.beans;

import java.util.Date;

import com.cuc.services.LabManagerBatcherService;
import com.cuc.services.QuantizationInfoService;
import com.cuc.services.UserService;
import com.cuc.services.util.TimeTransform;

/**
 * 设备借用工作量
 * @author starlee
 *
 */
public class EquipBorrowWorkload
{
	private int id;
	private int administrator;
	private int quantizationID;
	private int batcherID;
	private String equipmentName;
	private String borrowTime=TimeTransform.defaultFormat(new Date());
	private String borrowMan;
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
	public String getEquipmentName()
	{
		return equipmentName;
	}
	public void setEquipmentName(String equipmentName)
	{
		this.equipmentName = equipmentName;
	}
	public String getBorrowTime()
	{
		return borrowTime;
	}
	public void setBorrowTime(String borrowTime)
	{
		this.borrowTime = borrowTime;
	}
	public String getBorrowMan()
	{
		return borrowMan;
	}
	public void setBorrowMan(String borrowMan)
	{
		this.borrowMan = borrowMan;
	}
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
}
