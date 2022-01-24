package com.facebookboot.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.facebookboot.entity.FacebookUser;
import com.facebookboot.service.FacebookServiceInterface;

@RestController
public class FacebookController {
	
	@Autowired
	private FacebookServiceInterface fs;
	
	private Logger log=Logger.getLogger("FacebookController");
	
	//@RequestMapping(value = "createUser", method = RequestMethod.POST)
	
	@PostMapping("createUser")
	public String createProfile(@RequestBody FacebookUser fb) {
		
		log.info("inside create profile method at "+LocalDate.now());
		
		int i=fs.createProfileService(fb);
		if(i>0) {
			return "profile created";
		}
		else {
			return "could not create profile";
		}
		
	}
	
	//@RequestMapping(value = "viewAllUser", method = RequestMethod.GET, produces = MediaType.APPLICATION_XML)
	@GetMapping("viewAllUser")
	public List<FacebookUser> viewAllProfile(){
		List<FacebookUser> ll=fs.viewAllProfileService();
		return ll;
	}
	
	//@RequestMapping(value = "deleteUser/{uid}", method = RequestMethod.DELETE)
	
	@DeleteMapping("deleteUser/{uid}")
	public String deletePrfile(@PathVariable("uid") String userid) {
		FacebookUser fb=new FacebookUser();
		fb.setEmail(userid);
		fs.deleteProfileService(fb);
		return "profile deleted";
	}
	
	
	//@RequestMapping(value = "editUser/{uid}", method = RequestMethod.PUT)
	
	@PutMapping("editUser/{uid}")
	public String editProfile(@PathVariable("uid") String userid,@RequestBody FacebookUser fb) {
		fb.setEmail(userid);
		
		int i=fs.editProfileService(fb);
		return "profile edited";
	}
	
	@GetMapping("searchbycity/{cityName}")
	public FacebookUser searchByCity(@PathVariable("cityName") String address) {
		FacebookUser fb=new FacebookUser();
		fb.setAddress(address);
		
		FacebookUser ff=fs.searchbycityService(fb);
		return ff;
	}
	
	

}









