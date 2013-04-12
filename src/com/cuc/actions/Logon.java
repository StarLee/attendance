package com.cuc.actions;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.cuc.beans.Record;
import com.cuc.beans.SessionBean;
import com.cuc.beans.User;
import com.cuc.services.RecordService;
import com.cuc.services.UserLogon;
import com.cuc.services.util.TimeCalculate;
import com.develop.actions.statistics.ActionStatistics;
import com.develop.actions.statistics.WebObject;
import com.develop.actions.test.Basic;

public class Logon implements Basic
{

	private String userName;
	private String password;
	
	private String id;
	public String execute()
	{
		UserLogon logon = new UserLogon();
		HttpServletRequest request = (HttpServletRequest) ActionStatistics
				.getInstance().get(WebObject.SERVLETREQUEST);
		HttpSession session = request.getSession();
		
		User user = new User();
				
		user.setPassword(password);
		user.setUserName(userName);
		if (logon.checkUser(user, session))
		{
			SessionBean sessionBean=(SessionBean) session.getAttribute("user");
			if(sessionBean==null)
				return "fail";
			user = sessionBean.getUser();
			RecordService record=new RecordService();
			SimpleDateFormat formateOne=new SimpleDateFormat("yyyy-MM-dd");
			List<Record> list=record.userRecords(user.getId(),formateOne.format(new Date()));
			int len=list.size();
			
			if(len!=0)
				request.setAttribute("hours", String.valueOf(TimeCalculate.calculate(list.get(0).getLoginTime(), list.get(len-1).getLoginTime())));
			else
				request.setAttribute("hours", 0);
			request.setAttribute("records", list);
			request.setAttribute("default", formateOne.format(new Date()));
			if (user.getPriority().trim().equals("0"))
				return "super";
			else
				return "user";
		}
		return "fail";
	}
	public void setUserName(String userName)
	{
		this.userName = userName;
	}
	public void setPassword(String password)
	{
		this.password = password;
	}
	public String getId()
	{
		return id;
	}
	public void setId(String id)
	{
		this.id = id;
	}
	public String getUserName()
	{
		return userName;
	}
	public String getPassword()
	{
		return password;
	}

}
