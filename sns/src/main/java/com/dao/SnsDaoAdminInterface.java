package com.dao;

import java.util.ArrayList;

import com.entity.SnsAdmin;

public interface SnsDaoAdminInterface {

	ArrayList<SnsAdmin> login(SnsAdmin sa);

	void change_password(SnsAdmin sa);

}
