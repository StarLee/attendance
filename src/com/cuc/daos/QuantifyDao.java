package com.cuc.daos;

import java.util.List;

import com.cuc.beans.Quantify;
import com.develop.data.annotation.SQL;
import com.develop.data.annotation.SQLTYPE;

public interface QuantifyDao
{
	@SQL(sql="insert into quantify(ID,Name,Type) values (0,'#{name}','#{type}')",paramType="com.cuc.beans.Quantify", sqlType = SQLTYPE.INSERT)
	public void addNewQuantityDao(Quantify quantify);
	@SQL(sql="update quantify set Name ='#{name}',Type='#{type}' where ID=#{id}",paramType="com.cuc.beans.Quantify",sqlType=SQLTYPE.UPDATE)
	void updateQuantify(Quantify quantify);
	@SQL(sql = "select ID as id,Name as name,Type as type  from quantify order by ID", sqlType = SQLTYPE.SELECT,resultType="com.cuc.beans.Quantify")
	public List allQuantify();
	@SQL(sql="select ID as id,Name as name from quantify where ID=#{id}",sqlType=SQLTYPE.SELECT,resultType="com.cuc.beans.Quantify")
	public Quantify getSingleQuantify(int id);
	
}
