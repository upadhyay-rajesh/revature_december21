package com.facebookboot.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "facebookboot")
@Setter
@Getter
public class FacebookUser {
	@Id
	private String email;
	private String  name;
	private String password;
	private String address;
	
	
}
