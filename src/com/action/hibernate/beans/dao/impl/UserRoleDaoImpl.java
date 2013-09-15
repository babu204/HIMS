/**
 * 
 */
package com.action.hibernate.beans.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.action.hibernate.beans.UserRole;
import com.action.hibernate.beans.dao.UserRoleDao;
import com.theone.framework.dao.AbstractDao;

/**
 * @author Bala Yogeeswar
 * 
 */
@Repository(UserRoleDao.BEAN_NAME)
public class UserRoleDaoImpl extends AbstractDao<UserRole, String> implements
		UserRoleDao {
	public UserRoleDaoImpl() {
		super(new UserRole());
	}

	@Transactional
	public void saveRole(UserRole role) {
		save(role);

	}

	public List<UserRole> findRoleByRoleName(String roleName) {
		List<Object> params = new ArrayList<Object>();
		String hql = "FROM userRole IN " + UserRole.class + " WHERE 1=1 ";

		if (StringUtils.isNotBlank(roleName)) {
			hql += " AND userRole.roleName = ?";
			params.add(roleName);
		}

		return findQueryAsList(hql, params.toArray());
	}

}
