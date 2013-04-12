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
 * �û�bean
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
	private String typeC;//���͵�������ʽ
	private String statusC;//״̬��������ʽ
	private  static Map typeMap=new HashMap();
	private static Map statusMap=new HashMap();
	private int batcherID;
	private List<LabRegularWorkload> regularWorkloadlist;//���湤����
	private List<LabOpenWorkload> openWorkloadlist;//���Ź�����
	private List<EquipBorrowWorkload> borrowWorkloadlist;//�豸���ù�����
	private List<EquipFixWorkload> fixWorkloadlist;//�豸ά�޹�����
	private List<DutyWorkload> legalDutyWorkloadlist;//���๤����
	private List<DutyWorkload> extralDutyWorkloadlist;//�Ӱ๤����
	static
	{
		typeMap.put("1", "����");
		typeMap.put("2", "������");
		typeMap.put("3", "ʵ���ҹ���Ա");
		statusMap.put("1", "ͣ��");
		statusMap.put("0", "����");
	}
	public final static String ROLE_TOPMANAGER="0";//��������Ա
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
	 /** ����ֻ��Ϊbean���������Է����***************************************/
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
	 * ���湤����
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
	 * ʵ���ҿγ̹�����
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
	 *���Ź�����
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
	 * �豸���ù�����
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
	 * �豸��������
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
	 * ���๤����
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
	 * �Ӱ๤����
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
