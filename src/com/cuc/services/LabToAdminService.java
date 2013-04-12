package com.cuc.services;

import java.util.List;

import com.cuc.beans.LabToAdmin;
import com.cuc.daos.LabToAdminDao;
import com.develop.data.base.Query;
import com.develop.data.base.iml.DefaultQuery;

public class LabToAdminService
{
	private Query query = new DefaultQuery();
	private LabToAdminDao dao = (LabToAdminDao) query
			.getMapper(LabToAdminDao.class);

	public void addNewRelation(LabToAdmin labToAdmin)
	{
		if(dao.hasRelated(labToAdmin)==null)//重复的不允许录入
			dao.addNewRelation(labToAdmin);
	}
	
	public LabToAdmin delete(int id)
	{
		LabToAdmin labToAdmin=dao.getSingle(id);
		if(labToAdmin!=null)
			dao.delete(id);
		return labToAdmin;
	}
	public List obtainRelation(int adminID,int batcherID)
	{
		LabToAdmin labToAdmin=new LabToAdmin();
		labToAdmin.setAdminID(adminID);
		labToAdmin.setBatcherID(batcherID);
		return dao.obtainFromAdminPoint(labToAdmin);
	}
	public List obtainAdminsLab(int adminID)
	{
		LabToAdmin labToAdmin=new LabToAdmin();
		labToAdmin.setAdminID(adminID);
		return dao.obtainFromAdmin(labToAdmin);
	}
	public LabToAdmin getSingleRecord(int id)
	{
		return dao.getSingle(id);
	}
}
