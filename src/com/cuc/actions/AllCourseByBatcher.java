package com.cuc.actions;

import java.util.List;
import com.cuc.services.CourseInfoService;
import com.cuc.services.CourseService;

public class AllCourseByBatcher
{
	private List list;
	private String batcherID;
	public void setBatcherID(String batcherID)
	{
		this.batcherID = batcherID;
	}
	public List getList()
	{
		return list;
	}
	public String execute()
	{
		CourseInfoService service=new CourseInfoService();
		CourseService cservice=new CourseService();
		//list=service.allCourse();
		list=cservice.getAllBatcher(Integer.parseInt(batcherID));
		return "ok";
	}
}
