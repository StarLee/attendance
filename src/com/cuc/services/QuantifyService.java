package com.cuc.services;

import java.util.List;

import com.cuc.beans.Quantify;
import com.cuc.daos.QuantifyDao;
import com.develop.data.base.Query;
import com.develop.data.base.iml.DefaultQuery;

public class QuantifyService
{
	private Query query=new DefaultQuery();
	QuantifyDao dao=(QuantifyDao)query.getMapper(QuantifyDao.class);
	public void addQuantify(Quantify quantify)
	{
		dao.addNewQuantityDao(quantify);
	}
	public List allQuantify()
	{
		return dao.allQuantify();
	}
	public Quantify getSingleQuantify(int id)
	{
		return dao.getSingleQuantify(id);
	}
	
	public void updateQuantify(Quantify quantify)
	{
		dao.updateQuantify(quantify);
	}
}
