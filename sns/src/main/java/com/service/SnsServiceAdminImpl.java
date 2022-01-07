package com.service;

import java.util.ArrayList;

import com.dao.SnsDaoAdminImpl;
import com.dao.SnsDaoAdminInterface;
import com.entity.SnsAdmin;

public class SnsServiceAdminImpl implements SnsServiceAdminInterface{

	SnsDaoAdminInterface sdo;
	public SnsDaoAdminInterface init(){
		sdo=new SnsDaoAdminImpl();
		return sdo;
	}
	@Override
	public ArrayList<SnsAdmin> login(SnsAdmin sa) {
		sdo=init();
		return sdo.login(sa);
	}

	@Override
	public void change_password(SnsAdmin sa) {
		sdo=init();
		sdo.change_password(sa);
		
	}

}
