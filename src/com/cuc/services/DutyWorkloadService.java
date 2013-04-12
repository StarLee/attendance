package com.cuc.services;

import java.util.List;

import com.cuc.beans.DutyWorkload;
import com.cuc.daos.DutyWorkloadDao;
import com.develop.data.base.iml.DefaultQuery;

public class DutyWorkloadService
{
	private DutyWorkloadDao dao=(DutyWorkloadDao)(new DefaultQuery().getMapper(DutyWorkloadDao.class));
	public void addNew(DutyWorkload dutyWorkload)
	{
		dao.addNew(dutyWorkload);
	}
	
	public List getLegalDuty(int userID,int batcherID)
	{
		DutyWorkload workload=new DutyWorkload();
		workload.setAdministrator(userID);
		workload.setBatcherID(batcherID);
		workload.setType("1");
		return dao.getDutyWorkload(workload);
	}
	public List getExtralDuty(int userID,int batcherID)
	{
		DutyWorkload workload=new DutyWorkload();
		workload.setAdministrator(userID);
		workload.setBatcherID(batcherID);
		workload.setType("2");
		return dao.getDutyWorkload(workload);
	}
	
	public void deleteByID(int id)
	{
		dao.deleteByID(id);
	}
	
	public DutyWorkload getSingleDuty(int id)
	{
		return dao.getSingleDutyWorkload(id);
	}
}
