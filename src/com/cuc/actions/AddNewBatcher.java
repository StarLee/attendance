package com.cuc.actions;

import com.cuc.beans.LabManageBatcher;
import com.cuc.services.LabManagerBatcherService;
/**
 * ���һ���µ����Σ�������
 * @author starlee
 *
 */
public class AddNewBatcher
{
	private String semester;
	private String year;
	public String execute()
	{
		LabManagerBatcherService service=new LabManagerBatcherService();
		LabManageBatcher batcher=new LabManageBatcher();
		batcher.setSemester(semester);
		batcher.setYear(year);
		service.addNewBatcher(batcher);
		return "ok";
	}
	
	public void setYear(String year)
	{
		this.year = year;
	}
	public void setSemester(String semester)
	{
		this.semester = semester;
	}
}
