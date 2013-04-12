package com.cuc.daos;

import java.util.List;

import com.cuc.beans.LabManageBatcher;
import com.develop.data.annotation.SQL;
import com.develop.data.annotation.SQLTYPE;

public interface BatcherDao
{
	@SQL(sql = "insert into labmanagebatcher(ID,Year,Semester,Status) values(0,'#{year}','#{semester}','0')", sqlType = SQLTYPE.INSERT, paramType = "com.cuc.beans.LabManageBatcher")
	public void addNewBatcher(LabManageBatcher batcher);
	@SQL(sql="select ID as id,Year as year,Semester as semester,Status as status from labmanagebatcher order by id desc",sqlType=SQLTYPE.SELECT,resultType="com.cuc.beans.LabManageBatcher")
	public List allBatcher();
	@SQL(sql ="select ID as id,Year as year,Semester as semester,Status as status from labmanagebatcher where ID=#{id} order by id desc",sqlType=SQLTYPE.SELECT,resultType="com.cuc.beans.LabManageBatcher")
	public LabManageBatcher getSingleBatcher(int id);
	@SQL(sql = "update labmanagebatcher set Status='#{status}' where ID=#{id}", sqlType = SQLTYPE.UPDATE,paramType="com.cuc.beans.LabManageBatcher")
	public void updateStatusByID(LabManageBatcher batcher);
	@SQL(sql = "select ID as id,Year as year,Semester as semester,Status as status from labmanagebatcher where Semester='#{semester}' and Year='#{year}'", sqlType = SQLTYPE.SELECT,resultType="com.cuc.beans.LabManageBatcher",paramType="com.cuc.beans.LabManageBatcher")
	public LabManageBatcher selectExist(LabManageBatcher batcher);
	
}
