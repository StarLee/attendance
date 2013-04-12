package com.cuc.services;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.cuc.beans.Course;
import com.cuc.beans.LabCourseWorkload;
import com.cuc.beans.LabRegularWorkload;
import com.cuc.beans.LabToAdmin;
import com.cuc.daos.LabCourseWorkloadDao;
import com.develop.data.base.iml.DefaultQuery;

public class LabCourseWorkloadService
{
	private LabCourseWorkloadDao dao=(LabCourseWorkloadDao)(new DefaultQuery().getMapper(LabCourseWorkloadDao.class));
	public void addNewWorkload(LabCourseWorkload courseWorkload)
	{
		dao.addNew(courseWorkload);
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
		LabCourseWorkload reg=new LabCourseWorkload();//最好是从数据中取
		reg.setId(id);
		reg.setQuantizationID(quanID);
		dao.updateQuantization(reg);
	}
	public LabCourseWorkload getByCourse(int courseID)
	{
		return dao.findByCourseID(courseID);
	}
}
