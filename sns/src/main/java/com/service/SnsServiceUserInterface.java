package com.service;

import java.util.ArrayList;
import java.util.TreeSet;

import com.entity.SnsAdvertisements;
import com.entity.SnsExams;
import com.entity.SnsUserDetail;
import com.entity.SnsUserFriends;
import com.entity.SnsUserMessages;
import com.entity.SnsUserProfileDetail;

public interface SnsServiceUserInterface {
	int check(SnsUserDetail ud);

	int save(SnsUserDetail ud);

	void change_profile_status(SnsUserDetail ud);

	int delete(SnsUserDetail ud);

	String verifyUserName(SnsUserDetail ud);

	ArrayList<SnsUserDetail> view(SnsUserDetail ud1);

	int modify(SnsUserDetail ud);

	int change_password(SnsUserDetail ud);

	String get_password(SnsUserDetail ud);

	int statusmodify(SnsUserDetail ud);

	String return_password(SnsUserDetail ud);

	ArrayList<SnsUserDetail> showAll();
	
	int userProfileCheck(SnsUserProfileDetail upd);

	int userProfileSave(SnsUserProfileDetail upd);

	ArrayList<SnsUserProfileDetail> userProfileView(SnsUserProfileDetail upd1);

	int userProfileModify(SnsUserProfileDetail upd);

	ArrayList<SnsUserProfileDetail> userProfileSearch(String search, String currentUser);

	void userProfileChangeImage(SnsUserProfileDetail upd);

	int userMessageDeleteFile(SnsUserMessages um);

	SnsUserMessages userMessageView1(String currentUser);

	ArrayList<SnsUserMessages> userMessageView(String currentUser);

	ArrayList<SnsUserMessages> userMessageViewFile(SnsUserMessages um1);

	ArrayList<SnsUserMessages> userMessageViewImage(SnsUserMessages um1);

	TreeSet<SnsUserMessages> post_query(ArrayList friends);

	int userMessageSave(SnsUserMessages um);
	
	int userFriendSave(SnsUserFriends uf);

	String userFriendCheck(SnsUserFriends uf);

	ArrayList<String> userFriendCheckFriends(String currentUser);

	int userFriendModify(SnsUserFriends uf);

	ArrayList<SnsUserFriends> userFriendCheckRequests(String currentUser);

	ArrayList<SnsUserFriends> userFriendIfFriends(String currentUser);

	int userFriendDelete(SnsUserFriends uf);
	
	int examSave(SnsExams se);

	ArrayList<SnsExams> examShowAll();

	int examDelete(SnsExams se);

	ArrayList<SnsExams> examView(SnsExams se);

	int examModify(SnsExams se);
	
	int addSave(SnsAdvertisements sa);

	ArrayList<SnsAdvertisements> addShowAll();

	int addDelete(SnsAdvertisements sa);

	ArrayList<SnsAdvertisements> addView(SnsAdvertisements sa);

	int addModify(SnsAdvertisements sa);
}
