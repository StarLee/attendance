package com.cuc.services.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeTransform
{
	public  final static String  DEFAULT="yyyy-MM-dd HH:mm:ss";
	public static String defaultFormat(Date date)
	{
		return transform(date, null);
	}
	
	public static String transform(Date date,String format)
	{
		String localFormat=DEFAULT;
		if(format!=null)
		{
			localFormat=format;
		}
		DateFormat dateFormat=new SimpleDateFormat(localFormat);
		return dateFormat.format(date);
	}
}
