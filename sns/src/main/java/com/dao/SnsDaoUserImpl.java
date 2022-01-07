package com.dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.TreeSet;

import com.entity.SnsAdvertisements;
import com.entity.SnsExams;
import com.entity.SnsUserDetail;
import com.entity.SnsUserFriends;
import com.entity.SnsUserMessages;
import com.entity.SnsUserProfileDetail;
import com.helper.SnsDataBaseConnection;

import bean.comparator;

public class SnsDaoUserImpl implements SnsDaoUserInterface {

	// ----------------- SnsUserDetail---------------------

	@Override
	public int check(SnsUserDetail ud) {

		int count = 0;
		try {
			Connection con = SnsDataBaseConnection.openConnection();
			
			String sql = "select * from login where user_name=? and user_pass=? and ustatus=?";

			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, ud.getUser_name());
			ps.setString(2, ud.getUser_pass());
			ps.setString(3, ud.getUstatus());
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				count++;

			}
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public int save(SnsUserDetail ud) {
		int count = 0;
		try {
			Connection con = SnsDataBaseConnection.openConnection();
			String sql = "insert into login values(?,?,?,?,?,?)";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, ud.getUser_name());
			ps.setString(2, ud.getUser_pass());
			ps.setString(3, ud.getUser_profile());
			ps.setString(4, ud.getUstatus());
			ps.setString(5, ud.getUser_squestion());
			ps.setString(6, ud.getUser_sanswer());

			count = ps.executeUpdate();

			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public void change_profile_status(SnsUserDetail ud) {
		try {
			Connection con = SnsDataBaseConnection.openConnection();
			String sql = "update login set user_profile=? where user_name=?";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(2, ud.getUser_name());
			ps.setString(1, "yes");

			ps.executeUpdate();

			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public int statusmodify(SnsUserDetail ud) {
		int count = 0;
		try {
			Connection con = SnsDataBaseConnection.openConnection();
			String sql = "update login set ustatus=? where user_name=?";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(2, ud.getUser_name());
			ps.setString(1, ud.getUstatus());

			count = ps.executeUpdate();

			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public String return_password(SnsUserDetail ud) {
		String user_pass = null;
		try {
			Connection con = SnsDataBaseConnection.openConnection();
			String sql = "select user_pass from login where user_name=? and user_squestion=? and user_sanswer=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, ud.getUser_name());
			ps.setString(2, ud.getUser_squestion());
			ps.setString(3, ud.getUser_sanswer());
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				user_pass = rs.getString("user_pass");

			}

			rs.close();
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user_pass;
	}

	@Override
	public ArrayList<SnsUserDetail> showAll() {

		ArrayList<SnsUserDetail> data = new ArrayList<SnsUserDetail>();
		try {
			Connection con = SnsDataBaseConnection.openConnection();
			String sql = "select * from login";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				SnsUserDetail ud = new SnsUserDetail();
				ud.setUser_name(rs.getString("user_name"));
				ud.setUser_pass(rs.getString("user_pass"));
				ud.setUser_profile(rs.getString("user_profile"));
				ud.setUstatus(rs.getString("ustatus"));
				ud.setUser_squestion(rs.getString("user_squestion"));
				ud.setUser_sanswer(rs.getString("user_sanswer"));
				data.add(ud);
			}

			rs.close();
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}

	@Override
	public int delete(SnsUserDetail ud) {
		int count = 0;
		try {
			Connection con = SnsDataBaseConnection.openConnection();
			String sql = "delete from login where user_name=?";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, ud.getUser_name());
			count = ps.executeUpdate();
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public String verifyUserName(SnsUserDetail ud) {
		String a = null;
		try {
			Connection con = SnsDataBaseConnection.openConnection();
			String sql = "select * from login where user_name=?";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, ud.getUser_name());
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				a = "false";
			} else {
				a = "true";
			}

			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return a;
	}

	@Override
	public ArrayList<SnsUserDetail> view(SnsUserDetail ud1) {

		ArrayList<SnsUserDetail> data = new ArrayList<SnsUserDetail>();
		try {
			Connection con = SnsDataBaseConnection.openConnection();
			String sql = "select * from login where user_name=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, ud1.getUser_name());
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				SnsUserDetail ud = new SnsUserDetail();
				ud.setUser_name(rs.getString("user_name"));
				ud.setUser_pass(rs.getString("user_pass"));
				ud.setUser_profile(rs.getString("user_profile"));
				ud.setUstatus(rs.getString("ustatus"));
				ud.setUser_squestion(rs.getString("user_squestion"));
				ud.setUser_sanswer(rs.getString("user_sanswer"));
				data.add(ud);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}

	@Override
	public int modify(SnsUserDetail ud) {
		int count = 0;
		try {
			Connection con = SnsDataBaseConnection.openConnection();
			String sql = "update login set user_pass=?,user_sanswer=? where user_name=?";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, ud.getUser_pass());
			ps.setString(2, ud.getUser_sanswer());
			ps.setString(3, ud.getUser_name());

			count = ps.executeUpdate();

			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public int change_password(SnsUserDetail ud) {
		int count = 0;
		try {
			Connection con = SnsDataBaseConnection.openConnection();
			String sql = "update login set user_pass=? where user_name=?";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, ud.getUser_pass());

			ps.setString(2, ud.getUser_name());

			count = ps.executeUpdate();

			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public String get_password(SnsUserDetail ud) {
		String user_pass = null;
		try {
			Connection con = SnsDataBaseConnection.openConnection();
			String sql = "select user_pass from login where user_name=? and user_squestion=? and user_sanswer=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, ud.getUser_name());
			ps.setString(2, ud.getUser_squestion());
			ps.setString(3, ud.getUser_sanswer());
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				user_pass = rs.getString("user_pass");

			}

			rs.close();
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user_pass;
	}

	// ------------------ *END* -----------------

	// ----------SnsUserProfileDetail------------------

	@Override
	public int userProfileCheck(SnsUserProfileDetail upd) {

		int count = 0;
		try {
			Connection con = SnsDataBaseConnection.openConnection();
			String sql = "select * from user_detail where user_name=?";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, upd.getUser_name());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				count++;

			}
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public int userProfileSave(SnsUserProfileDetail upd) {
		int count = 0;
		try {
			Connection con = SnsDataBaseConnection.openConnection();
			String sql = "insert into user_detail(user_name, user_firstname, user_lastname, user_gender, user_birthdate, user_address, user_homecity, user_currentcity, user_email, user_mob, user_profileimage, user_highschool, user_college, user_exp, user_skills) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, upd.getUser_name());
			ps.setString(2, upd.getUser_firstname());
			ps.setString(3, upd.getUser_lastname());
			ps.setString(4, upd.getUser_gender());
			ps.setString(5, upd.getUser_birthdate());
			ps.setString(6, "");
			ps.setString(7, "");
			ps.setString(8, upd.getUser_currentcity());
			ps.setString(9, upd.getUser_email());
			ps.setString(10, "");
			ps.setString(11, upd.getUser_profileimage());
			ps.setString(12, "");
			ps.setString(13, "");
			ps.setString(14, "");
			ps.setString(15, "");
			count = ps.executeUpdate();

			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public ArrayList<SnsUserProfileDetail> userProfileView(SnsUserProfileDetail upd1) {

		ArrayList<SnsUserProfileDetail> data = new ArrayList<SnsUserProfileDetail>();
		try {
			Connection con = SnsDataBaseConnection.openConnection();
			String sql = "select * from user_detail where user_name=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, upd1.getUser_name());
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				SnsUserProfileDetail upd = new SnsUserProfileDetail();
				upd.setUser_id(rs.getInt("user_id"));
				upd.setUser_name(rs.getString("user_name"));
				upd.setUser_firstname(rs.getString("user_firstname"));
				upd.setUser_lastname(rs.getString("user_lastname"));
				upd.setUser_gender(rs.getString("user_gender"));
				upd.setUser_birthdate(rs.getString("user_birthdate"));
				upd.setUser_address(rs.getString("user_address"));
				upd.setUser_homecity(rs.getString("user_homecity"));
				upd.setUser_currentcity(rs.getString("user_currentcity"));
				upd.setUser_email(rs.getString("user_email"));
				upd.setUser_mob(rs.getString("user_mob"));
				upd.setUser_profileimage(rs.getString("user_profileimage"));
				upd.setUser_highschool(rs.getString("user_highschool"));
				upd.setUser_college(rs.getString("user_college"));
				upd.setUser_exp(rs.getString("user_exp"));
				upd.setUser_skills(rs.getString("user_skills"));
				data.add(upd);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}

	@Override
	public int userProfileModify(SnsUserProfileDetail upd) {
		int count = 0;
		try {
			Connection con = SnsDataBaseConnection.openConnection();
			String sql = "update user_detail set user_firstname=?,user_lastname=?,user_gender=?,user_birthdate=?,user_address=?,user_homecity=?,user_currentcity=?,user_email=?,user_mob=?,user_highschool=?,user_college=?,user_exp=?,user_skills=? where user_name=?";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, upd.getUser_firstname());
			ps.setString(2, upd.getUser_lastname());
			ps.setString(3, upd.getUser_gender());
			ps.setString(4, upd.getUser_birthdate());
			ps.setString(5, upd.getUser_address());
			ps.setString(6, upd.getUser_homecity());
			ps.setString(7, upd.getUser_currentcity());
			ps.setString(8, upd.getUser_email());
			ps.setString(9, upd.getUser_mob());
			ps.setString(10, upd.getUser_highschool());
			ps.setString(11, upd.getUser_college());
			ps.setString(12, upd.getUser_exp());
			ps.setString(13, upd.getUser_skills());
			ps.setString(14, upd.getUser_name());
			count = ps.executeUpdate();

			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public ArrayList<SnsUserProfileDetail> userProfileSearch(String search, String currentUser) {

		ArrayList<SnsUserProfileDetail> data = new ArrayList<SnsUserProfileDetail>();

		try {
			Connection con = SnsDataBaseConnection.openConnection();
			String searchUser = search.toLowerCase();
			String sql = "select * from user_detail where (lower(user_firstname) like '" + searchUser
					+ "%' or user_name like '" + searchUser + "%') and user_name<>'" + currentUser + "'";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				SnsUserProfileDetail upd = new SnsUserProfileDetail();
				upd.setUser_firstname(rs.getString("user_firstname"));
				upd.setUser_lastname(rs.getString("user_lastname"));
				upd.setUser_profileimage(rs.getString("user_profileimage"));
				upd.setUser_name(rs.getString("user_name"));
				data.add(upd);

			}
			ps.close();
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}

	@Override
	public void userProfileChangeImage(SnsUserProfileDetail upd) {
		try {
			Connection con = SnsDataBaseConnection.openConnection();
			String sql = "update user_detail set user_profileimage=? where user_name=?";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, upd.getUser_profileimage());
			ps.setString(2, upd.getUser_name());
			ps.executeUpdate();

			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// ------------------ *END* ----------------

	// ---------------SnsUserMessages ------------
	@Override
	public int userMessageSave(SnsUserMessages um) {
		int count = 0;
		try {
			Connection con = SnsDataBaseConnection.openConnection();
			String sql = "insert into message(msg_sender, msg_receiver, msg_date, msg_content, msg_type, msg_status, msg_reply_code) values(?,?,?,?,?,?,?)";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, um.getMsg_sender());
			ps.setString(2, um.getMsg_receiver());
			ps.setString(3, um.getMsg_date());
			ps.setString(4, um.getMsg_content());
			ps.setString(5, um.getMsg_type());
			ps.setString(6, "-");
			ps.setInt(7, um.getMsg_reply_code());
			//ps.setString(8, um.getMsg_image());
			//ps.setString(8, um.getMsg_file());

			count = ps.executeUpdate();

			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public TreeSet<SnsUserMessages> post_query(ArrayList friends) {

		TreeSet<SnsUserMessages> data = new TreeSet<SnsUserMessages>(new comparator());
		try {
			Connection con = SnsDataBaseConnection.openConnection();
			int i = 0;
			while (i < friends.size()) {
				String sql = "select * from message where msg_receiver=? or msg_sender=? order by msg_id desc";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, (String) friends.get(i));
				ps.setString(2, (String) friends.get(i));
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {

					SnsUserMessages um = new SnsUserMessages();
					um.setMsg_id(rs.getInt("msg_id"));
					um.setMsg_sender(rs.getString("msg_sender"));
					um.setMsg_date(rs.getString("msg_date"));
					um.setMsg_content(rs.getString("msg_content"));
					um.setMsg_receiver(rs.getString("msg_receiver"));
					um.setMsg_type(rs.getString("msg_type"));
					um.setMsg_status(rs.getString("msg_status"));
					um.setMsg_reply_code(rs.getInt("msg_reply_code"));
					um.setMsg_file(rs.getString("msg_file"));
					um.setMsg_image(rs.getString("msg_image"));
					data.add(um);

				}

				rs.close();
				ps.close();
				i++;
			}
			// con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}

	@Override
	public ArrayList<SnsUserMessages> userMessageViewImage(SnsUserMessages um1) {

		ArrayList<SnsUserMessages> data = new ArrayList<SnsUserMessages>();
		try {
			Connection con = SnsDataBaseConnection.openConnection();
			String sql = "select * from message where msg_sender=? and msg_image IS NOT NULL order by msg_id desc";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, um1.getMsg_sender());
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				SnsUserMessages um = new SnsUserMessages();
				um.setMsg_id(rs.getInt("msg_id"));
				um.setMsg_file(rs.getString("msg_file"));
				um.setMsg_image(rs.getString("msg_image"));
				data.add(um);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}

	@Override
	public ArrayList<SnsUserMessages> userMessageViewFile(SnsUserMessages um1) {

		ArrayList<SnsUserMessages> data = new ArrayList<SnsUserMessages>();
		try {
			Connection con = SnsDataBaseConnection.openConnection();
			String sql = "select * from message where msg_sender=? and msg_file IS NOT NULL order by msg_id desc";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, um1.getMsg_sender());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				SnsUserMessages um = new SnsUserMessages();
				um.setMsg_id(rs.getInt("msg_id"));
				um.setMsg_file(rs.getString("msg_file"));
				um.setMsg_image(rs.getString("msg_image"));
				data.add(um);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}

	@Override
	public ArrayList<SnsUserMessages> userMessageView(String currentUser) {

		ArrayList<SnsUserMessages> data = new ArrayList<SnsUserMessages>();
		try {
			Connection con = SnsDataBaseConnection.openConnection();
			String sql = "select * from message where (msg_receiver=? and msg_sender<>?) or (msg_receiver<>? and msg_sender=?) order by msg_id desc";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, currentUser);
			ps.setString(2, currentUser);
			ps.setString(3, currentUser);
			ps.setString(4, currentUser);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				SnsUserMessages um = new SnsUserMessages();
				um.setMsg_id(rs.getInt("msg_id"));
				um.setMsg_sender(rs.getString("msg_sender"));
				um.setMsg_date(rs.getString("msg_date"));
				um.setMsg_content(rs.getString("msg_content"));
				um.setMsg_receiver(rs.getString("msg_receiver"));
				um.setMsg_type(rs.getString("msg_type"));
				um.setMsg_status(rs.getString("msg_status"));
				um.setMsg_reply_code(rs.getInt("msg_reply_code"));
				um.setMsg_file(rs.getString("msg_file"));
				um.setMsg_image(rs.getString("msg_image"));
				data.add(um);
			}

			rs.close();
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}

	@Override
	public SnsUserMessages userMessageView1(String currentUser) {

		SnsUserMessages um = new SnsUserMessages();
		try {
			Connection con = SnsDataBaseConnection.openConnection();
			String sql = "select * from message where msg_receiver=? and msg_sender=? order by msg_id desc";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, currentUser);
			ps.setString(2, currentUser);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				um.setMsg_id(rs.getInt("msg_id"));
				um.setMsg_sender(rs.getString("msg_sender"));
				um.setMsg_date(rs.getString("msg_date"));
				um.setMsg_content(rs.getString("msg_content"));
				um.setMsg_receiver(rs.getString("msg_receiver"));
				um.setMsg_type(rs.getString("msg_type"));
				um.setMsg_status(rs.getString("msg_status"));
				um.setMsg_reply_code(rs.getInt("msg_reply_code"));
				um.setMsg_file(rs.getString("msg_file"));
				um.setMsg_image(rs.getString("msg_image"));
				;

			}

			rs.close();
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return um;
	}

	@Override
	public int userMessageDeleteFile(SnsUserMessages um) {
		int count = 0;
		try {

			Connection con = SnsDataBaseConnection.openConnection();
			String sql = "delete from message where (msg_sender=? and msg_file=? and msg_id=?) or msg_reply_code=?";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, um.getMsg_sender());
			ps.setString(2, um.getMsg_file());
			ps.setInt(3, um.getMsg_id());
			ps.setInt(4, um.getMsg_reply_code());
			count = ps.executeUpdate();
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	// --------------- *END* --------------------

	// ------------- SnsUserFriends -----------------
	@Override
	public int userFriendSave(SnsUserFriends uf) {

		int count = 0;
		try {
			Connection con = SnsDataBaseConnection.openConnection();
			String sql = "insert into friend(frnd_from, frnd_to, frnd_status, frnd_date) values(?,?,?,?)";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, uf.getFrnd_from());
			ps.setString(2, uf.getFrnd_to());
			ps.setString(3, uf.getFrnd_status());
			ps.setString(4, uf.getFrnd_date());

			count = ps.executeUpdate();

			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public String userFriendCheck(SnsUserFriends uf) {

		String frn_status = null;
		try {
			Connection con = SnsDataBaseConnection.openConnection();
			String sql = "select * from friend where (frnd_from=? and frnd_to=?) or (frnd_from=? and frnd_to=?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, uf.getFrnd_from());
			ps.setString(2, uf.getFrnd_to());
			ps.setString(3, uf.getFrnd_to());
			ps.setString(4, uf.getFrnd_from());
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				frn_status = rs.getString("frnd_status");
			} else
				frn_status = "add quemate";
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return frn_status;
	}

	@Override
	public ArrayList<SnsUserFriends> userFriendCheckRequests(String currentUser) {

		ArrayList<SnsUserFriends> data = new ArrayList<SnsUserFriends>();
		try {
			Connection con = SnsDataBaseConnection.openConnection();
			String sql = "select * from friend where frnd_to=? and frnd_status=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, currentUser);
			ps.setString(2, "pending");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				SnsUserFriends um = new SnsUserFriends();
				um.setFrnd_id(rs.getInt("frnd_id"));
				um.setFrnd_from(rs.getString("frnd_from"));
				um.setFrnd_status(rs.getString("frnd_status"));
				um.setFrnd_date(rs.getString("frnd_date"));
				data.add(um);
			}
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}

	@Override
	public ArrayList<String> userFriendCheckFriends(String currentUser) {

		ArrayList<String> data = new ArrayList<String>();
		try {
			Connection con = SnsDataBaseConnection.openConnection();
			String sql = "select * from friend where (frnd_to=? or frnd_from=?) and frnd_status=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, currentUser);
			ps.setString(2, currentUser);
			ps.setString(3, "quemates");
			ResultSet rs = ps.executeQuery();
			String frnd_from, frnd_to;
			while (rs.next()) {
				frnd_from = rs.getString("frnd_from");
				frnd_to = rs.getString("frnd_to");
				if (frnd_to.equals(currentUser)) {
					frnd_from = rs.getString("frnd_from");
				} else if (frnd_from.equals(currentUser)) {
					frnd_from = rs.getString("frnd_to");
				}
				data.add(frnd_from);
			}

			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}

	@Override
	public ArrayList<SnsUserFriends> userFriendIfFriends(String currentUser) {

		ArrayList<SnsUserFriends> data = new ArrayList<SnsUserFriends>();
		try {
			Connection con = SnsDataBaseConnection.openConnection();
			String sql = "select * from friend where (frnd_to=? or frnd_from=?) and frnd_status=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, currentUser);
			ps.setString(2, currentUser);
			ps.setString(3, "quemates");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				SnsUserFriends um = new SnsUserFriends();
				um.setFrnd_id(rs.getInt("frnd_id"));
				um.setFrnd_from(rs.getString("frnd_from"));
				um.setFrnd_to(rs.getString("frnd_to"));
				if ((um.getFrnd_to()).equals(currentUser)) {
					// d.frnd_from=rs.getString("frnd_from");
				} else if ((um.getFrnd_from()).equals(currentUser)) {
					um.setFrnd_from(rs.getString("frnd_to"));
				}
				um.setFrnd_to(rs.getString("frnd_to"));
				um.setFrnd_status(rs.getString("frnd_status"));
				um.setFrnd_date(rs.getString("frnd_date"));
				data.add(um);
			}
			rs.close();
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}

	@Override
	public int userFriendModify(SnsUserFriends uf) {

		int count = 0;
		try {
			Connection con = SnsDataBaseConnection.openConnection();
			String sql = "update friend set frnd_status=? where frnd_id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, uf.getFrnd_status());
			ps.setInt(2, uf.getFrnd_id());

			count = ps.executeUpdate();

			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public int userFriendDelete(SnsUserFriends uf) {

		int count = 0;
		try {
			Connection con = SnsDataBaseConnection.openConnection();
			String sql = "delete from friend where frnd_id=?";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, uf.getFrnd_id());
			count = ps.executeUpdate();
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	// --------------- *END* --------------------

	// -------------- SnsExams ------------------
	@Override
	public int examSave(SnsExams se) {

		int count = 0;
		try {
			Connection con = SnsDataBaseConnection.openConnection();
			String sql = "insert into exam(exam_name, exam_date, exam_description) values(?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, se.getExam_name());
			ps.setString(2, se.getExam_date());
			ps.setString(3, se.getExam_description());
			count = ps.executeUpdate();
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public ArrayList<SnsExams> examShowAll() {

		ArrayList<SnsExams> data = new ArrayList<SnsExams>();
		try {
			Connection con = SnsDataBaseConnection.openConnection();
			String sql = "select * from exam ";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				SnsExams es = new SnsExams();
				es.setExam_name(rs.getString("exam_name"));
				es.setExam_date(rs.getString("exam_date"));
				es.setExam_description(rs.getString("exam_description"));
				data.add(es);
			}

			rs.close();
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}

	@Override
	public int examDelete(SnsExams se) {

		int count = 0;
		try {
			Connection con = SnsDataBaseConnection.openConnection();
			String sql = "delete from exam where exam_name=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, se.getExam_name());
			count = ps.executeUpdate();
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public ArrayList<SnsExams> examView(SnsExams se) {

		ArrayList<SnsExams> data = new ArrayList<SnsExams>();
		try {
			Connection con = SnsDataBaseConnection.openConnection();
			String sql = "select * from exam where exam_name=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, se.getExam_name());
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				SnsExams es = new SnsExams();
				es.setExam_id(rs.getInt("exam_id"));
				es.setExam_name(rs.getString("exam_name"));
				es.setExam_date(rs.getString("exam_date"));
				es.setExam_description(rs.getString("exam_description"));
				data.add(es);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}

	@Override
	public int examModify(SnsExams se) {

		int count = 0;
		try {
			Connection con = SnsDataBaseConnection.openConnection();
			String sql = "update exam set exam_name=?,exam_date=?,exam_description=? where exam_id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, se.getExam_name());
			ps.setString(2, se.getExam_date());
			ps.setString(3, se.getExam_description());
			ps.setInt(4, se.getExam_id());
			count = ps.executeUpdate();
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	// --------------- *END* --------------------

	// -------------- SnsAdvertisements ------------------
	@Override
	public int addSave(SnsAdvertisements sa) {
		int count = 0;
		try {
			Connection con = SnsDataBaseConnection.openConnection();
			String sql = "insert into advertisement(add_title, add_date, add_description) values(?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, sa.getAdd_title());
			ps.setString(2, sa.getAdd_date());
			ps.setString(3, sa.getAdd_description());
			count = ps.executeUpdate();

			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public ArrayList<SnsAdvertisements> addShowAll() {

		ArrayList<SnsAdvertisements> data = new ArrayList<SnsAdvertisements>();
		try {
			Connection con = SnsDataBaseConnection.openConnection();
			String sql = "select * from advertisement order by add_id desc";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				SnsAdvertisements as = new SnsAdvertisements();
				as.setAdd_title(rs.getString("add_title"));
				as.setAdd_date(rs.getString("add_date"));
				as.setAdd_description(rs.getString("add_description"));
				data.add(as);
			}

			rs.close();
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}

	@Override
	public int addDelete(SnsAdvertisements sa) {
		int count = 0;
		try {
			Connection con = SnsDataBaseConnection.openConnection();
			String sql = "delete from advertisement where add_title=?";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, sa.getAdd_title());
			count = ps.executeUpdate();
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public ArrayList<SnsAdvertisements> addView(SnsAdvertisements sa) {

		ArrayList<SnsAdvertisements> data = new ArrayList<SnsAdvertisements>();
		try {
			Connection con = SnsDataBaseConnection.openConnection();
			String sql = "select * from advertisement where add_title=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, sa.getAdd_title());
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				SnsAdvertisements as = new SnsAdvertisements();
				as.setAdd_id(rs.getInt("add_id"));
				as.setAdd_title(rs.getString("add_title"));
				as.setAdd_date(rs.getString("add_date"));
				as.setAdd_description(rs.getString("add_description"));
				data.add(as);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}

	@Override
	public int addModify(SnsAdvertisements sa) {
		int count = 0;
		try {
			Connection con = SnsDataBaseConnection.openConnection();
			String sql = "update advertisement set add_title=?,add_date=?,add_description=? where add_id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, sa.getAdd_title());
			ps.setString(2, sa.getAdd_date());
			ps.setString(3, sa.getAdd_description());
			ps.setInt(4, sa.getAdd_id());
			count = ps.executeUpdate();

			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	// --------------- *END* --------------------
}
