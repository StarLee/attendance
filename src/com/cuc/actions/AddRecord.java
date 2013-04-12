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
import com.cuc.services.util.TimeCalculate;
import com.develop.actions.statistics.ActionStatistics;
import com.develop.actions.statistics.WebObject;
import com.develop.actions.test.Basic;

public class AddRecord implements Basic
{

	public String execute()
	{

		RecordService service = new RecordService();

		HttpServletRequest request = (HttpServletRequest) ActionStatistics
				.getInstance().get(WebObject.SERVLETREQUEST);

		HttpSession session = request.getSession();
		User user = ((SessionBean) session.getAttribute("user")).getUser();
		if (user == null)
			return "unLogin";
		Record record = new Record();
		SimpleDateFormat formateOne = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat formateTwo = new SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");
		record.setLoginDate(formateOne.format(new Date()).toString());
		record.setLoginTime(formateTwo.format(new Date()).toString());
		record.setUserID(user.getId());
		service.addRecord(record);
		List<Record> list = service.userRecords(user.getId(),
				record.getLoginDate());
		int len = list.size();

		if(len!=0)
			request.setAttribute("hours", String.valueOf(TimeCalculate.calculate(list.get(0).getLoginTime(), list.get(len-1).getLoginTime())));
		else
			request.setAttribute("hours", 0);
		request.setAttribute("records", list);
		request.setAttribute("default", record.getLoginDate());
		return "addSuccess";
	}

}
