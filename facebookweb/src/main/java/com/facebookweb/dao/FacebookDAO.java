package com.facebookweb.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.facebookweb.entity.FacebookUser;

public class FacebookDAO implements FacebookDAOInterface {

	public int createProfileDAO(FacebookUser fb) {
		int i=0;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","rajesh");
			PreparedStatement ps=con.prepareStatement("insert into facebookuser values(?,?,?,?)");
			ps.setString(1, fb.getName());
			ps.setString(2, fb.getPassword());
			ps.setString(3, fb.getEmail());
			ps.setString(4, fb.getAddress());
			i=ps.executeUpdate();
			
		}
		catch(ClassNotFoundException|SQLException e) {
			e.printStackTrace();
		}
		return i;
	}

	@Override
	public boolean loginProfileDAO(FacebookUser fb) {
		boolean b=false;
		try {
			System.out.println(fb.getEmail()+fb.getPassword());
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","rajesh");
			PreparedStatement ps=con.prepareStatement("select * from facebookuser where email=? and password=?");
			ps.setString(1, fb.getEmail());
			ps.setString(2, fb.getPassword());
			
			
			ResultSet i=ps.executeQuery();
			if(i.next()) {
				b=true;
			}
			
		}
		catch(ClassNotFoundException|SQLException e) {
			e.printStackTrace();
		}
		return b;
	}

}
