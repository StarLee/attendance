package com.cuc.daos;

import com.cuc.beans.User;
import com.develop.data.result.PageResult;

public interface UserDao
{
	User getUser(String userName);
	void addUser(User user);
	PageResult<User> allUser();
	void changeStatus(User user);
	void changePassword(User user);
	/**
	 * 传入是user的ID
	 * @param user
	 * @return
	 */
	User getSingleUser(User user);
}
