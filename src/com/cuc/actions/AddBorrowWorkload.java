package com.cuc.actions;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.cuc.beans.EquipBorrowWorkload;
import com.cuc.beans.SessionBean;
import com.cuc.services.EquipBorrowWorkloadService;
import com.develop.actions.statistics.ActionStatistics;
import com.develop.actions.statistics.WebObject;

public class AddBorrowWorkload
{
	private String batcherID;
	private String borrowMan;
	private String equipmentName;
	private String quantizationID;
	private List borrowList;
	public String execute()
	{
		EquipBorrowWorkloadService service=new EquipBorrowWorkloadService();
		EquipBorrowWorkload equipBorrowWorkload =new EquipBorrowWorkload(); 
		HttpServletRequest request=(HttpServletRequest) ActionStatistics.getInstance().get(WebObject.SERVLETREQUEST);
		SessionBean bean=(SessionBean)request.getSession().getAttribute("user");
		equipBorrowWorkload.setAdministrator(bean.getUser().getId());
		equipBorrowWorkload.setBatcherID(Integer.parseInt(batcherID));
		equipBorrowWorkload.setBorrowMan(borrowMan);
		equipBorrowWorkload.setEquipmentName(equipmentName);
		equipBorrowWorkload.setQuantizationID(Integer.parseInt(quantizationID));
		service.addNewRecord(equipBorrowWorkload);
		borrowList=bean.getUser().getBorrowWorkloadlist();
		return "ok";
	}
	public void setBatcherID(String batcherID)
	{
		this.batcherID = batcherID;
	}
	public void setBorrowMan(String borrowMan)
	{
		this.borrowMan = borrowMan;
	}
	public void setEquipmentName(String equipmentName)
	{
		this.equipmentName = equipmentName;
	}
	public void setQuantizationID(String quantizationID)
	{
		this.quantizationID = quantizationID;
	}
	public List getBorrowList()
	{
		return borrowList;
	}
}

