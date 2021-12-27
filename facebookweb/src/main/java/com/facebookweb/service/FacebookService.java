package com.facebookweb.service;

import com.facebookweb.dao.FacebookDAOInterface;
import com.facebookweb.entity.FacebookUser;
import com.facebookweb.utility.DAOFactory;

public class FacebookService implements FacebookServiceInterface {

	public int createProfileService(FacebookUser fb) {
		FacebookDAOInterface fd=DAOFactory.createObject();
		
		return fd.createProfileDAO(fb);
	}

	@Override
	public boolean loginprofileService(FacebookUser fb) {
FacebookDAOInterface fd=DAOFactory.createObject();
		
		return fd.loginProfileDAO(fb);
	}

}
