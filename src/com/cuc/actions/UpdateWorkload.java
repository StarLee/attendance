package com.cuc.actions;

import java.util.List;

import com.cuc.beans.User;
import com.cuc.services.LabRegularWorkloadService;

public abstract class UpdateWorkload extends SessionSuperAdmin
{
	private String id;//工作量id
	private String quantizationid;//量化id
	private String userID;//用户userID
	private String batcherID;
	private List list;
	public List getList()
	{
		return list;
	}
	public String getId()
	{
		return id;
	}
	public void setId(String id)
	{
		this.id = id;
	}
	public String getQuantizationid()
	{
		return quantizationid;
	}
	public void setQuantizationid(String quantizationid)
	{
		this.quantizationid = quantizationid;
	}
	public String getUserID()
	{
		return userID;
	}
	public void setUserID(String userID)
	{
		this.userID = userID;
	}
	public String getBatcherID()
	{
		return batcherID;
	}
	public void setBatcherID(String batcherID)
	{
		this.batcherID = batcherID;
	}
	
	public String execute()
	{
		//LabRegularWorkloadService service=new LabRegularWorkloadService();
		//service.deleteByID(Integer.parseInt(id));
		//System.out.println("===="+id);
		//System.out.println("===++"+quantizationid);
		update();
		User user = isSuperAdmin(userID);
		if(batcherID!=null)
			user.setBatcherID(Integer.parseInt(batcherID));
		list=getReturnList(user);
		return "ok";
	}
	
	abstract void update();
	abstract List getReturnList(User user);
}
