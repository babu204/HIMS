/**
 * 
 */
package com.action.hibernate.beans;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.AccessType;

import com.theone.framework.vo.annotation.ToTrim;
import com.theone.framework.vo.annotation.ToUpperCase;

/**
 * @author Bala Yogeeswar
 * 
 */

@Entity(name = "user_role")
@Table(name = "user_role")
@AccessType(value = "field")
public class UserRole {

	@Id
	@GeneratedValue(generator = "idGen")
	@org.hibernate.annotations.GenericGenerator(name = "idGen", strategy = "uuid.hex")
	@Column(name = "ROLE_ID", length = 32)
	private String id;

	@ToTrim
	@ToUpperCase
	@Column(name = "ROLE_NAME", length = 50)
	private String roleName;

	@Column(name = "DELETED")
	private Boolean isDeleted;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public Boolean getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(Boolean isDeleted) {
		this.isDeleted = isDeleted;
	}

}
