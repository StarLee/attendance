package com.cuc.services;

import java.util.List;

import com.cuc.beans.QuantizationInfo;
import com.cuc.daos.QuantizationInfoMixDao;
import com.develop.data.base.Query;
import com.develop.data.base.iml.DefaultQuery;

public class QuantizationInfoMixService
{
	private Query query=new DefaultQuery();
	private QuantizationInfoMixDao dao=(QuantizationInfoMixDao)query.getMapper(QuantizationInfoMixDao.class);
	
	public List getQuantizationInfoByBatcherType(int id,String type)
	{
		return dao.getInfoByBatcher(id,type);
	}
	public QuantizationInfo getSingle(int id)
	{
		return dao.getInfoByID(id);
	}
}
