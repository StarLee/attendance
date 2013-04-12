package com.cuc.daos;

import java.util.List;

import com.cuc.beans.LabOpenWorkload;
import com.develop.data.annotation.SQL;
import com.develop.data.annotation.SQLTYPE;

public interface LabOpenWorkloadDao
{
	@SQL(sql = "insert into LabOpenWorkload(ID,LabToAdminID,QuantizationID,OpenContent,AttendStudentNum,OpenTime) values(0,#{labToAdminID},#{quantizationID},'#{openContent}',#{attendStudentNum},'#{openTime}')", sqlType = SQLTYPE.INSERT,paramType="com.cuc.beans.LabOpenWorkload")
	public void addNew(LabOpenWorkload labOpenWorkload);
	@SQL(sql = "select ID as id,LabToAdminID as labToAdminID,QuantizationID as quantizationID,OpenContent as openContent,AttendStudentNum as attendStudentNum,OpenTime as openTime from LabOpenWorkload where LabToAdminID=#{labToAdminID}", sqlType = SQLTYPE.SELECT,resultType="com.cuc.beans.LabOpenWorkload")
	public List<LabOpenWorkload> getList(int relateID);
	@SQL(sql = "select ID as id,LabToAdminID as labToAdminID,QuantizationID as quantizationID,OpenContent as openContent,AttendStudentNum as attendStudentNum,OpenTime as openTime from LabOpenWorkload where ID=#{id}", sqlType = SQLTYPE.SELECT,resultType="com.cuc.beans.LabOpenWorkload")
	public LabOpenWorkload getSingle(int id);
	@SQL(sql = "delete from LabOpenWorkload where ID=#{id}", sqlType = SQLTYPE.DELETE)
	public void deleteSingle(int id);
	@SQL(sqlType=SQLTYPE.UPDATE,sql="update LabOpenWorkload set QuantizationID=#{quantizationID} where ID=#{id}",paramType="com.cuc.beans.LabOpenWorkload")
	public void updateQuantization(LabOpenWorkload labOpenWorkload);
}
