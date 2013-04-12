package com.cuc.actions;

import javax.servlet.http.HttpServletRequest;

import com.cuc.beans.SessionBean;
import com.cuc.beans.User;
import com.cuc.services.UserService;
import com.develop.actions.statistics.ActionStatistics;
import com.develop.actions.statistics.WebObject;

public abstract class SessionSuperAdmin
{
	/**
	 * 默认为从session中取出用户，如果用户为超级用户，则根据userID给出指定的用户
	 * @param userID
	 * @return
	 */
	public User isSuperAdmin(String userID)
	{
		HttpServletRequest request=(HttpServletRequest) ActionStatistics.getInstance().get(WebObject.SERVLETREQUEST);
		SessionBean bean=(SessionBean)request.getSession().getAttribute("user");
		User user=bean.getUser();
		if(User.ROLE_TOPMANAGER.equals(user.getPriority())&&userID!=null)
		{
			int userid=Integer.parseInt(userID);
			UserService serv=new UserService();
			//System.out.println("---------------------"+userid);
			user=serv.getSingleUser(userid);
			//System.out.println("+++"+user.getId());
		}
		//System.out.println("---------------------"+user.getId());
		return user;
	}
}
