package com.facebookweb.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.facebookweb.entity.FacebookUser;

public class FacebookDAO implements FacebookDAOInterface {
	
	private SessionFactory sf;
	
	public FacebookDAO() {
		sf=new Configuration().configure().buildSessionFactory();
	}

	public int createProfileDAO(FacebookUser fb) {
		int i=0;
		
		Session ss=sf.openSession();
		EntityTransaction et=ss.getTransaction();
		et.begin();
			ss.save(fb);
		et.commit();
		i=1;
		
		/*
		 * try { Class.forName("oracle.jdbc.driver.OracleDriver"); Connection
		 * con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE",
		 * "system","rajesh"); PreparedStatement
		 * ps=con.prepareStatement("insert into facebookuser values(?,?,?,?)");
		 * ps.setString(1, fb.getName()); ps.setString(2, fb.getPassword());
		 * ps.setString(3, fb.getEmail()); ps.setString(4, fb.getAddress());
		 * i=ps.executeUpdate();
		 * 
		 * } catch(ClassNotFoundException|SQLException e) { e.printStackTrace(); }
		 */
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
	
	public List<FacebookUser> getAllProfile(){
		Session ss=sf.openSession();
		Query q=ss.createQuery("from com.facebookweb.entity.FacebookUser f");
		List<FacebookUser> ll=q.getResultList();
		return ll;
	}
	
	public int updateProfile(FacebookUser f) {
		Session ss=sf.openSession();
		Query q=ss.createQuery("update com.facebookweb.entity.FacebookUser f set f.name=:nn where f.email=:em");
		q.setParameter("nn", f.getName());
		q.setParameter("em", f.getEmail());
		int i=q.executeUpdate();
		return i;
		
	}
	
	public int deleteProfile(FacebookUser f) {
		Session ss=sf.openSession();
		Query q=ss.createQuery("delete from com.facebookweb.entity.FacebookUser f where f.email=:em");
		q.setParameter("em", f.getEmail());
		int i=q.executeUpdate();
		return i;
		
	}
}










