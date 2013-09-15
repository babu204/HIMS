package com.action.listing;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.action.hibernate.beans.User;
import com.action.hibernate.beans.dao.UserDao;
import com.theone.framework.application.Application;
import com.theone.framework.datagrid.SqlDatagridModel;
import com.theone.framework.struts2.jquery.datatables.BaseDatatablesJsonAction;
import com.theone.framework.vo.ORWrapper;

@Namespace("/app/test")
@Action(value = "userListingAction", results = {
		@Result(name = "input", location = "/misc/jsonMessage.jsp", type = "dispatcher"),
		@Result(name = "json", type = "json") })
public class SampleListing extends BaseDatatablesJsonAction<User> {

	private static final long serialVersionUID = -8648823595190825455L;
	private String userName;
	@Autowired
	private UserDao userDao;

	public SampleListing() {
		userDao = (UserDao) Application.lookupBean(UserDao.BEAN_NAME);
		SqlDatagridModel<User> datagridModel = new SqlDatagridModel<User>();
		datagridModel.setAliasName("");
		datagridModel.setMainORWrapper(new ORWrapper(new User(), ""));
		// must be set datagridModel
		setDatagridModel(datagridModel);

		
	}

	@Override
	public String execute() throws Exception {
		userDao.findUsersForListing(getDatagridModel(),userName);
		return JSON;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

}
