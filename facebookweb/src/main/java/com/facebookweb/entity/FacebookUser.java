package com.facebookweb.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity  //this line is mandatory
@Table(name = "facebooksocialmedia") //this line is optional if we will not give then table name in database will be class name (FacebookUser) by default 
public class FacebookUser {
	@Id//this line is mandatory
	@GeneratedValue(strategy = GenerationType.AUTO) //this line is optional  ,this line is used to create auto generated id
	private long userId;
	
	private String name;
	private String password;
	private String email;
	private String address;
	
	@OneToMany(mappedBy = "fuser", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private List<Timeline> timeline;
	
	
	
	public List<Timeline> getTimeline() {
		return timeline;
	}
	public void setTimeline(List<Timeline> timeline) {
		this.timeline = timeline;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	

}
