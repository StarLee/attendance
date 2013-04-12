package com.cuc.beans;

import com.cuc.services.LabInfoService;
import com.cuc.services.LabManagerBatcherService;
import com.cuc.services.UserService;
/**
 * 实验室与管理员的映射关系
 * @author starlee
 *
 */
public class LabToAdmin
{
	private int id;
	private int labId;
	private int adminID;
	private int batcherID;
	private User user;//对应adminID
	private LabManageBatcher batcher;//对应batcherID
	private LabInfo lab;
	public LabInfo getLab()
	{
		LabInfoService service=new LabInfoService();
		lab=service.getSingleLab(labId);
		return lab;
	}
	public User getUser()
	{
		UserService service=new UserService();
		user=service.getSingleUser(adminID);
		return user;
	}
	public LabManageBatcher getBatcher()
	{
		LabManagerBatcherService service=new LabManagerBatcherService();
		batcher=service.getSingleBatcher(batcherID);
		return batcher;
	}
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public int getLabId()
	{
		return labId;
	}
	public void setLabId(int labId)
	{
		this.labId = labId;
	}
	public int getAdminID()
	{
		return adminID;
	}
	public void setAdminID(int adminID)
	{
		this.adminID = adminID;
	}
	public int getBatcherID()
	{
		return batcherID;
	}
	public void setBatcherID(int batcherID)
	{
		this.batcherID = batcherID;
	}
}
