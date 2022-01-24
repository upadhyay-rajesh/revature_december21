package com.facebookboot.service;

import java.util.List;

import com.facebookboot.entity.FacebookUser;

public interface FacebookServiceInterface {

	int createProfileService(FacebookUser fb);

	List<FacebookUser> viewAllProfileService();

	int editProfileService(FacebookUser fb);

	void deleteProfileService(FacebookUser fb);

	FacebookUser searchbycityService(FacebookUser fb);

}
