package com.cuc.beans;
/**
 * 对于一个用户应该统一管理的session信息
 * @author starlee
 *
 */
public class SessionBean
{
	private User user;

	public SessionBean(User user)
	{
		this.user=user;
	}
	
	public User getUser()
	{
		return user;
	}

	
	
}
