package com.cuc.services;

import java.util.List;

import com.cuc.beans.CourseInfo;
import com.cuc.daos.CourseInfoDao;
import com.develop.data.base.Query;
import com.develop.data.base.iml.DefaultQuery;
/**
 * 加入一个新的实验室信息
 * 
 *
 */
public class CourseInfoService
{
	private Query query=new DefaultQuery();
	private CourseInfoDao infoDao= (CourseInfoDao)query.getMapper(CourseInfoDao.class);
	public void addACourse(CourseInfo courseInfo)
	{
		infoDao.addCourseInfo(courseInfo);
	}
	
	public List allCourse()
	{
		return infoDao.allCourse();
	}
	
	public CourseInfo getSingleCourseInfo(int courseID)
	{
		return infoDao.getCourse(courseID);
	}
}
