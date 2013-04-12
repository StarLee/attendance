package com.cuc.daos;

import java.util.List;

import com.cuc.beans.DutyWorkload;
import com.develop.data.annotation.SQL;
import com.develop.data.annotation.SQLTYPE;

public interface DutyWorkloadDao
{
	@SQL(sql = "insert into DutyWorkload(ID,Administrator,QuantizationID,BatcherID,Times,Type,Description) values(0,#{administrator},#{quantizationID},#{batcherID},#{times},'#{type}','#{description}')",
			sqlType =SQLTYPE.INSERT,paramType="com.cuc.beans.DutyWorkload")
	public void addNew(DutyWorkload dutyWorkload);
	@SQL(sql = "select ID as id,Administrator as administrator,QuantizationID as quantizationID,BatcherID as batcherID,Times as times,Type as type,Description as description,SubmitTime as submitTime from dutyworkload where Administrator=#{administrator} and BatcherID=#{batcherID} and Type='#{type}'",sqlType =SQLTYPE.SELECT,resultType="com.cuc.beans.DutyWorkload",paramType="com.cuc.beans.DutyWorkload")
	public List getDutyWorkload(DutyWorkload dutyWorkload);
	@SQL(sql = "delete from dutyworkload where ID=#{id}",sqlType =SQLTYPE.DELETE)
	public void deleteByID(int id);
	@SQL(sql = "select ID as id,Administrator as administrator,QuantizationID as quantizationID,BatcherID as batcherID,Times as times,Type as type,Description as description,SubmitTime as submitTime from dutyworkload where ID=#{id}",sqlType =SQLTYPE.SELECT,resultType="com.cuc.beans.DutyWorkload")
	public DutyWorkload getSingleDutyWorkload(int id);
}
