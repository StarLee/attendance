package com.cuc.beans;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.cuc.services.DutyWorkloadService;
import com.cuc.services.EquipBorrowWorkloadService;
import com.cuc.services.EquipFixWorkloadService;
import com.cuc.services.LabCourseWorkloadService;
import com.cuc.services.LabOpenWorkloadService;
import com.cuc.services.LabRegularWorkloadService;

/**
 * 用户bean
 * @author starlee
 *
 */
public class User 
{
	private int id;
	private String userName;
	private String password;
	private String priority;
	private String status;
	private String name;
	private String workNum;
	private String type;
	private String typeC;//类型的中文形式
	private String statusC;//状态的中文形式
	private  static Map typeMap=new HashMap();
	private static Map statusMap=new HashMap();
	private int batcherID;
	private List<LabRegularWorkload> regularWorkloadlist;//常规工作量
	private List<LabOpenWorkload> openWorkloadlist;//开放工作量
	private List<EquipBorrowWorkload> borrowWorkloadlist;//设备借用工作量
	private List<EquipFixWorkload> fixWorkloadlist;//设备维修工作量
	private List<DutyWorkload> legalDutyWorkloadlist;//坐班工作量
	private List<DutyWorkload> extralDutyWorkloadlist;//加班工作量
	static
	{
		typeMap.put("1", "坐班");
		typeMap.put("2", "半坐班");
		typeMap.put("3", "实验室管理员");
		statusMap.put("1", "停用");
		statusMap.put("0", "启用");
	}
	public final static String ROLE_TOPMANAGER="0";//超级管理员
	public String getTypeC()
	{
		return (String)typeMap.get(type);
	}
	public String getStatusC()
	{
		return (String)statusMap.get(status);
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPriority() {
		return priority;
	}
	public void setPriority(String priority) {
		this.priority = priority;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getWorkNum()
	{
		return workNum;
	}
	public void setWorkNum(String workNum)
	{
		this.workNum = workNum;
	}
	public String getType()
	{
		return type;
	}
	public void setType(String type)
	{
		this.type = type;
	}
	/***********************************************************************/
	 /** 以下只是为bean的外在属性服务的***************************************/
	 /**********************************************************************/
	public int getBatcherID()
	{
		return batcherID;
	}
	public void setBatcherID(int batcherID)
	{
		this.batcherID = batcherID;
	}
	/**
	 * 常规工作量
	 * @return
	 */
	public List<LabRegularWorkload> getRegularWorkloadlist()
	{
		LabRegularWorkloadService service=new LabRegularWorkloadService();
		return service.getRegularWorkload(id, batcherID);
	}
	
	private int totalRegular()
	{
		List<LabRegularWorkload> regular= getRegularWorkloadlist();
		Iterator<LabRegularWorkload> it=regular.iterator();
		int regularTotal=0;
		while(it.hasNext())
		{
			regularTotal+=Integer.parseInt(it.next().getQuantizationInfo().getStandard());
		}
		return regularTotal;
	}
	
	
	/**
	 * 实验室课程工作量
	 * @return
	 */
	public List<LabCourseWorkload> getCourseWorkloadlist()
	{
		LabCourseWorkloadService service=new LabCourseWorkloadService();
		return service.getRegularWorkload(id, batcherID);
	}
	
	private int totalCourse()
	{
		List<LabCourseWorkload> regular= getCourseWorkloadlist();
		Iterator<LabCourseWorkload> it=regular.iterator();
		int courseTotal=0;
		while(it.hasNext())
		{
			courseTotal+=Integer.parseInt(it.next().getQuantizationInfo().getStandard());
		}
		return courseTotal;
	}
	
	
	/**
	 *开放工作量
	 * @return
	 */
	public List<LabOpenWorkload> getOpenWorkloadlist()
	{
		LabOpenWorkloadService service=new LabOpenWorkloadService();
		return service.getByLabToAdmin(id, batcherID);
	}
	
	private int totalOpen()
	{
		List<LabOpenWorkload> list=getOpenWorkloadlist();
		Iterator<LabOpenWorkload> it=list.iterator();
		int total=0;
		while(it.hasNext())
		{
			total+=Integer.parseInt(it.next().getQuantization().getStandard());
		}
		return total;
	}
	/**
	 * 设备借用工作量
	 * @return
	 */
	public List<EquipBorrowWorkload> getBorrowWorkloadlist()
	{
		EquipBorrowWorkloadService service=new EquipBorrowWorkloadService();
		return service.getByUserAndBatcher(id, batcherID);
	}
	private int totalBorrow()
	{
		List<EquipBorrowWorkload> list=getBorrowWorkloadlist();
		Iterator<EquipBorrowWorkload> it=list.iterator();
		int total=0;
		while(it.hasNext())
		{
			total+=Integer.parseInt(it.next().getQuantizationInfo().getStandard());
		}
		return total;
	}
	/**
	 * 设备修理工作量
	 * @return
	 */
	public List<EquipFixWorkload> getFixWorkloadlist()
	{
		EquipFixWorkloadService service=new EquipFixWorkloadService();
		return service.getByUserAndBatcher(id, batcherID);
	}
	
	private int totalFix()
	{
		List<EquipFixWorkload> list=getFixWorkloadlist();
		Iterator<EquipFixWorkload> it=list.iterator();
		int total=0;
		while(it.hasNext())
		{
			total+=Integer.parseInt(it.next().getQuantizationInfo().getStandard());
		}
		return total;
	}
	/**
	 * 坐班工作量
	 * @return
	 */
	public List<DutyWorkload> getLegalDutyWorkloadlist()
	{
		DutyWorkloadService service=new DutyWorkloadService();
		return service.getLegalDuty(id, batcherID);
	}
	private int totalLegal()
	{
		List<DutyWorkload> list=getLegalDutyWorkloadlist();
		Iterator<DutyWorkload> it=list.iterator();
		int total=0;
		while(it.hasNext())
		{
			DutyWorkload workload=it.next();
			int temp=Integer.parseInt(workload.getQuantizationInfo().getStandard())*workload.getTimes();
			total+=temp;
		}
		return total;
	}
	/**
	 * 加班工作量
	 * @return
	 */
	public List<DutyWorkload> getExtralDutyWorkloadlist()
	{
		DutyWorkloadService service=new DutyWorkloadService();
		return service.getExtralDuty(id, batcherID);
	}
	private int totalExtra()
	{
		List<DutyWorkload> list=getExtralDutyWorkloadlist();
		Iterator<DutyWorkload> it=list.iterator();
		int total=0;
		while(it.hasNext())
		{
			DutyWorkload workload=it.next();
			int temp=Integer.parseInt(workload.getQuantizationInfo().getStandard())*workload.getTimes();
			total+=temp;
		}
		return total;
	}
	public Map<String,Integer> getTotalWorkMap()
	{
		Map<String,Integer> totalWorklist=new HashMap<String,Integer>();
		int regular=totalRegular();
		int open=totalOpen();
		int borrow=totalBorrow();
		int fix=totalFix();
		int legal=totalLegal();
		int extra=totalExtra();
		int course=totalCourse();
		int all=regular+open+borrow+fix+legal+extra+course;
		totalWorklist.put("regular", regular);
		totalWorklist.put("open", open);
		totalWorklist.put("borrow", borrow);
		totalWorklist.put("fix", fix);
		totalWorklist.put("legal", legal);
		totalWorklist.put("extra", extra);
		totalWorklist.put("course", course);
		totalWorklist.put("all", all);
		return totalWorklist;
	}
	
}
