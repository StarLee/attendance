package com.cuc.actions;

import org.apache.log4j.Logger;

import com.cuc.beans.User;
import com.cuc.daos.UserDao;
import com.develop.data.base.Query;
import com.develop.data.base.iml.DefaultQuery;
/**
 * 增加用户
 * @author starlee
 *
 */
public class AddUser
{
	private Logger log=Logger.getLogger(this.getClass());
	private String userName;
	private String workNum;
	private String type;
	private String name;
	public String execute()
	{
		Query query=new DefaultQuery();
		UserDao userDao=(UserDao)query.getMapper(UserDao.class);
		User user=new User();
		user.setUserName(userName);
		user.setPassword("123456");
		System.out.println("++++++========================="+name);
		user.setName(name);
		user.setStatus("0");
		user.setWorkNum(workNum);
		user.setPriority("0");
		user.setType(type);
		try
		{
		userDao.addUser(user);
		}
		catch (Exception e) {
			log.info(e.getMessage());
			return "failure";
		}
		return "ok";
	}
	public String getUserName()
	{
		return userName;
	}
	public void setUserName(String userName)
	{
		this.userName = userName;
	}
	public void setWorkNum(String workNum)
	{
		this.workNum = workNum;
	}
	public void setType(String type)
	{
		this.type = type;
	}
	public void setName(String name)
	{
		this.name = name;
	}
}
