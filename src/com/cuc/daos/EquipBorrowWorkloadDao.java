package com.cuc.daos;

import java.util.List;

import com.cuc.beans.EquipBorrowWorkload;
import com.cuc.beans.LabOpenWorkload;
import com.develop.data.annotation.SQL;
import com.develop.data.annotation.SQLTYPE;

public interface EquipBorrowWorkloadDao
{
	@SQL(sql = "insert into EquipBorrowWorkload(ID,Administrator,QuantizationID,EquipmentName,BorrowTime,BatcherID,BorrowMan) values(0,#{administrator},#{quantizationID},'#{equipmentName}','#{borrowTime}',#{batcherID},'#{borrowMan}')", sqlType = SQLTYPE.INSERT,paramType="com.cuc.beans.EquipBorrowWorkload")
	public void addNew(EquipBorrowWorkload equipBorrowWorkload);
	@SQL(sql = "select ID as id,Administrator as administrator,QuantizationID as quantizationID,EquipmentName as equipmentName,BorrowTime as borrowTime,BatcherID as batcherID,BorrowMan as borrowMan  from EquipBorrowWorkload where Administrator=#{administrator} and BatcherID=#{batcherID}", sqlType = SQLTYPE.SELECT,resultType="com.cuc.beans.EquipBorrowWorkload",paramType="com.cuc.beans.EquipBorrowWorkload")
	public List<EquipBorrowWorkload> getBorrowWorkload(EquipBorrowWorkload equipBorrowWorkload);
	@SQL(sql = "select ID as id,Administrator as administrator,QuantizationID as quantizationID,EquipmentName as equipmentName,BorrowTime as borrowTime,BatcherID as batcherID,BorrowMan as borrowMan  from EquipBorrowWorkload where ID=#{id}", sqlType = SQLTYPE.SELECT,resultType="com.cuc.beans.EquipBorrowWorkload")
	public EquipBorrowWorkload getSingle(int id);
	@SQL(sql = "delete from EquipBorrowWorkload where ID=#{id}", sqlType = SQLTYPE.DELETE)
	public void deleteSingle(int id);
	@SQL(sqlType=SQLTYPE.UPDATE,sql="update EquipBorrowWorkload set QuantizationID=#{quantizationID} where ID=#{id}",paramType="com.cuc.beans.EquipBorrowWorkload")
	public void updateQuantization(EquipBorrowWorkload equipBorrowWorkload);
}
