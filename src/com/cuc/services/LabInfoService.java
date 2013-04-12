package com.cuc.services;

import java.util.List;

import com.cuc.beans.LabInfo;
import com.cuc.daos.LabInfoDao;
import com.develop.data.base.Query;
import com.develop.data.base.iml.DefaultQuery;
/**
 * 加入一个新的实验室
 * @author starlee
 *
 */
public class LabInfoService
{
	private Query query=new DefaultQuery();
	private LabInfoDao infoDao= (LabInfoDao)query.getMapper(LabInfoDao.class);
	public void addALab(LabInfo labInfo)
	{
		infoDao.addLabInfo(labInfo);
	}
	
	public List allLab()
	{
		return infoDao.allLab();
	}
	
	public LabInfo getSingleLab(int labID)
	{
		return infoDao.getLab(labID);
	}
}
