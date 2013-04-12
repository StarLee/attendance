package com.cuc.actions;

import java.util.List;

import com.cuc.beans.User;
import com.cuc.services.LabRegularWorkloadService;

public class UpdateRegularWorkload extends UpdateWorkload
{
	@Override
	void update()
	{
		LabRegularWorkloadService service=new LabRegularWorkloadService();
		service.updateQuan(Integer.parseInt(getId()), Integer.parseInt(getQuantizationid()));
	}

	@Override
	List getReturnList(User user)
	{
		return user.getRegularWorkloadlist();
	}
}
