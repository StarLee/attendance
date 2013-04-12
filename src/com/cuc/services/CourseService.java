package com.cuc.services;

import java.util.List;

import com.cuc.beans.Course;
import com.cuc.beans.LabCourseWorkload;
import com.cuc.daos.CourseDao;
import com.develop.data.base.Query;
import com.develop.data.base.iml.DefaultQuery;

public class CourseService
{
	private Query query=new DefaultQuery();
	private CourseDao infoDao= (CourseDao)query.getMapper(CourseDao.class);
	public void add(Course course)
	{
		infoDao.add(course);
	}
	public List getAll()
	{
		return infoDao.getAll();
	}
	public List getAllBatcher(int batcher)
	{
		return infoDao.getAllByBatcher(batcher);
	}
	public List getLabsCourse(int batcher,int lab)
	{
		List<Course> list=infoDao.getLabsCourse(batcher, lab);
		for(Course course:list)
		{
			LabCourseWorkloadService sservice=new LabCourseWorkloadService();
			LabCourseWorkload workload= sservice.getByCourse(course.getId());
			if(workload!=null)
			{
				course.setHasAddToWorkload("1");
			}
		}
		return list;
	}
	public Course getCourseByID(int id)
	{
		return infoDao.get(id);
	}
}
