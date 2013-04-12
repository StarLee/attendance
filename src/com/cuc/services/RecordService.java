package com.cuc.services;

import java.util.List;

import com.cuc.beans.Record;
import com.cuc.daos.RecordDao;
import com.develop.data.base.iml.DefaultQuery;

public class RecordService
{
	public void addRecord(Record record)
	{
		DefaultQuery query=new DefaultQuery();
		RecordDao recordDao=(RecordDao)query.getMapper(RecordDao.class);
		recordDao.addNewRecord(record);
	}
	public List<Record> userRecords(int userID,String date)
	{
		DefaultQuery query=new DefaultQuery();
		RecordDao recordDao=(RecordDao)query.getMapper(RecordDao.class);
		return recordDao.readUserAllRecord(userID,date);
	}
}
