package com.cuc.services;

import java.util.List;

import com.cuc.beans.LabManageBatcher;
import com.cuc.daos.BatcherDao;
import com.develop.data.base.Query;
import com.develop.data.base.iml.DefaultQuery;

public class LabManagerBatcherService
{
	private Query query=new DefaultQuery();
	private BatcherDao dao=(BatcherDao)query.getMapper(BatcherDao.class);
	public void addNewBatcher(LabManageBatcher batcher)
	{
		if(dao.selectExist(batcher)==null)
			dao.addNewBatcher(batcher);
	}
	public List allBatcher()
	{
		return dao.allBatcher();
	}
	public LabManageBatcher getSingleBatcher(int id)
	{
		return dao.getSingleBatcher(id);
	}
	public void updateStop(int id)
	{
		LabManageBatcher batcher=getSingleBatcher(id);
		batcher.setStatus("1");
		dao.updateStatusByID(batcher);
	}
	public void updateStart(int id)
	{
		LabManageBatcher batcher=getSingleBatcher(id);
		batcher.setStatus("0");
		dao.updateStatusByID(batcher);
	}
}
