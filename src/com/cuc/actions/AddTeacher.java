package com.cuc.actions;

import com.cuc.beans.CourseTeacher;
import com.cuc.services.CourseTeacherService;
import com.develop.actions.test.Basic;

public class AddTeacher implements Basic
{
	private String name;
	public void setName(String name)
	{
		this.name = name;
	}
	public String execute()
	{
		CourseTeacherService service=new CourseTeacherService();
		CourseTeacher teacher=new CourseTeacher();
		teacher.setTeacherName(name);
		service.add(teacher);
		return "ok";
	}

}
