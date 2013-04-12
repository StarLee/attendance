package com.cuc.actions;

import java.util.List;

import com.cuc.beans.User;
import com.cuc.services.EquipFixWorkloadService;
public class UpdateFixWorkload extends UpdateWorkload
{
	@Override
	void update()
	{
		EquipFixWorkloadService service=new EquipFixWorkloadService();
		service.updateQuan(Integer.parseInt(getId()), Integer.parseInt(getQuantizationid()));
	}

	@Override
	List getReturnList(User user)
	{
		return user.getFixWorkloadlist();
	}
}
