package com.cuc.daos;

import java.util.List;

import com.cuc.beans.LabInfo;

public interface LabInfoDao
{
	public void addLabInfo(LabInfo labInfo);
	public List allLab();
	public LabInfo getLab(int id);
}
