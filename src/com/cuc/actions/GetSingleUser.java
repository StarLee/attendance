package com.cuc.actions;

import java.util.List;

import com.cuc.beans.User;
import com.cuc.services.LabManagerBatcherService;
import com.cuc.services.LabToAdminService;
import com.cuc.services.UserService;
/**
 * 根据ID获取用户
 * @author starlee
 *
 */
public class GetSingleUser
{
	private String id;
	private User user;
	private List allBatchers;
	private List allLabToAdmin;
	public void setId(String id)
	{
		this.id = id;
	}
	public String execute()
	{
		UserService service=new UserService();
		LabManagerBatcherService labService=new LabManagerBatcherService();
		allBatchers=labService.allBatcher();
		user=service.getSingleUser(Integer.parseInt(id));
		
		LabToAdminService labToAdminService=new LabToAdminService();
		allLabToAdmin=labToAdminService.obtainAdminsLab(user.getId());		
		return "ok";
	}
	public List getAllLabToAdmin()
	{
		return allLabToAdmin;
	}
	public User getUser()
	{
		return user;
	}
	
	public List getAllBatchers()
	{
		return allBatchers;
	}
}
