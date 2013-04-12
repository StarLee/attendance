package com.cuc.actions;

import java.util.List;

import com.cuc.services.CourseTeacherService;
import com.develop.actions.test.Basic;

public class AllTeacher implements Basic
{
	private List list;
	
	public List getList()
	{
		return list;
	}
	public String execute()
	{
		CourseTeacherService service=new CourseTeacherService();
		list=service.all();
		return "ok";
	}

}
