package com.instagramboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.instagramboot.dao.InstagramDAOInterface;
import com.instagramboot.entity.InstagramUser;

@Service
@Transactional
public class InstagramService implements InstagramServiceInterface {

	@Autowired
	private InstagramDAOInterface id1;
	
	@Override
	public int createProfileService(InstagramUser iu) {
		int i=0;
		id1.save(iu);
		i=1;
		return 1;
	}

	@Override
	public List<InstagramUser> allUserList() {
		// TODO Auto-generated method stub
		return id1.findAll();
	}

	@Override
	public int editProfileService(String email, InstagramUser iu) {
		id1.saveAndFlush(iu);
		return 1;
	}

	@Override
	public int deleteProfileService(String email) {
		id1.deleteById(email);
		return 1;
	}

}
