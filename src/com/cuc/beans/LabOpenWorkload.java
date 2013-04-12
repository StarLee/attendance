package com.cuc.beans;

import java.util.Date;

import com.cuc.services.LabToAdminService;
import com.cuc.services.QuantizationInfoService;
import com.cuc.services.util.TimeTransform;

/**
 * 实验室开放工作量
 * @author starlee
 *
 */
public class LabOpenWorkload
{
	private int id;
	private int quantizationID;
	private QuantizationInfo quantization;
	private String openContent;
	private int attendStudentNum;
	private String openTime=TimeTransform.defaultFormat(new Date());
	private int labToAdminID;
	private LabToAdmin labToAdmin;
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
	public String getOpenContent()
	{
		return openContent;
	}
	public void setOpenContent(String openContent)
	{
		this.openContent = openContent;
	}
	public int getAttendStudentNum()
	{
		return attendStudentNum;
	}
	public void setAttendStudentNum(int attendStudentNum)
	{
		this.attendStudentNum = attendStudentNum;
	}
	public String getOpenTime()
	{
		return openTime;
	}
	public void setOpenTime(String openTime)
	{
		this.openTime = openTime;
	}
	public QuantizationInfo getQuantization()
	{
		QuantizationInfoService service=new QuantizationInfoService();
		return service.getSingle(quantizationID);
	}
	public LabToAdmin getLabToAdmin()
	{
		LabToAdminService service=new LabToAdminService();
		return service.getSingleRecord(labToAdminID);
	}
}
