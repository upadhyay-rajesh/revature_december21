package com.FacebookWeb.service;

import java.util.List;

import com.FacebookWeb.dao.FacebookDAOInterface;
import com.FacebookWeb.entity.FacebookLogin;
import com.FacebookWeb.entity.FacebookPostdata;
import com.FacebookWeb.entity.FacebookUser;
import com.FacebookWeb.entity.Friends;
import com.FacebookWeb.utility.DAOFactory;

public class FacebookService implements FacebookServiceInterface {

	private FacebookDAOInterface fd;
	public FacebookService() {
		fd=DAOFactory.createObject();
	}
	
	public int createProfileService(FacebookUser fb, FacebookLogin fbl) {
		return fd.createProfileDAO(fb,fbl);
	}

	public int loginProfileService(FacebookLogin fbl) {
		// TODO Auto-generated method stub
		return fd.loginProfileDAO(fbl);
	}

	public FacebookUser loadProfile(FacebookUser fbu) {
		// TODO Auto-generated method stub
		return fd.loadProfile(fbu);
	}

	public int updateProfile(FacebookUser fbu, FacebookLogin fbl) {
		// TODO Auto-generated method stub
		return fd.updateProfile(fbu,fbl);
	}

	public int createPost(FacebookPostdata fbpost) {
		
		return fd.createPost(fbpost);
	}

	public int deleteProfile(FacebookUser fbu) {
		// TODO Auto-generated method stub
		return fd.deleteProfileDAO(fbu);
	}

	public Friends loadFriendStatus(Friends tempFriend) {
		// TODO Auto-generated method stub
		return fd.loadFriendStatusDAO(tempFriend);
	}

	public int addFriend(Friends tempFriend) {
		// TODO Auto-generated method stub
		return fd.addFriendDAO(tempFriend);
	}

	public int removeFriend(Friends tempFriend) {
		// TODO Auto-generated method stub
		return fd.removeFriendDAO(tempFriend);
	}

	public List<FacebookPostdata> postService(FacebookLogin fbl) {
		// TODO Auto-generated method stub
		return fd.postDAO(fbl);
	}

	
}
