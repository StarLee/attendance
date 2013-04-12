package com.cuc.actions;

import java.util.List;

import com.cuc.services.LabInfoService;
import com.cuc.services.LabManagerBatcherService;

/**
 * <c:forEach items="${allLab }" var="lab" varStatus="count">
				<c:if test="${(count.count)%4 eq 0 }">
					</tr><tr>
				</c:if>
					<td><input type="checkbox" name="" value="${lab.id }">
						${lab.labName }(${lab.doorplate }สา)</td>
			</c:forEach>
 * @author starlee
 *
 */
public class AjaxLab
{
	public List list;
	public String execute()
	{
		LabInfoService service=new LabInfoService();
		list=service.allLab();
		return "ok";
	}
	public List getList()
	{
		return list;
	}
}
