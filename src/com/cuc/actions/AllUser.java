package com.cuc.actions;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.cuc.daos.UserDao;
import com.develop.actions.test.Basic;
import com.develop.data.base.Query;
import com.develop.data.base.iml.DefaultQuery;
import com.develop.data.result.PageResult;
import com.develop.data.result.PageRow;

public class AllUser implements Basic 
{
	private PageResult list;
	public PageResult getList() {
		return list;
	}
	public String execute() {
		Query query=new DefaultQuery();
		PageRow row=new PageRow(1,20);
		UserDao userDao=(UserDao)query.getMapper(UserDao.class,row);
		list=userDao.allUser();
		return "ok";
	}
	
}
