package com.cuc.services;

import javax.servlet.http.HttpSession;

import com.cuc.beans.SessionBean;
import com.cuc.beans.User;
import com.cuc.daos.UserDao;
import com.develop.data.base.iml.DefaultQuery;

public class UserLogon 
{
	/**
	 * ∂¡»°”√ªß
	 * @param userName
	 * @return
	 */
	public User readUser(String userName)
	{
		DefaultQuery query=new DefaultQuery();
		UserDao user=(UserDao)query.getMapper(UserDao.class);
		return user.getUser(userName);
	}
	
	public boolean checkUser(User user,HttpSession session)
	{
		
		String userName=user.getUserName();
		User userFromData=readUser(userName);
		String psFromData=userFromData.getPassword();
		String psFromRequest=user.getPassword();
		try
		{
			if(psFromData.trim().equals(psFromRequest.trim()))
			{
				session.setAttribute("user",new SessionBean(userFromData));
				return true;
			}
			else
				return false;
		}
		catch (Exception e) {
			return false;
		}
				
	}
}
