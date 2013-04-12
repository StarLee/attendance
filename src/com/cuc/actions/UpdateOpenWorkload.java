package com.cuc.actions;

import java.util.List;

import com.cuc.beans.User;
import com.cuc.services.LabOpenWorkloadService;


public class UpdateOpenWorkload extends UpdateWorkload
{
	@Override
	void update()
	{
		LabOpenWorkloadService service=new LabOpenWorkloadService();
		service.updateQuan(Integer.parseInt(getId()), Integer.parseInt(getQuantizationid()));
	}

	@Override
	List getReturnList(User user)
	{
		return user.getOpenWorkloadlist();
	}
}
