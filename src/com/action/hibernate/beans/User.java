/**
 * 
 */
package com.action.hibernate.beans;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.AccessType;
import org.hibernate.annotations.ForeignKey;

import com.theone.framework.vo.annotation.ToTrim;
import com.theone.framework.vo.annotation.ToUpperCase;

/**
 * @author Bala Yogeeswar
 * 
 */

@Entity(name = "user")
@Table(name = "user")
@AccessType(value = "field")
public class User extends com.theone.framework.vo.core.VoBase {
	private static final long serialVersionUID = -8951608759612050257L;

	@Id
	@GeneratedValue(generator = "idGen")
	@org.hibernate.annotations.GenericGenerator(name = "idGen", strategy = "uuid.hex")
	@Column(name = "USER_ID", length = 32)
	private String id;

	@ToTrim
	@ToUpperCase
	@Column(name = "USER_NAME", length = 50)
	private String userName;

	@ToTrim
	@Column(name = "PASSWORD", length = 50)
	private String passWord;

	@Column(name = "DELETED")
	private Boolean isDeleted;

	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "ROLE_ID", nullable = false)
	@ForeignKey(name = "FK_ROLE_ID")
	private UserRole uesrRole;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public Boolean getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(Boolean isDeleted) {
		this.isDeleted = isDeleted;
	}

	public UserRole getUesrRole() {
		return uesrRole;
	}

	public void setUesrRole(UserRole uesrRole) {
		this.uesrRole = uesrRole;
	}

}
