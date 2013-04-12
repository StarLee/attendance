package com.cuc.daos;

import java.util.List;

import com.cuc.beans.CourseTeacher;
import com.develop.data.annotation.SQL;
import com.develop.data.annotation.SQLTYPE;

public interface CourseTeacherDao
{
	@SQL(sqlType=SQLTYPE.INSERT,sql="insert into CourseTeacher(ID,TeacherName) values(0,'#{teacherName}')")
	public void add(CourseTeacher ct );
	@SQL(sqlType=SQLTYPE.SELECT,sql="select ID as id,TeacherName as teacherName from CourseTeacher order by ID desc",resultType="com.cuc.beans.CourseTeacher")
	public List getAll();
	@SQL(sqlType=SQLTYPE.DELETE,sql="delete from CourseTeacher where ID=#{id}")
	public void delete(int id);
	@SQL(sqlType=SQLTYPE.SELECT,sql="select ID as id,TeacherName as teacherName from CourseTeacher where ID=#{id}",resultType="com.cuc.beans.CourseTeacher")
	CourseTeacher getSingleTeacher(int id);
}
