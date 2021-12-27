package com.facebookweb.utility;

import com.facebookweb.service.FacebookService;
import com.facebookweb.service.FacebookServiceInterface;

public class ServiceFactory {

	public static FacebookServiceInterface createobject() {
		// TODO Auto-generated method stub
		return new FacebookService();
	}

}
