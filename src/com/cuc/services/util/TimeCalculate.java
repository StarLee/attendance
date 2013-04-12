package com.cuc.services.util;

import java.text.DateFormat;
import java.util.Date;

public class TimeCalculate
{
	private static final long DAY = 60L * 60L * 1000L;
	 public static long calculate(String begin,String last)
	{
		try
		{
			Date beginDate=DateFormat.getDateTimeInstance().parse(begin);
			Date lastDate=DateFormat.getDateTimeInstance().parse(last);
			long beginLong=beginDate.getTime();
			long lastLong=lastDate.getTime();
		
			return (lastLong-beginLong)/DAY; 
			
		}
		catch (Exception e) {
			return 0;
		}
	}
}
