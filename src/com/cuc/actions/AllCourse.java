package com.cuc.actions;

import java.util.List;
import com.cuc.services.CourseInfoService;
import com.cuc.services.CourseService;

public class AllCourse
{
	private List list;

	public List getList()
	{
		return list;
	}
	public String execute()
	{
		CourseInfoService service=new CourseInfoService();
		CourseService cservice=new CourseService();
		//list=service.allCourse();
		list=cservice.getAll();
		return "ok";
	}
}
