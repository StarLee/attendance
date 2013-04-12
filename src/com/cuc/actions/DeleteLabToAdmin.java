package com.cuc.actions;

import com.cuc.beans.LabToAdmin;
import com.cuc.services.LabToAdminService;
import com.develop.actions.test.Basic;

public class DeleteLabToAdmin implements Basic
{
	private String id;

	public void setId(String id)
	{
		this.id = id;
	}

	private String adminID;
	public String getAdminID()
	{
		return adminID;
	}
	public String execute()
	{
		LabToAdminService service=new LabToAdminService();
		LabToAdmin labToAdmin= service.delete(Integer.parseInt(id));
		adminID=String.valueOf(labToAdmin.getAdminID());
		return "ok";
	}
	
}
