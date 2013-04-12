package com.cuc.beans;
/**
 * ¼ÇÂ¼Ê±¼ä
 * @author starlee
 *
 */
public class Record
{
	private int id;
	private int userID;
	private String loginDate;
	private String loginTime;
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public int getUserID()
	{
		return userID;
	}
	public void setUserID(int userID)
	{
		this.userID = userID;
	}
	public String getLoginDate()
	{
		return loginDate;
	}
	public void setLoginDate(String loginDate)
	{
		this.loginDate = loginDate;
	}
	public String getLoginTime()
	{
		return loginTime;
	}
	public void setLoginTime(String loginTime)
	{
		this.loginTime = loginTime;
	}
}
