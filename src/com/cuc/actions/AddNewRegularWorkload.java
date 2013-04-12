package com.cuc.actions;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.cuc.beans.LabRegularWorkload;
import com.cuc.beans.SessionBean;
import com.cuc.services.LabRegularWorkloadService;
import com.develop.actions.statistics.ActionStatistics;
import com.develop.actions.statistics.WebObject;

public class AddNewRegularWorkload
{
	private String labToAdminID;
	private String[] quantizationID;
	private List list;

	public String execute()
	{
		LabRegularWorkloadService service = new LabRegularWorkloadService();
		for (String quantization : quantizationID)
		{
			LabRegularWorkload workload = new LabRegularWorkload();
			workload.setLabToAdminID(Integer.parseInt(labToAdminID));
			workload.setQuantizationID(Integer.parseInt(quantization));
			service.addNewWorkload(workload);
		}
		HttpServletRequest request=(HttpServletRequest)ActionStatistics.getInstance().get(WebObject.SERVLETREQUEST);
		SessionBean bean=(SessionBean)request.getSession().getAttribute("user");
		list=bean.getUser().getRegularWorkloadlist();
		return "ok";
	}
	public List getList()
	{
		return list;
	}

	public void setLabToAdminID(String labToAdminID)
	{
		this.labToAdminID = labToAdminID;
	}

	public void setQuantizationID(String[] quantizationID)
	{
		this.quantizationID = quantizationID;
	}
}
