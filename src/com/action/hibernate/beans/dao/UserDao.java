/**
 * 
 */
package com.action.hibernate.beans.dao;

import java.util.List;

import com.action.hibernate.beans.User;
import com.theone.framework.dao.BasicDao;
import com.theone.framework.datagrid.DatagridModel;

/**
 * @author Bala Yogeeswar
 * 
 */
public interface UserDao extends BasicDao<User, String> {
	public static final String BEAN_NAME = "userDao";

	String saveUser(User user);
	void findUsersForListing(DatagridModel<User> datagridModel, String userName);

	List<User> getUserByName(String userName);

}
