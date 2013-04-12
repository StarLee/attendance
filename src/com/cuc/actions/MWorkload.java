package com.cuc.actions;

import java.util.List;

import com.cuc.beans.LabManageBatcher;
import com.cuc.beans.Quantify;
import com.cuc.beans.User;
import com.cuc.services.LabManagerBatcherService;
import com.cuc.services.LabToAdminService;
import com.cuc.services.QuantizationInfoMixService;
import com.cuc.services.QuantizationInfoService;
import com.cuc.services.UserService;

public class MWorkload
{
	private String batcherID;
	private String userID;
	private List labs;
	private LabManageBatcher batcher;
	private User currentUser;
	private List quantizationList;
	public void setBatcherID(String batcherID)
	{
		this.batcherID = batcherID;
	}

	public String execute()
	{
		LabToAdminService LAService = new LabToAdminService();
		LabManagerBatcherService LBService=new LabManagerBatcherService();
		UserService UService=new UserService();
		QuantizationInfoService qIService=new QuantizationInfoService();
		QuantizationInfoMixService qIMService=new QuantizationInfoMixService();
		//quantizationList=qIService.getQuantizationInfoByBatcher(Integer.parseInt(batcherID));
		quantizationList=qIMService.getQuantizationInfoByBatcherType(Integer.parseInt(batcherID),"2");
		labs=LAService.obtainRelation(Integer.parseInt(userID), Integer.parseInt(batcherID));
		currentUser=UService.getSingleUser(Integer.parseInt(userID));
		currentUser.setBatcherID(Integer.parseInt(batcherID));
		batcher=LBService.getSingleBatcher(Integer.parseInt(batcherID));
		return "ok";
	}

	public List getLabs()
	{
		return labs;
	}
	public LabManageBatcher getBatcher()
	{
		return batcher;
	}

	public void setUserID(String userID)
	{
		this.userID = userID;
	}

	public User getCurrentUser()
	{
		return currentUser;
	}

	public List getQuantizationList()
	{
		return quantizationList;
	}

	
}
