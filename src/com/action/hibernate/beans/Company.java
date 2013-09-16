package com.action.hibernate.beans;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.AccessType;

import com.theone.framework.vo.core.VoBase;
@Entity(name = "company")
@Table(name = "company")
@AccessType(value = "field")

public class Company extends VoBase {
	private static final long serialVersionUID = -1930105613667249829L;
	
	@Id
	@GeneratedValue(generator = "idGen")
	@org.hibernate.annotations.GenericGenerator(name = "idGen", strategy = "uuid.hex")
	@Column(name = "USER_ID", length = 32)
	private String id;
}
