package com.cuc.services;

import java.util.List;

import com.cuc.beans.CourseTeacher;
import com.cuc.daos.CourseTeacherDao;
import com.develop.data.base.Query;
import com.develop.data.base.iml.DefaultQuery;
import com.develop.data.result.PageResult;
import com.develop.data.result.PageRow;

public class CourseTeacherService
{
	private Query query=new DefaultQuery();
	private CourseTeacherDao infoDao= (CourseTeacherDao)query.getMapper(CourseTeacherDao.class);
	public void add(CourseTeacher ct)
	{
		infoDao.add(ct);
	}
	public List all()
	{
		return infoDao.getAll();
	}
	
	public void delete(int id)
	{
		infoDao.delete(id);
	}
}
