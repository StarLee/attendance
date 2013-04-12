package com.cuc.actions;

import java.util.List;

import com.cuc.beans.User;
import com.cuc.services.EquipBorrowWorkloadService;


public class UpdateBorrowWorkload extends UpdateWorkload
{
	@Override
	void update()
	{
		EquipBorrowWorkloadService service=new EquipBorrowWorkloadService();
		service.updateQuan(Integer.parseInt(getId()), Integer.parseInt(getQuantizationid()));
	}

	@Override
	List getReturnList(User user)
	{
		return user.getBorrowWorkloadlist();
	}
}
