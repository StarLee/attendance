package com.cuc.daos;

import java.util.List;

import com.cuc.beans.LabToAdmin;
import com.develop.data.annotation.SQL;
import com.develop.data.annotation.SQLTYPE;

public interface LabToAdminDao
{
	@SQL(sql="insert into LabToAdmin(ID,LabID,AdminID,BatcherID) values(0,#{labId},#{adminID},#{batcherID})",paramType="com.cuc.beans.LabToAdmin",sqlType=SQLTYPE.INSERT)
	public void addNewRelation(LabToAdmin labToAdmin);
	@SQL(sql = "select ID as id,LabID as labId,AdminID as adminID,BatcherID as batcherID from LabToAdmin where BatcherID=#{batcherID} and AdminID=#{adminID}", sqlType = SQLTYPE.SELECT,paramType="com.cuc.beans.LabToAdmin",resultType="com.cuc.beans.LabToAdmin")
	public List obtainFromAdminPoint(LabToAdmin labToAdmin);
	
	@SQL(sql = "select ID as id,LabID as labId,AdminID as adminID,BatcherID as batcherID from LabToAdmin where BatcherID=#{batcherID} and LabID=#{labId} and AdminID=#{adminID}", sqlType = SQLTYPE.SELECT,paramType="com.cuc.beans.LabToAdmin",resultType="com.cuc.beans.LabToAdmin")
	public LabToAdmin hasRelated(LabToAdmin labToAdmin);
	
	@SQL(sql = "select ID as id,LabID as labId,AdminID as adminID,BatcherID as batcherID from LabToAdmin where AdminID=#{adminID}", sqlType = SQLTYPE.SELECT,paramType="com.cuc.beans.LabToAdmin",resultType="com.cuc.beans.LabToAdmin")
	public List obtainFromAdmin(LabToAdmin labToAdmin);
	@SQL(sql = "select ID as id,LabID as labId,AdminID as adminID,BatcherID as batcherID from LabToAdmin where ID=#{id}", sqlType = SQLTYPE.SELECT,resultType="com.cuc.beans.LabToAdmin")
	public LabToAdmin getSingle(int id);
	@SQL(sql = "delete from LabToAdmin where ID=#{id}", sqlType = SQLTYPE.DELETE)
	public LabToAdmin delete(int id);
}
