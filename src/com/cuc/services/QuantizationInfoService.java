package com.cuc.services;

import java.util.List;

import com.cuc.beans.QuantizationInfo;
import com.cuc.daos.QuantizationInfoDao;
import com.develop.data.base.Query;
import com.develop.data.base.iml.DefaultQuery;

public class QuantizationInfoService
{
	private Query query=new DefaultQuery();
	private QuantizationInfoDao dao=(QuantizationInfoDao)query.getMapper(QuantizationInfoDao.class);
	public void addNewQuantizationInfo(QuantizationInfo info)
	{
		dao.addNewInfo(info);
	}
	public List getQuantizationInfo(int id)
	{
		return dao.getInfoByQuantify(id);
	}
	public List getQuantizationInfoByBatcher(int id)
	{
		return dao.getInfoByBatcher(id);
	}
	public QuantizationInfo getSingle(int id)
	{
		return dao.getInfoByID(id);
	}
	public void updateStandard(QuantizationInfo info)
	{
		dao.update(info);
	}
}
