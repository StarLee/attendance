package com.cuc.actions;

import com.cuc.beans.EquipBorrowWorkload;
import com.cuc.beans.EquipFixWorkload;
import com.cuc.services.EquipFixWorkloadService;

public class GetSingleFixBorrowWorkload
{
	private String id;
	private EquipFixWorkload fixWorkload;
	public void setId(String id)
	{
		this.id = id;
	}
	public String execute()
	{
		EquipFixWorkloadService service=new EquipFixWorkloadService();
		fixWorkload=service.getByID(Integer.parseInt(id));
		return "ok";
	}
	public EquipFixWorkload getFixWorkload()
	{
		return fixWorkload;
	}
	
}
