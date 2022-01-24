package com.facebookboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.facebookboot.dao.FacebookDAOInterface;
import com.facebookboot.entity.FacebookUser;

@Service
@Transactional
public class FacebookService implements FacebookServiceInterface {

	@Autowired
	private FacebookDAOInterface fd;
	
	@Override
	public int createProfileService(FacebookUser fb) {
		fd.save(fb);
		return 1;
	}

	@Override
	public List<FacebookUser> viewAllProfileService() {
		// TODO Auto-generated method stub
		return fd.findAll();
	}

	@Override
	public int editProfileService(FacebookUser fb) {
		fd.saveAndFlush(fb);
		return 1;
	}

	@Override
	public void deleteProfileService(FacebookUser fb) {
		fd.deleteById(fb.getEmail());
		
	}

	@Override
	public FacebookUser searchbycityService(FacebookUser fb) {
		// TODO Auto-generated method stub
		return fd.serachUserByCity(fb.getAddress());
	}

}








