package com.service;

import java.util.ArrayList;
import java.util.TreeSet;

import com.dao.SnsDaoUserImpl;
import com.dao.SnsDaoUserInterface;
import com.entity.SnsAdvertisements;
import com.entity.SnsExams;
import com.entity.SnsUserDetail;
import com.entity.SnsUserFriends;
import com.entity.SnsUserMessages;
import com.entity.SnsUserProfileDetail;

public class SnsServiceUserImpl implements SnsServiceUserInterface{
	
	SnsDaoUserInterface sdo;
	public SnsDaoUserInterface init(){
		sdo=new SnsDaoUserImpl();
		return sdo;
	}
	@Override
	public int check(SnsUserDetail ud) {
		sdo=init();
		return sdo.check(ud);
	}

	@Override
	public int save(SnsUserDetail ud) {
		sdo=init();
		return sdo.save(ud);
	}

	@Override
	public void change_profile_status(SnsUserDetail ud) {
		sdo=init();
		sdo.change_profile_status(ud);
		
	}

	@Override
	public int delete(SnsUserDetail ud) {
		sdo=init();
		return sdo.delete(ud);
	}

	@Override
	public String verifyUserName(SnsUserDetail ud) {
		sdo=init();
		return sdo.verifyUserName(ud);
	}

	@Override
	public ArrayList<SnsUserDetail> view(SnsUserDetail ud1) {
		sdo=init();
		return sdo.view(ud1);
	}

	@Override
	public int modify(SnsUserDetail ud) {
		sdo=init();
		return sdo.modify(ud);
	}

	@Override
	public int change_password(SnsUserDetail ud) {
		sdo=init();
		return sdo.change_password(ud);
	}

	@Override
	public String get_password(SnsUserDetail ud) {
		sdo=init();
		return sdo.get_password(ud);
	}

	@Override
	public int statusmodify(SnsUserDetail ud) {
		sdo=init();
		return sdo.statusmodify(ud);
	}

	@Override
	public String return_password(SnsUserDetail ud) {
		sdo=init();
		return sdo.return_password(ud);
	}
	
	@Override
	public ArrayList<SnsUserDetail> showAll() {
		sdo=init();
		return sdo.showAll();
	}
	@Override
	public int userProfileCheck(SnsUserProfileDetail upd) {
		sdo=init();
		return sdo.userProfileCheck(upd);
	}
	@Override
	public int userProfileSave(SnsUserProfileDetail upd) {
		sdo=init();
		return sdo.userProfileSave(upd);
	}
	@Override
	public ArrayList<SnsUserProfileDetail> userProfileView(SnsUserProfileDetail upd1) {
		sdo=init();
		return sdo.userProfileView(upd1);
	}
	@Override
	public int userProfileModify(SnsUserProfileDetail upd) {
		sdo=init();
		return sdo.userProfileModify(upd);
	}
	@Override
	public ArrayList<SnsUserProfileDetail> userProfileSearch(String search, String currentUser) {
		sdo=init();
		return sdo.userProfileSearch(search, currentUser);
	}
	@Override
	public void userProfileChangeImage(SnsUserProfileDetail upd) {
		sdo=init();
		sdo.userProfileChangeImage(upd);
	}
	@Override
	public int userMessageDeleteFile(SnsUserMessages um) {
		sdo=init();
		return sdo.userMessageDeleteFile(um);
	}
	@Override
	public SnsUserMessages userMessageView1(String currentUser) {
		sdo=init();
		return sdo.userMessageView1(currentUser);
	}
	@Override
	public ArrayList<SnsUserMessages> userMessageView(String currentUser) {
		sdo=init();
		return sdo.userMessageView(currentUser);
	}
	@Override
	public ArrayList<SnsUserMessages> userMessageViewFile(SnsUserMessages um1) {
		sdo=init();
		return sdo.userMessageViewFile(um1);
	}
	@Override
	public ArrayList<SnsUserMessages> userMessageViewImage(SnsUserMessages um1) {
		sdo=init();
		return sdo.userMessageViewImage(um1);
	}
	@Override
	public TreeSet<SnsUserMessages> post_query(ArrayList friends) {
		sdo=init();
		return sdo.post_query(friends);
	}
	@Override
	public int userMessageSave(SnsUserMessages um) {
		sdo=init();
		return sdo.userMessageSave(um);
	}
	@Override
	public int userFriendSave(SnsUserFriends uf) {
		sdo=init();
		return sdo.userFriendSave(uf);
	}
	@Override
	public String userFriendCheck(SnsUserFriends uf) {
		sdo=init();
		return sdo.userFriendCheck(uf);
	}
	@Override
	public ArrayList<String> userFriendCheckFriends(String currentUser) {
		sdo=init();
		return sdo.userFriendCheckFriends(currentUser);
	}
	@Override
	public int userFriendModify(SnsUserFriends uf) {
		sdo=init();
		return sdo.userFriendModify(uf);
	}
	@Override
	public ArrayList<SnsUserFriends> userFriendCheckRequests(String currentUser) {
		sdo=init();
		return sdo.userFriendCheckRequests(currentUser);
	}
	@Override
	public ArrayList<SnsUserFriends> userFriendIfFriends(String currentUser) {
		sdo=init();
		return sdo.userFriendIfFriends(currentUser);
	}
	@Override
	public int userFriendDelete(SnsUserFriends uf) {
		sdo=init();
		return sdo.userFriendDelete(uf);
	}
	@Override
	public int examSave(SnsExams se) {
		sdo=init();
		return sdo.examSave(se);
	}
	@Override
	public ArrayList<SnsExams> examShowAll() {
		sdo=init();
		return sdo.examShowAll();
	}
	@Override
	public int examDelete(SnsExams se) {
		sdo=init();
		return sdo.examDelete(se);
	}
	@Override
	public ArrayList<SnsExams> examView(SnsExams se) {
		sdo=init();
		return sdo.examView(se);
	}
	@Override
	public int examModify(SnsExams se) {
		sdo=init();
		return sdo.examModify(se);
	}
	@Override
	public int addSave(SnsAdvertisements sa) {
		sdo=init();
		return sdo.addSave(sa);
	}
	@Override
	public ArrayList<SnsAdvertisements> addShowAll() {
		sdo=init();
		return sdo.addShowAll();
	}
	@Override
	public int addDelete(SnsAdvertisements sa) {
		sdo=init();
		return sdo.addDelete(sa);
	}
	@Override
	public ArrayList<SnsAdvertisements> addView(SnsAdvertisements sa) {
		sdo=init();
		return sdo.addView(sa);
	}
	@Override
	public int addModify(SnsAdvertisements sa) {
		sdo=init();
		return sdo.addModify(sa);
	}

}
