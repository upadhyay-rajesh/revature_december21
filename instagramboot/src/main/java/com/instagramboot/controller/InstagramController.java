package com.instagramboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.instagramboot.entity.InstagramUser;
import com.instagramboot.service.InstagramServiceInterface;

@RestController
public class InstagramController {
	
	@Autowired
	private InstagramServiceInterface is1;
	
	@PostMapping("createProfile")
	public String createProfile(@RequestBody InstagramUser iu) {
		
		int i=is1.createProfileService(iu);
		if(i>0) {
			return "profile created";
		}
		else {
			return "profile creation failed";
		}
		
		
	}
	
	@GetMapping("viewAllProfile")
	public List<InstagramUser> allList(){
		return is1.allUserList();
	}
	
	@PutMapping("editRecord/{em}")
	public String editProfile(@PathVariable("em") String email,@RequestBody InstagramUser iu) {
		int a=is1.editProfileService(email,iu);
		if(a>0) {
			return "profile edited";
		}
		else {
			return "profile not edited";
		}
	}

	@DeleteMapping("deleteRecord/{em}")
	public String deleteProfile(@PathVariable("em") String email) {
		int a=is1.deleteProfileService(email);
		if(a>0) {
			return "profile deleted";
		}
		else {
			return "profile not deleted";
		}
	}
}























