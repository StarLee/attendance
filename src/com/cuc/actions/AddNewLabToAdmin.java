package com.cuc.actions;

import java.util.ArrayList;
import java.util.List;

import com.cuc.beans.LabToAdmin;
import com.cuc.services.LabToAdminService;
/**
 * 增加一个新的关系（实验室管理员与实验室）
 * @author starlee
 *
 */
public class AddNewLabToAdmin
{
	private String adminID;
	private String batcherID;
	private List list;
	public List getList()
	{
		return list;
	}
	public void setAdminID(String adminID)
	{
		this.adminID = adminID;
	}
	public void setBatcherID(String batcherID)
	{
		this.batcherID = batcherID;
	}
	
	public void setLabID(String[] labID)
	{
		this.labID = labID;
	}

	private String[] labID;
	public String execute()
	{
		LabToAdmin admin=new LabToAdmin();
		for(String labID:this.labID)
		{
			admin.setAdminID(Integer.parseInt(adminID));
			admin.setBatcherID(Integer.parseInt(batcherID));
			admin.setLabId(Integer.parseInt(labID));
			LabToAdminService service=new LabToAdminService();
			service.addNewRelation(admin);
			list=service.obtainRelation(Integer.parseInt(adminID), Integer.parseInt(batcherID));
		}
		return "ok";
	}
}
