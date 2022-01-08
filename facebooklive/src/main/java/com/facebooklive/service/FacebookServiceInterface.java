package com.facebooklive.service;

import java.util.List;

import com.facebooklive.entity.FacebookUser;
import com.facebooklive.entity.TimeLine;

public interface FacebookServiceInterface {

	int createProfileService(FacebookUser fb);

	int loginProfileService(FacebookUser fb);

	List<TimeLine> timeLineService(FacebookUser fb);

}
