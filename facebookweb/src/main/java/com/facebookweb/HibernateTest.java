package com.facebookweb;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityTransaction;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.facebookweb.dao.FacebookDAO;
import com.facebookweb.entity.FacebookUser;
import com.facebookweb.entity.Timeline;

public class HibernateTest {

	public static void main(String[] args) {
		SessionFactory sf=new Configuration().configure().buildSessionFactory();
		//Session factory object internely using factory design pattern and singelton design pattern i.e. session factory will be singelton and threadsafe
	//	configure() method will serach for hibernate.cfg.xml file and load it.
	//	buildSessionFactory() method will take information from hibernate.cfg.xml file and create database connection, create table
		
		Session ss=sf.openSession();
		//to do any task we must create session i.e. one session per task
		
		
		  FacebookUser fb=new FacebookUser(); 
		  fb.setName("Nayan");
		  fb.setPassword("pppp"); 
		  fb.setEmail("nayan@gmail.com");
		  fb.setAddress("Pune");
		  
		  Timeline t=new Timeline();
		  t.setReceiver_id("r001");
		  t.setSender_id("r005");
		  t.setMdate(LocalDate.now());
		  t.setMessage("hello how are you?");
		  t.setFuser(fb);
		  
		  Timeline t1=new Timeline();
		  t1.setReceiver_id("r0011");
		  t1.setSender_id("r0051");
		  t1.setMdate(LocalDate.now());
		  t1.setMessage("hello how are you dsvsdfsd  v?");
		  t1.setFuser(fb);
		  
		  List<Timeline> timeline=new ArrayList<Timeline>();
		  timeline.add(t);
		  timeline.add(t1);
		  
		  fb.setTimeline(timeline);
		  
		  EntityTransaction et=ss.getTransaction(); et.begin();
		  ss.save(t);
		  ss.save(t1);
		  ss.save(fb); 
		  et.commit(); 
		  System.out.println("profile created successfully");
		 
		
			/*
			 * FacebookDAO fd=new FacebookDAO(); List<FacebookUser> ff=fd.getAllProfile();
			 * for(FacebookUser f:ff) { System.out.println(f.getName()); }
			 */

	}

}











