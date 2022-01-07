package com.service;

import java.util.ArrayList;

import com.entity.SnsAdmin;

public interface SnsServiceAdminInterface {

	ArrayList<SnsAdmin> login(SnsAdmin sa);

	void change_password(SnsAdmin sa);
	
}
