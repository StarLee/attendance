package com.cuc.actions;

import com.cuc.beans.User;
import com.cuc.daos.UserDao;
import com.develop.actions.test.Basic;
import com.develop.data.base.Query;
import com.develop.data.base.iml.DefaultQuery;

public class UpdateUserStatus implements Basic 
{

	private String status;
	private String id;
	public String execute() 
	{
		User user=new User();
		user.setId(Integer.parseInt(id));
		if("0".equals(status))
			status="1";
		else
			status="0";
		user.setStatus(status);
		Query query=new DefaultQuery();
		UserDao userDao=(UserDao)query.getMapper(UserDao.class);
		userDao.changeStatus(user);
		return "ok";
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public void setId(String id) {
		this.id = id;
	}
}
