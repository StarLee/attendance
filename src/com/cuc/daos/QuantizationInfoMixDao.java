package com.cuc.daos;

import java.util.List;

import com.cuc.beans.QuantizationInfo;
import com.develop.data.annotation.SQL;
import com.develop.data.annotation.SQLTYPE;

public interface QuantizationInfoMixDao
{
	@SQL(sql="select ID as id,QuantifyID as quantifyID,Standard as standard,Unit as unit,BatcherID as batcherID,QuantifyName as quantifyName,QuantifyType as quantifyType from quantizationinfomix where BatcherID=#{batcherID@1} and QuantifyType='#{type@2}'",sqlType=SQLTYPE.SELECT,resultType="com.cuc.beans.QuantizationInfoMix")
	public List getInfoByBatcher(int bid,String type);
	@SQL(sql="select ID as id,QuantifyID as quantifyID,Standard as standard,Unit as unit,BatcherID as batcherID,QuantifyName as quantifyName,QuantifyType as quantifyType from quantizationinfomix where ID=#{id}",sqlType=SQLTYPE.SELECT,resultType="com.cuc.beans.QuantizationInfoMix")
	public QuantizationInfo getInfoByID(int id);
}
