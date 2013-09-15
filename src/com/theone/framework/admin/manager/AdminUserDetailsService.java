package com.theone.framework.admin.manager;

import com.theone.framework.datagrid.DatagridModel;
import com.theone.framework.user.vo.User;
import com.theone.framework.user.vo.UserAccess;
import com.theone.framework.user.vo.UserRole;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface AdminUserDetailsService extends org.springframework.security.userdetails.UserDetailsService {
	public static final String BEAN_NAME = "userDetailsService";

	public void saveUser(User user, List<UserRole> userRoles);

	public User findUserByUsername(String username);

	public void findUsersForListing(DatagridModel<User> datagridModel, String username, String fullname,
                                    String filterUserName, String filterFullName, String email, String status, Date dateTimeAdd);

	public void changePassword(String userId, String oldPassword, String newPassword);

	public List<User> findUserForReport(String userName, String fullName);

	public boolean isUsernameAvailable(String username);

	public User findUserByUserId(String userId);

	public void updateUser(User user, Long version, List<UserRole> userRoles);

	public List<UserAccess> findUserAuthorizedAccess(String userId);

	public Map<String, UserAccess> findUserAuthorizedAccessInMap(String userId);

    User findSuperUserByUsername(String username);
}
