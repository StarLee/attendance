package com.cuc.daos;

import java.util.List;

import com.cuc.beans.CourseInfo;

public interface CourseInfoDao
{
	public void addCourseInfo(CourseInfo courseInfo);
	public List allCourse();
	public CourseInfo getCourse(int courseID);
}
