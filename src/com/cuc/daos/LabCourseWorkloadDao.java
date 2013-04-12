package com.cuc.daos;

import java.util.List;

import com.cuc.beans.Course;
import com.cuc.beans.LabCourseWorkload;
import com.cuc.beans.LabRegularWorkload;
import com.develop.data.annotation.SQL;
import com.develop.data.annotation.SQLTYPE;

public interface LabCourseWorkloadDao
{
	@SQL(sql = "insert into labCourseWorkload(ID,LabToAdminID,QuantizationID,CourseID) values" +
			"(0,#{labToAdminID},#{quantizationID},#{courseID})", sqlType = SQLTYPE.INSERT,paramType="com.cuc.beans.LabCourseWorkload")
	public void addNew(LabCourseWorkload labCourseWorkload);
	@SQL(sql="select ID as id,LabToAdminID as labToAdminID,QuantizationID as quantizationID,CourseID as courseID,SubmitTime as submitTime from labCourseWorkload where LabToAdminID=#{labToAdminID}",sqlType=SQLTYPE.SELECT,resultType="com.cuc.beans.LabCourseWorkload")
	public List findByLTA(int labToAdminID);
	@SQL(sql="delete from labCourseWorkload where ID=#{id}",sqlType=SQLTYPE.DELETE)
	public void deleteByID(int id);
	@SQL(sqlType=SQLTYPE.UPDATE,sql="update labCourseWorkload set QuantizationID=#{quantizationID} where ID=#{id}",paramType="com.cuc.beans.LabCourseWorkload")
	public void updateQuantization(LabCourseWorkload reg);
	@SQL(sql="select ID as id,LabToAdminID as labToAdminID,QuantizationID as quantizationID,CourseID as courseID,SubmitTime as submitTime from labCourseWorkload where CourseID=#{courseID}",sqlType=SQLTYPE.SELECT,resultType="com.cuc.beans.LabCourseWorkload")
	public LabCourseWorkload findByCourseID(int courseid);
}
