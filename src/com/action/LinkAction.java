package com.action;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.SessionAware;

import com.action.hibernate.beans.User;
import com.action.hibernate.beans.UserRole;
import com.action.hibernate.beans.dao.UserDao;
import com.action.hibernate.beans.dao.UserRoleDao;
import com.theone.framework.application.Application;
import com.theone.framework.exception.ValidatorException;
import com.theone.framework.struts2.BaseWorkFlowAction;
import com.theone.framework.util.CollectionUtil;

@Namespace("/app/test")
@Action(value = "*Link*", interceptorRefs = { @InterceptorRef("tokenStack") }, results = {
		@Result(name = "invalid.token", location = "appDoubleSubmit", type = "tiles"),
		@Result(name = "input", location = "/misc/jsonMessage.jsp", type = "dispatcher"),
		@Result(name = "json", type = "json") })
public class LinkAction extends BaseWorkFlowAction implements SessionAware {

	private static final long serialVersionUID = -2613425890762568273L;
	private UserDao userDao;
	private UserRoleDao userRoleDao;

	private String userName;
	private String passWord;
	private String roleName;

	public LinkAction() {
		userDao = (UserDao) Application.lookupBean(UserDao.BEAN_NAME);
		userRoleDao = (UserRoleDao) Application
				.lookupBean(UserRoleDao.BEAN_NAME);
	}

	public String welcome() {
		return "welcome";
	}

	public String friends() {
		return "friends";
	}

	public String office() {
		System.out.println("OFFICE");
		return "office";
	}

	public String loginSuccess() {
		try {
			if (StringUtils.isNotEmpty(userName)) {
				List<User> users = userDao.getUserByName(userName);
				if (CollectionUtil.isNotEmpty(users)) {
					if (users.size() == 1) {
						User user = users.get(0);
						if (user != null) {
							if (user.getUserName().equalsIgnoreCase(userName)) {
								// User name is same
								if (user.getPassWord().equals(passWord)) {
									// Login success
									return "loginSuccess";
								} else {
									addActionMessage("Please Check your credentials");
									return "loginError";
								}
							}
						}
					} else {
						// throw error
						addActionMessage("Please Check your credentials");
						return "loginError";
					}
				} else {
					// throw error
					addActionMessage("Please Check your credentials");
					return "loginError";
				}
			}
		} catch (ValidatorException e) {
			addActionError(e.getMessage());
			throw new ValidatorException(e.getMessage());
		} catch (Exception e) {
			StringWriter sw = new StringWriter();
			e.printStackTrace(new PrintWriter(sw));
			String stacktrace = sw.toString();
			addActionError(stacktrace);
			e.printStackTrace();
		}
		return "loginSuccess";
	}

	public String createUser() {
		List<UserRole> userRoles = userRoleDao.findRoleByRoleName("ADMIN");
		if (CollectionUtil.isNotEmpty(userRoles)) {
			if (userRoles.size() == 1) {
				User user = new User();
				user.setUserName(userName);
				user.setPassWord(passWord);
				user.setIsDeleted(false);
				user.setUesrRole(userRoles.get(0));
				userDao.saveUser(user);
			}
		}
		return "createUser";
	}

	public String create() {

		if (StringUtils.isNotEmpty(roleName)) {

			UserRole role = new UserRole();
			role.setRoleName(roleName);
			role.setIsDeleted(false);
			userRoleDao.saveRole(role);
		}

		return "create";
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public UserRoleDao getUserRoleDao() {
		return userRoleDao;
	}

	public void setUserRoleDao(UserRoleDao userRoleDao) {
		this.userRoleDao = userRoleDao;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

}
