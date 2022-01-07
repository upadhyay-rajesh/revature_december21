package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.entity.SnsAdmin;
import com.helper.SnsDataBaseConnection;

public class SnsDaoAdminImpl implements SnsDaoAdminInterface {

	@Override
	public ArrayList<SnsAdmin> login(SnsAdmin sa) {

		ArrayList<SnsAdmin> data = new ArrayList<SnsAdmin>();
		try {
			Connection con = SnsDataBaseConnection.openConnection();
			String q = "select * from admin where admin_name=? and admin_pass=?";
			PreparedStatement ps = con.prepareStatement(q);
			ps.setString(1, sa.getAdmin_name());
			ps.setString(2, sa.getAdmin_pass());
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				SnsAdmin d = new SnsAdmin();
				data.add(d);
			}
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}
	@Override
	public void change_password(SnsAdmin sa) {
		
		try {
		Connection con = SnsDataBaseConnection.openConnection();
		String sql = "update admin set admin_pass=? where admin_name=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(2, sa.getAdmin_name());
		ps.setString(1, sa.getAdmin_pass());
		ps.executeUpdate();
		ps.close();
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	}

}
