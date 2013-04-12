package com.cuc.services;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.cuc.beans.LabRegularWorkload;
import com.cuc.beans.LabToAdmin;
import com.cuc.daos.LabRegularWorkloadDao;
import com.develop.data.base.iml.DefaultQuery;

public class LabRegularWorkloadService
{
	private LabRegularWorkloadDao dao=(LabRegularWorkloadDao)(new DefaultQuery().getMapper(LabRegularWorkloadDao.class));
	public void addNewWorkload(LabRegularWorkload regularWorkload)
	{
		dao.addNew(regularWorkload);
	}
	public List getRegularWorkload(int userID,int batcherID)
	{
		LabToAdminService LAService = new LabToAdminService();
		List<LabToAdmin> labToAdmin=LAService.obtainRelation(userID, batcherID);
		List<LabRegularWorkload> resultList=new ArrayList();
		Iterator<LabToAdmin> it=labToAdmin.iterator();
		while(it.hasNext())
		{
			List<LabRegularWorkload> list=dao.findByLTA(it.next().getId());
			resultList.addAll(list);
		}
		return resultList;
	}
	
	public void deleteByID(int id)
	{
		dao.deleteByID(id);
	}
	public void updateQuan(int id,int quanID)
	{
		LabRegularWorkload reg=new LabRegularWorkload();//最好是从数据中取
		reg.setId(id);
		reg.setQuantizationID(quanID);
		dao.updateQuantization(reg);
	}
}
