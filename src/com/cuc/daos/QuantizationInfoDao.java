package com.cuc.daos;

import java.util.List;

import com.cuc.beans.QuantizationInfo;
import com.develop.data.annotation.SQL;
import com.develop.data.annotation.SQLTYPE;

public interface QuantizationInfoDao
{
	@SQL(sql = "insert into quantizationInfo(ID,QuantifyID,Standard,Unit,BatcherID) values(0,#{quantifyID},'#{standard}','#{unit}',#{batcherID})", sqlType = SQLTYPE.INSERT,paramType="com.cuc.beans.QuantizationInfo")
	public void addNewInfo(QuantizationInfo quantizationInfo);
	@SQL(sql="select ID as id,QuantifyID as quantifyID,Standard as standard,Unit as unit,BatcherID as batcherID from quantizationinfo where QuantifyID=#{quantifyID}",sqlType=SQLTYPE.SELECT,resultType="com.cuc.beans.QuantizationInfo")
	public List getInfoByQuantify(int id);
	@SQL(sql="select ID as id,QuantifyID as quantifyID,Standard as standard,Unit as unit,BatcherID as batcherID from quantizationinfo where BatcherID=#{batcherID}",sqlType=SQLTYPE.SELECT,resultType="com.cuc.beans.QuantizationInfo")
	public List getInfoByBatcher(int id);
	@SQL(sql="select ID as id,QuantifyID as quantifyID,Standard as standard,Unit as unit,BatcherID as batcherID from quantizationinfo where ID=#{id}",sqlType=SQLTYPE.SELECT,resultType="com.cuc.beans.QuantizationInfo")
	public QuantizationInfo getInfoByID(int id);
	@SQL(sql="update quantizationinfo set Standard ='#{standard}' where ID=#{id}",sqlType=SQLTYPE.UPDATE,paramType="com.cuc.beans.QuantizationInfo")
	public QuantizationInfo update(QuantizationInfo quantizationInfo);
}
