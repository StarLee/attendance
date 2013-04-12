package com.cuc.beans;

import com.cuc.daos.BatcherDao;
import com.cuc.daos.CourseTeacherDao;
import com.cuc.daos.LabInfoDao;
import com.develop.data.base.iml.DefaultQuery;

public class Course
{
	private int id;
	private String studentClass;
	private int teacherID;
	private String studyTime;
	private String type;
	private int batcherID;
	private int labID;
	private LabManageBatcher batcher;
	private CourseTeacher teacher;
	private LabInfo lab;
	public LabManageBatcher getBatcher()
	{
		DefaultQuery query=new DefaultQuery();
		BatcherDao dao=(BatcherDao)query.getMapper(BatcherDao.class);
		return dao.getSingleBatcher(batcherID);
	}
	public CourseTeacher getTeacher()
	{
		DefaultQuery query=new DefaultQuery();
		CourseTeacherDao dao=(CourseTeacherDao)query.getMapper(CourseTeacherDao.class);
		return dao.getSingleTeacher(teacherID);
	}
	public LabInfo getLab()
	{
		DefaultQuery query=new DefaultQuery();
		LabInfoDao dao=(LabInfoDao)query.getMapper(LabInfoDao.class);
		return dao.getLab(labID);
	}
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public String getStudentClass()
	{
		return studentClass;
	}
	public void setStudentClass(String studentClass)
	{
		this.studentClass = studentClass;
	}
	public int getTeacherID()
	{
		return teacherID;
	}
	public void setTeacherID(int teacherID)
	{
		this.teacherID = teacherID;
	}
	public String getStudyTime()
	{
		return studyTime;
	}
	public void setStudyTime(String studyTime)
	{
		this.studyTime = studyTime;
	}
	public String getType()
	{
		return type;
	}
	public void setType(String type)
	{
		this.type = type;
	}
	public int getBatcherID()
	{
		return batcherID;
	}
	public void setBatcherID(int batcherID)
	{
		this.batcherID = batcherID;
	}
	public int getLabID()
	{
		return labID;
	}
	public void setLabID(int labID)
	{
		this.labID = labID;
	}
	//这个字段不是映射到数据库，而是一个逻辑字段，判断课程的工作量是否已经加入了
	private String hasAddToWorkload="0";
	public String getHasAddToWorkload()
	{
		return hasAddToWorkload;
	}
	public void setHasAddToWorkload(String hasAddToWorkload)
	{
		this.hasAddToWorkload = hasAddToWorkload;
	}
	
}
