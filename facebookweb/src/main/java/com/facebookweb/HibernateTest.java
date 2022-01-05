package com.facebookweb;

import java.util.List;

import javax.persistence.EntityTransaction;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.facebookweb.dao.FacebookDAO;
import com.facebookweb.entity.FacebookUser;

public class HibernateTest {

	public static void main(String[] args) {
		//SessionFactory sf=new Configuration().configure().buildSessionFactory();
		//Session factory object internely using factory design pattern and singelton design pattern i.e. session factory will be singelton and threadsafe
		//configure() method will serach for hibernate.cfg.xml file and load it.
		//buildSessionFactory() method will take information from hibernate.cfg.xml file and create database connection, create table
		
		//Session ss=sf.openSession();
		//to do any task we must create session i.e. one session per task
		
		/*
		 * FacebookUser fb=new FacebookUser(); fb.setName("Nayan");
		 * fb.setPassword("pppp"); fb.setEmail("nayan@gmail.com");
		 * fb.setAddress("Pune");
		 * 
		 * EntityTransaction et=ss.getTransaction(); et.begin();
		 * 
		 * ss.save(fb); et.commit(); System.out.println("profile created successfully");
		 */
		
		FacebookDAO fd=new FacebookDAO();
		List<FacebookUser> ff=fd.getAllProfile();
		for(FacebookUser f:ff) {
			System.out.println(f.getName());
		}

	}

}











