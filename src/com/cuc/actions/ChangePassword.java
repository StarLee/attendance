package com.cuc.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.cuc.beans.SessionBean;
import com.cuc.services.UserService;
import com.develop.actions.statistics.ActionStatistics;
import com.develop.actions.statistics.WebObject;

/**
 * �û��޸�����
 * 
 * @author starlee
 * 
 */
public class ChangePassword
{
	private String password;
	private String origin;
	private String comfirm;
	private String message;

	public void setPassword(String password)
	{
		this.password = password;
	}

	public String execute()
	{
		HttpServletRequest request = (HttpServletRequest) ActionStatistics
				.getInstance().get(WebObject.SERVLETREQUEST);
		HttpSession session = request.getSession();
		SessionBean bean = (SessionBean) session.getAttribute("user");

		if (password == null || !password.equals(comfirm))
		{
			message = "���벻һ��";
			if (bean.getUser().getPriority().equals("0"))
				return "mfail";
			else
				return "cfail";
		}

		if (!bean.getUser().getPassword().trim().equals(origin))
		{
			message = "ԭʼ�������";
			if (bean.getUser().getPriority().equals("0"))
				return "mfail";
			else
				return "cfail";
		}

		UserService service = new UserService();

		service.updatePassword(bean.getUser().getId(), password);

		message = "������ʾ�������޸ĳɹ�";
		if (bean.getUser().getPriority().equals("0"))
		{
			return "mok";
		}
		return "uok";

	}

	public String getMessage()
	{
		return message;
	}

	public void setOrigin(String origin)
	{
		this.origin = origin;
	}

	public void setComfirm(String comfirm)
	{
		this.comfirm = comfirm;
	}
}
