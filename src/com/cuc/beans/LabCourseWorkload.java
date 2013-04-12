package com.cuc.beans;

import com.cuc.services.CourseService;
import com.cuc.services.LabToAdminService;
import com.cuc.services.QuantizationInfoService;

/**
 * 实验室常规工作量
 * @author starlee
 *
 */
public class LabCourseWorkload
{
	
	private int id;
	private int labToAdminID;
	private LabToAdmin labToAdmin;
	private QuantizationInfo quantizationInfo;
	private int quantizationID;
	private String submitTime;
	private int courseID;
	private Course course;
	public int getCourseID()
	{
		return courseID;
	}
	public void setCourseID(int courseID)
	{
		this.courseID = courseID;
	}
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
	public Course getCourse()
	{
		CourseService cService=new CourseService();
		return cService.getCourseByID(courseID);
	}

}
