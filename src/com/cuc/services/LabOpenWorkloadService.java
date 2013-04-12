package com.cuc.services;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.cuc.beans.LabOpenWorkload;
import com.cuc.beans.LabRegularWorkload;
import com.cuc.beans.LabToAdmin;
import com.cuc.daos.LabOpenWorkloadDao;
import com.develop.data.base.iml.DefaultQuery;

public class LabOpenWorkloadService
{
	LabOpenWorkloadDao dao = (LabOpenWorkloadDao) (new DefaultQuery()
			.getMapper(LabOpenWorkloadDao.class));

	public void addNewRecord(LabOpenWorkload labOpenWorkload)
	{
		dao.addNew(labOpenWorkload);
	}

	public List<LabOpenWorkload> getByLabToAdmin(int userID, int batcherID)
	{
		LabToAdminService LAService = new LabToAdminService();
		List<LabToAdmin> labToAdmin = LAService.obtainRelation(userID,
				batcherID);
		List<LabOpenWorkload> resultList = new ArrayList();
		Iterator<LabToAdmin> it = labToAdmin.iterator();
		while (it.hasNext())
		{
			List<LabOpenWorkload> list = dao.getList(it.next().getId());
			resultList.addAll(list);
		}
		return resultList;
	}

	public LabOpenWorkload getSingle(int id)
	{
		return dao.getSingle(id);
	}
	
	public void deleteByID(int id)
	{
		dao.deleteSingle(id);
	}
	public void updateQuan(int id,int quanID)
	{
		LabOpenWorkload reg=new LabOpenWorkload();//最好是从数据中取
		reg.setId(id);
		reg.setQuantizationID(quanID);
		dao.updateQuantization(reg);
	}
}
