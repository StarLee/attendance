package com.cuc.beans;

import java.util.HashMap;
import java.util.Map;

/**
 * 对应批次表
 * @author starlee
 *
 */
public class LabManageBatcher
{
	private int id;
	private String year;
	private String semester;
	private String status;
	
	private String semesterC;
	private String statusC;
	private static Map statusMap=new HashMap();
	private static Map semesterMap=new HashMap();
	static
	{
		statusMap.put("0", "启用中");
		statusMap.put("1", "已关闭");
		semesterMap.put("0", "上学期");
		semesterMap.put("1", "下学期");
	}
	public String getStatusC()
	{
		return (String)statusMap.get(status);
	}
	public int getId()
	{
		return id;
	}
	public void setStatus(String status)
	{
		this.status = status;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public String getYear()
	{
		return year;
	}
	public void setYear(String year)
	{
		this.year = year;
	}
	public String getSemester()
	{
		return semester;
	}
	public void setSemester(String semester)
	{
		this.semester = semester;
	}
	public String getSemesterC()
	{
		return this.year+"年"+(String)semesterMap.get(semester);
	}
	public String getStatus()
	{
		return status;
	}
}
