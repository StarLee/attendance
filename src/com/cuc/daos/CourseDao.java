package com.cuc.daos;

import java.util.List;

import com.cuc.beans.Course;
import com.develop.data.annotation.SQL;
import com.develop.data.annotation.SQLTYPE;

public interface CourseDao
{
	@SQL(sqlType=SQLTYPE.INSERT,sql="insert into Course(ID,StudentClass,TeacherID,StudyTime,Type,BatcherID,LabID) values(0,'#{studentClass}',#{teacherID},'#{studyTime}','#{type}',#{batcherID},#{labID})")
	void add(Course course);
	@SQL(sqlType=SQLTYPE.SELECT,sql="select ID as id,StudentClass as studentClass,TeacherID as teacherID,StudyTime as studyTime,Type as type,BatcherID as batcherID,LabID as labID FROM Course",resultType="com.cuc.beans.Course")
	List getAll();
	@SQL(sqlType=SQLTYPE.SELECT,sql="select ID as id,StudentClass as studentClass,TeacherID as teacherID,StudyTime as studyTime,Type as type,BatcherID as batcherID,LabID as labID FROM Course where BatcherID=#{batcherID}",resultType="com.cuc.beans.Course")
	List getAllByBatcher(int batcher);
	@SQL(sqlType=SQLTYPE.SELECT,sql="select ID as id,StudentClass as studentClass,TeacherID as teacherID,StudyTime as studyTime,Type as type,BatcherID as batcherID,LabID as labID FROM Course where BatcherID=#{batcherID@1} and LabID=#{labID@2}",resultType="com.cuc.beans.Course")
	List getLabsCourse(int batcher,int lab);
	@SQL(sqlType=SQLTYPE.SELECT,sql="select ID as id,StudentClass as studentClass,TeacherID as teacherID,StudyTime as studyTime,Type as type,BatcherID as batcherID,LabID as labID FROM Course where ID=#{id}",resultType="com.cuc.beans.Course")
	Course get(int id);
}
