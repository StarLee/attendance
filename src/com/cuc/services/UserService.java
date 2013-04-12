package com.cuc.services;

import com.cuc.beans.User;
import com.cuc.daos.UserDao;
import com.develop.data.base.Query;
import com.develop.data.base.iml.DefaultQuery;
import com.develop.data.result.PageResult;
import com.develop.data.result.PageRow;

public class UserService
{
	private Query query=new DefaultQuery();
	UserDao dao=(UserDao)query.getMapper(UserDao.class);
	public User getSingleUser(int id)
	{
		User user=new User();
		user.setId(id);
		return dao.getSingleUser(user);
	}
	public void updatePassword(int id,String password)
	{
		User user=new User();
		user.setId(id);
		user.setPassword(password);
		dao.changePassword(user);
	}
	
	public PageResult<User> getAll()
	{
		Query query=new DefaultQuery();
		PageRow row=new PageRow(1,50);
		UserDao userDao=(UserDao)query.getMapper(UserDao.class,row);
		return userDao.allUser();
	}
}
