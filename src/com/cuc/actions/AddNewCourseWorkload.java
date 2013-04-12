package com.cuc.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.cuc.beans.LabCourseWorkload;
import com.cuc.beans.SessionBean;
import com.cuc.services.CourseService;
import com.cuc.services.LabCourseWorkloadService;
import com.develop.actions.statistics.ActionStatistics;
import com.develop.actions.statistics.WebObject;

public class AddNewCourseWorkload
{
	private String labToAdminID;
	private String quantizationID;
	private String courseID;
	private List list;
	private String batcherid;
	private String labid;

	public String execute()
	{
		LabCourseWorkloadService service = new LabCourseWorkloadService();
		LabCourseWorkload workload = new LabCourseWorkload();
		workload.setLabToAdminID(Integer.parseInt(labToAdminID));
		workload.setQuantizationID(Integer.parseInt(quantizationID));
		workload.setCourseID(Integer.parseInt(courseID));
		service.addNewWorkload(workload);
		// HttpServletRequest
		// request=(HttpServletRequest)ActionStatistics.getInstance().get(WebObject.SERVLETREQUEST);
		// SessionBean
		// bean=(SessionBean)request.getSession().getAttribute("user");
		CourseService cservice = new CourseService();
		list = cservice.getLabsCourse(Integer.parseInt(batcherid),
				Integer.parseInt(labid));
		// list=bean.getUser().getRegularWorkloadlist();
		return "ok";
	}

	public void setBatcherid(String batcherid)
	{
		this.batcherid = batcherid;
	}

	public void setLabid(String labid)
	{
		this.labid = labid;
	}

	public List getList()
	{
		return list;
	}

	public void setLabToAdminID(String labToAdminID)
	{
		this.labToAdminID = labToAdminID;
	}

	public void setQuantizationID(String quantizationID)
	{
		this.quantizationID = quantizationID;
	}

	public void setCourseID(String courseID)
	{
		this.courseID = courseID;
	}
}
