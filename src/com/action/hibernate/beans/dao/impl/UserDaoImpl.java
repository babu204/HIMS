/**
 * 
 */
package com.action.hibernate.beans.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.action.hibernate.beans.User;
import com.action.hibernate.beans.dao.UserDao;
import com.theone.framework.dao.AbstractDao;
import com.theone.framework.datagrid.DatagridModel;

/**
 * @author Bala Yogeeswar
 * 
 */
@Repository(UserDao.BEAN_NAME)
public class UserDaoImpl extends AbstractDao<User, String> implements UserDao {

	public UserDaoImpl() {
		super(new User());
	}

	@Transactional
	public String saveUser(User user) {
		save(user);
		return user.getId();
	}

	public void findUsersForListing(DatagridModel<User> datagridModel,
			String userName) {
		List<Object> params = new ArrayList<Object>();
		String hql = "FROM user IN " + User.class + " WHERE 1=1";
		if (StringUtils.isNotBlank(userName)) {
			hql += " AND user.userName = ?";
			params.add(userName);
		}
		
		findForDatagrid(datagridModel, "user", hql, params.toArray());
	}

	public List<User> getUserByName(String userName) {
		List<Object> params = new ArrayList<Object>();
		String hql = "FROM user IN " + User.class + " WHERE 1=1";
		if (StringUtils.isNotBlank(userName)) {
			hql += " AND user.userName = ?";
			params.add(userName);
		}
		return findQueryAsList(hql, params.toArray());
	}
	
	
	

}
