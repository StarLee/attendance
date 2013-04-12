package com.cuc.services;

import java.util.List;

import com.cuc.beans.EquipBorrowWorkload;
import com.cuc.beans.EquipFixWorkload;
import com.cuc.daos.EquipFixWorkloadDao;
import com.develop.data.base.iml.DefaultQuery;

public class EquipFixWorkloadService
{
	EquipFixWorkloadDao dao=(EquipFixWorkloadDao)(new DefaultQuery().getMapper(EquipFixWorkloadDao.class));
	public void addNewRecord(EquipFixWorkload equipFixWorkload)
	{
		dao.addNew(equipFixWorkload);
	}
	public List<EquipFixWorkload> getByUserAndBatcher(int userID,int batcherID)
	{
		EquipFixWorkload workload=new EquipFixWorkload();
		workload.setAdministrator(userID);
		workload.setBatcherID(batcherID);
		return dao.getFixWorkload(workload);
	}
	
	public EquipFixWorkload getByID(int id)
	{
		return dao.getSingle(id);
	}
	public void deleteByID(int id)
	{
		dao.deleteSingle(id);
	}
	public void updateQuan(int id,int quanID)
	{
		EquipFixWorkload reg=new EquipFixWorkload();//最好是从数据中取
		reg.setId(id);
		reg.setQuantizationID(quanID);
		dao.updateQuantization(reg);
	}
}
