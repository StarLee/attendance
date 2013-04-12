package com.cuc.daos;

import java.util.List;

import com.cuc.beans.EquipFixWorkload;
import com.cuc.beans.LabOpenWorkload;
import com.develop.data.annotation.SQL;
import com.develop.data.annotation.SQLTYPE;

public interface EquipFixWorkloadDao
{
	@SQL(sql = "insert into EquipFixWorkload(ID,Administrator,QuantizationID,BreakdownDesc,FixType,BatcherID,FixTime) values(0,#{administrator},#{quantizationID},'#{breakdownDesc}','#{fixType}',#{batcherID},'#{fixTime}')", sqlType = SQLTYPE.INSERT,paramType="com.cuc.beans.EquipFixWorkload")
	public void addNew(EquipFixWorkload equipFixWorkload);
	@SQL(sql = "select ID as id,Administrator as administrator,QuantizationID as quantizationID,BreakdownDesc as breakdownDesc,FixType as fixType,BatcherID as batcherID,FixTime as fixTime from EquipFixWorkload where Administrator=#{administrator} AND BatcherID=#{batcherID}", sqlType = SQLTYPE.SELECT,resultType="com.cuc.beans.EquipFixWorkload", paramType="com.cuc.beans.EquipFixWorkload")
	public List<EquipFixWorkload> getFixWorkload(EquipFixWorkload equipFixWorkload);
	@SQL(sql = "select ID as id,Administrator as administrator,QuantizationID as quantizationID,BreakdownDesc as breakdownDesc,FixType as fixType,BatcherID as batcherID,FixTime as fixTime from EquipFixWorkload where ID=#{id}", sqlType = SQLTYPE.SELECT,resultType="com.cuc.beans.EquipFixWorkload")
	public EquipFixWorkload getSingle(int id);
	@SQL(sql = "delete from EquipFixWorkload where ID=#{id}", sqlType = SQLTYPE.DELETE)
	public void deleteSingle(int id);
	@SQL(sqlType=SQLTYPE.UPDATE,sql="update EquipFixWorkload set QuantizationID=#{quantizationID} where ID=#{id}",paramType="com.cuc.beans.EquipFixWorkload")
	public void updateQuantization(EquipFixWorkload equipFixWorkload);
}
