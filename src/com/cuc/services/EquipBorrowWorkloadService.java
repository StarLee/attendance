package com.cuc.services;

import java.util.List;

import com.cuc.beans.EquipBorrowWorkload;
import com.cuc.beans.LabOpenWorkload;
import com.cuc.daos.EquipBorrowWorkloadDao;
import com.develop.data.base.iml.DefaultQuery;

public class EquipBorrowWorkloadService
{
	EquipBorrowWorkloadDao dao=(EquipBorrowWorkloadDao)(new DefaultQuery().getMapper(EquipBorrowWorkloadDao.class));
	public void addNewRecord(EquipBorrowWorkload equipBorrowWorkload)
	{
		dao.addNew(equipBorrowWorkload);
	}
	
	public List<EquipBorrowWorkload> getByUserAndBatcher(int userID,int batcherID)
	{
		EquipBorrowWorkload workload=new EquipBorrowWorkload();
		workload.setAdministrator(userID);
		workload.setBatcherID(batcherID);
		return dao.getBorrowWorkload(workload);
	}
	
	public EquipBorrowWorkload getByID(int id)
	{
		return dao.getSingle(id);
	}
	
	public void deleteByID(int id)
	{
		dao.deleteSingle(id);
	}
	public void updateQuan(int id,int quanID)
	{
		EquipBorrowWorkload reg=new EquipBorrowWorkload();//最好是从数据中取
		reg.setId(id);
		reg.setQuantizationID(quanID);
		dao.updateQuantization(reg);
	}
}
