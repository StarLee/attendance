package com.cuc.actions;

import com.cuc.beans.CourseTeacher;
import com.cuc.services.CourseTeacherService;
import com.develop.actions.test.Basic;

public class DeleteCourseTeacher implements Basic
{

	private String id;
	public String execute()
	{
		CourseTeacherService service=new CourseTeacherService();
		service.delete(Integer.parseInt(id));
		return "ok";
	}
	public void setId(String id)
	{
		this.id = id;
	}

}
