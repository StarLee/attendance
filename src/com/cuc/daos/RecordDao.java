package com.cuc.daos;

import java.util.List;

import com.cuc.beans.Record;

public interface RecordDao
{
	void addNewRecord(Record record);
	List<Record> readUserAllRecord(int userID,String date);
}
