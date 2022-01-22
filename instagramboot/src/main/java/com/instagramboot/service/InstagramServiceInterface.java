package com.instagramboot.service;

import java.util.List;

import com.instagramboot.entity.InstagramUser;

public interface InstagramServiceInterface {

	int createProfileService(InstagramUser iu);

	List<InstagramUser> allUserList();

	int editProfileService(String email, InstagramUser iu);

	int deleteProfileService(String email);

}
