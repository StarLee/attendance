package com.cuc.actions;

import java.util.List;

import com.cuc.services.LabManagerBatcherService;
import com.develop.actions.test.Basic;

public class AllBatcher implements Basic
{

	private List batcherList;

	public List getBatcherList()
	{
		return batcherList;
	}

	public String execute()
	{
		LabManagerBatcherService labBService = new LabManagerBatcherService();
		batcherList = labBService.allBatcher();
		return "ok";
	}

}
