package com.cuc.actions;

import com.cuc.beans.Course;
import com.cuc.beans.CourseInfo;
import com.cuc.services.CourseInfoService;
import com.cuc.services.CourseService;

public class AddCourseInfo
{
	private String courseID;
	private String courseName;
	private String labName;
	private String teacherName;
	private String software;
	private String weektime;
	private String labID;
	private String teacherID;
	private String batcherID;
	
	public void setBatcherID(String batcherID)
	{
		this.batcherID = batcherID;
	}

	public void setLabID(String labID)
	{
		this.labID = labID;
	}

	public void setTeacherID(String teacherID)
	{
		this.teacherID = teacherID;
	}

	public String execute()
	{
		CourseInfoService service=new CourseInfoService();
		CourseService cservice=new CourseService();
		Course course=new Course();
		CourseInfo info=new CourseInfo();
		info.setCourseID(courseID);
		info.setCourseName(courseName);
		info.setLabName(labName);
		info.setTeacherName(teacherName);
		info.setSoftware(software);
		info.setWeektime(weektime);
		
		course.setBatcherID(Integer.parseInt(batcherID));
		course.setLabID(Integer.parseInt(labID));
		course.setStudentClass(courseName);
		course.setStudyTime(weektime);
		course.setTeacherID(Integer.parseInt(teacherID));
		course.setType("1");
		cservice.add(course);
		service.addACourse(info);
		return "ok";
	}
	
	public void setCourseID(String courseID)
	{
		this.courseID = courseID;
	}
	public void setCourseName(String courseName)
	{
		this.courseName = courseName;
	}
	public void setLabName(String labName) 
	{
		this.labName = labName;
	}
	public void setTeacherName(String teacherName)
	{
		this.teacherName = teacherName;
	}
	public void setSoftware(String software)
	{
		this.software = software;
	}
	public void setWeektime(String weektime)
	{
		this.weektime = weektime;
	}
}
