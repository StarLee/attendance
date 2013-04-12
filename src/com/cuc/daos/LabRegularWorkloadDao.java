package com.cuc.daos;

import java.util.List;

import com.cuc.beans.LabRegularWorkload;
import com.develop.data.annotation.SQL;
import com.develop.data.annotation.SQLTYPE;

public interface LabRegularWorkloadDao
{
	@SQL(sql = "insert into labRegularWorkload(ID,LabToAdminID,QuantizationID,Description) values" +
			"(0,#{labToAdminID},#{quantizationID},'#{description}')", sqlType = SQLTYPE.INSERT,paramType="com.cuc.beans.LabRegularWorkload")
	public void addNew(LabRegularWorkload labRegularWorkload);
	@SQL(sql="select ID as id,LabToAdminID as labToAdminID,QuantizationID as quantizationID,Description as description,SubmitTime as submitTime from labRegularWorkload where LabToAdminID=#{labToAdminID}",sqlType=SQLTYPE.SELECT,resultType="com.cuc.beans.LabRegularWorkload")
	public List findByLTA(int labToAdminID);
	@SQL(sql="delete from labRegularWorkload where ID=#{id}",sqlType=SQLTYPE.DELETE)
	public void deleteByID(int id);
	@SQL(sqlType=SQLTYPE.UPDATE,sql="update labRegularWorkload set QuantizationID=#{quantizationID} where ID=#{id}",paramType="com.cuc.beans.LabRegularWorkload")
	public void updateQuantization(LabRegularWorkload labRegularWorkload);
}
