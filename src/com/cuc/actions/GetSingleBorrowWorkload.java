package com.cuc.actions;

import com.cuc.beans.EquipBorrowWorkload;
import com.cuc.services.EquipBorrowWorkloadService;

public class GetSingleBorrowWorkload
{
	private String id;
	private EquipBorrowWorkload borrowWorkload;
	public void setId(String id)
	{
		this.id = id;
	}
	public String execute()
	{
		EquipBorrowWorkloadService service=new EquipBorrowWorkloadService();
		borrowWorkload=service.getByID(Integer.parseInt(id));
		return "ok";
	}
	public EquipBorrowWorkload getBorrowWorkload()
	{
		return borrowWorkload;
	}
}
