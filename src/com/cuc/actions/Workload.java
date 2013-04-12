package com.cuc.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.cuc.beans.LabManageBatcher;
import com.cuc.beans.SessionBean;
import com.cuc.services.LabManagerBatcherService;
import com.cuc.services.LabToAdminService;
import com.develop.actions.statistics.ActionStatistics;
import com.develop.actions.statistics.WebObject;

/**
 * 工作量的核心处理类
 * 
 * @author starlee
 * 
 */
public class Workload
{
	private String batcherID;
	private List labs;
	private LabManageBatcher batcher;

	public void setBatcherID(String batcherID)
	{
		this.batcherID = batcherID;
	}

	public String execute()
	{
		HttpServletRequest http = (HttpServletRequest) ActionStatistics
				.getInstance().get(WebObject.SERVLETREQUEST);
		SessionBean sessionBean = (SessionBean) http.getSession().getAttribute(
				"user");
		int userID = sessionBean.getUser().getId();
		LabToAdminService LAService = new LabToAdminService();
		LabManagerBatcherService LBService=new LabManagerBatcherService();
		labs=LAService.obtainRelation(userID, Integer.parseInt(batcherID));
		batcher=LBService.getSingleBatcher(Integer.parseInt(batcherID));
		sessionBean.getUser().setBatcherID(Integer.parseInt(batcherID));
		return "ok";
	}

	public List getLabs()
	{
		return labs;
	}
	public LabManageBatcher getBatcher()
	{
		return batcher;
	}
}
