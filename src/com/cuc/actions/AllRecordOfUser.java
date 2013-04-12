package com.cuc.actions;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.cuc.beans.Record;
import com.cuc.beans.SessionBean;
import com.cuc.beans.User;
import com.cuc.services.RecordService;
import com.cuc.services.util.TimeCalculate;
import com.develop.actions.statistics.ActionStatistics;
import com.develop.actions.statistics.WebObject;
import com.develop.actions.test.Basic;
/**
 * 用户查询某天的记录
 * @author starlee
 */
public class AllRecordOfUser implements Basic
{

	private String date;
	
	private String hours;
	
	private List<Record> records;
	
	
	private String defaultDate;
	public String execute()
	{
		HttpServletRequest request = (HttpServletRequest) ActionStatistics
				.getInstance().get(WebObject.SERVLETREQUEST);
		HttpSession session= request.getSession();
		User user=((SessionBean)session.getAttribute("user")).getUser();
		//String date=request.getParameter("date");
		RecordService service=new RecordService();
		records=service.userRecords(user.getId(),this.date);
		int len=records.size();
		if(len!=0)
			//request.setAttribute("hours", String.valueOf(TimeCalculate.calculate(list.get(0).getLoginTime(), list.get(len-1).getLoginTime())));
			hours=String.valueOf(TimeCalculate.calculate(records.get(0).getLoginTime(), records.get(len-1).getLoginTime()));
		else
			//request.setAttribute("hours", 0);
			hours="0";
		//request.setAttribute("records", records);
		//request.setAttribute("defaultDate",date);
		return "all";
	}
	public String getHours()
	{
		return hours;
	}
	public List<Record> getRecords()
	{
		return records;
	}
	public String getDefaultDate()
	{
		return defaultDate;
	}
	public void setDate(String date)
	{
		this.date = date;
	}
	public String getDate()
	{
		return date;
	}
	public void setHours(String hours)
	{
		this.hours = hours;
	}
	public void setRecords(List<Record> records)
	{
		this.records = records;
	}
	public void setDefaultDate(String defaultDate)
	{
		this.defaultDate = defaultDate;
	}

}
