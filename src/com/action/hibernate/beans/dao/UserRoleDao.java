/**
 * 
 */
package com.action.hibernate.beans.dao;

import java.util.List;

import com.action.hibernate.beans.UserRole;
import com.theone.framework.dao.BasicDao;

/**
 * @author Bala Yogeeswar
 *
 */
public interface UserRoleDao extends BasicDao<UserRole, String> {
	public static final String BEAN_NAME = "userRoleDao";

	void saveRole(UserRole role);

	List<UserRole> findRoleByRoleName(String string);


}
