package com.cuc.beans;

import java.util.HashMap;
import java.util.Map;

/**
 * ��Ӧ���α�
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
		statusMap.put("0", "������");
		statusMap.put("1", "�ѹر�");
		semesterMap.put("0", "��ѧ��");
		semesterMap.put("1", "��ѧ��");
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
		return this.year+"��"+(String)semesterMap.get(semester);
	}
	public String getStatus()
	{
		return status;
	}
}
