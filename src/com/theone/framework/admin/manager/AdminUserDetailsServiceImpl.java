package com.theone.framework.admin.manager;

import com.theone.framework.application.Application;
import com.theone.framework.datagrid.DatagridModel;
import com.theone.framework.exception.ValidatorException;
import com.theone.framework.spring.security.ExtGrantedAuthority;
import com.theone.framework.user.dao.UserDetailsDao;
import com.theone.framework.user.dao.UserDetailsSqlDao;
import com.theone.framework.user.manager.UserDetailsService;
import com.theone.framework.user.vo.User;
import com.theone.framework.user.vo.UserAccess;
import com.theone.framework.user.vo.UserRole;
import com.theone.framework.util.CollectionUtil;
import com.theone.framework.util.VoUtil;
import org.springframework.dao.DataAccessException;
import org.springframework.security.GrantedAuthority;
import org.springframework.security.providers.dao.SaltSource;
import org.springframework.security.providers.encoding.PasswordEncoder;
import org.springframework.security.userdetails.UserDetails;
import org.springframework.security.userdetails.UsernameNotFoundException;

import java.util.*;

public class AdminUserDetailsServiceImpl implements AdminUserDetailsService {
	private UserDetailsDao userDetailsDao;
	private UserDetailsSqlDao userDetailsSqlDao;

	private PasswordEncoder passwordEncoder;
	private SaltSource saltSource;

	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException, DataAccessException {
		/*User user = userDetailsDao.getSuperUserByUsername(username);

		if (user == null) {
			throw new UsernameNotFoundException("Username " + username + " not found");
		}

		List<GrantedAuthority> authorities = userDetailsSqlDao.loadGrantedAuthority(user.getUserId());
        if (CollectionUtil.isNotEmpty(authorities)) {
            authorities.add(new ExtGrantedAuthority("ROLE_MAIN_FRAME"));
            authorities.add(new ExtGrantedAuthority("ROLE_USER"));
            authorities.add(new ExtGrantedAuthority("ROLE_SUPER_ADMIN"));
        }

		List<UserDetailsAccessEx> accessExs = userDetailsAccessExDao.findAccessEx(user.getUserId());
		for (UserDetailsAccessEx accessEx : accessExs) {
			authorities.add(new ExtGrantedAuthority(accessEx.getId().getAccessExCode()));
		}

		user.setAuthorities(authorities.toArray(new ExtGrantedAuthority[] {}));
*/
		return new User();
	}

	public User findUserByUsername(String username) {
		return userDetailsDao.getByUsername(username);
	}

	public void findUsersForListing(DatagridModel<User> datagridModel, String username, String fullname,
			String filterUserName, String filterFullName, String email, String status, Date dateTimeAdd) {
		userDetailsDao.findUserForDatagrid(true, datagridModel, null, username, fullname, filterUserName,
				filterFullName, email, status, dateTimeAdd);
	}

	public void saveUser(User user, List<UserRole> userRoles) {
		if (!isUsernameAvailable(user.getUsername())) {
			throw new ValidatorException("The username " + user.getUsername() + " already exists!");
		}

		String encryptedPassword = encryptPassword(user, user.getPassword());
		user.setPassword(encryptedPassword);

		if (CollectionUtil.isNotEmpty(userRoles)) {
			user.setUserRoles(new HashSet<UserRole>(userRoles));
		}

		userDetailsDao.save(user);

	}

	/**
	 * User object needed to pass in because the SALT need it.
	 * 
	 * @param user
	 * @param password
	 * @return
	 */
	private String encryptPassword(User user, String password) {
		return passwordEncoder.encodePassword(password, saltSource.getSalt(user));
	}

	public void changePassword(String userId, String oldPassword, String newPassword) {
		User user = userDetailsDao.get(userId);

		String encryptedOldPassword = encryptPassword(user, oldPassword);
		if (!encryptedOldPassword.equals(user.getPassword())) {
			throw new ValidatorException("Old password is not valid");
		}

		String encryptedNewPassword = encryptPassword(user, newPassword);
		user.setPassword(encryptedNewPassword);

		userDetailsDao.update(user);
	}

	public boolean isUsernameAvailable(String username) {
		return userDetailsDao.isUsernameAvailable(username);
	}

	public List<User> findUserForReport(String userName, String fullName) {
		return userDetailsDao.findUserForReport(userName, fullName);
	}

	public User findUserByUserId(String userId) {
		return userDetailsDao.findUserByUserId(userId);
	}

	public void updateUser(User user, Long version, List<UserRole> userRoles) {
		user.setVersion(version);

		User userDB = userDetailsDao.get(user.getUserId());

		VoUtil.checkVoBaseVersion(user, userDB);

		userDB.getUserRoles().clear();
		userDB.getUserRoles().addAll(userRoles);

		//userDB.setStaffCode(user.getStaffCode());
		//userDB.setDept(user.getDept());

		userDetailsDao.update(userDB);
	}

	public List<UserAccess> findUserAuthorizedAccess(String userId) {
		return userDetailsSqlDao.findUserAuthorizedAccess(userId);
	}    

	public Map<String, UserAccess> findUserAuthorizedAccessInMap(String userId) {
		List<UserAccess> accesses = findUserAuthorizedAccess(userId);

		Map<String, UserAccess> map = new HashMap<String, UserAccess>();
		for (UserAccess access : accesses) {
			map.put(access.getAccessCode(), access);
		}

		return map;
	}

    public User findSuperUserByUsername(String username) {
        return new User();
    }

    public static void main(String[] args) {
		@SuppressWarnings("unused")
        UserDetailsService userDetailsService = (UserDetailsService) Application
				.lookupBean(UserDetailsService.BEAN_NAME);
		@SuppressWarnings("unused")
        UserDetailsDao userDetailsDao = (UserDetailsDao) Application.lookupBean(UserDetailsDao.BEAN_NAME);

		/*
		 * for (int i = 0; i < 300; i++) { User user = new User(true);
		 * user.setEmail("admin@oline1.com"); user.setUsername("user" + (i +
		 * 1)); user.setFullname("USER " + (i + 1)); user.setDob(new Date());
		 * user.setDeptId(0L); user.setPassword("123456");
		 * 
		 * VoUtil.toUpperCaseProperties(user);
		 * userDetailsService.saveUser(user); }
		 */

		/*
		 * log.debug("Start"); User user = userDetailsDao.findUserByUserId(1L);
		 * if (user != null) { user.setDob(new Date());
		 * userDetailsService.updateUser(user); }
		 * 
		 * log.debug("End")
		 */

		// User user = (User) userDetailsService.loadUserByUsername("ADMIN");

		// log.debug(user);
	}

	public void setUserDetailsDao(UserDetailsDao userDetailsDao) {
		this.userDetailsDao = userDetailsDao;
	}

	/*public void setUserDetailsAccessExDao(UserDetailsAccessExDao userDetailsAccessExDao) {
		this.userDetailsAccessExDao = userDetailsAccessExDao;
	}*/

	public void setUserDetailsSqlDao(UserDetailsSqlDao userDetailsSqlDao) {
		this.userDetailsSqlDao = userDetailsSqlDao;
	}

	public void setPasswordEncoder(PasswordEncoder passwordEncoder) {
		this.passwordEncoder = passwordEncoder;
	}

	public void setSaltSource(SaltSource saltSource) {
		this.saltSource = saltSource;
	}


}
