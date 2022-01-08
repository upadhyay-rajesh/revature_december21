package com.facebooklive.dao;

import java.util.List;

import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.facebooklive.entity.FacebookUser;
import com.facebooklive.entity.TimeLine;

public class FacebookDAO implements FacebookDAOInterface {
	private SessionFactory sf;

	public FacebookDAO() {
		sf = new Configuration().configure().buildSessionFactory();
	}

	@Override
	public int createProfileDAO(FacebookUser fb) {
		int i = 0;
		Session s = sf.openSession();
		EntityTransaction et = s.getTransaction();
		et.begin();
		s.save(fb);
		et.commit();
		i = 1;
		return i;
	}

	@Override
	public int loginProfileDAO(FacebookUser fb) {
		int i = 0;
		Session s = sf.openSession();
		Query q = s.createQuery("from com.facebooklive.entity.FacebookUser f where f.email=:em and f.password=:pw");
		q.setParameter("em", fb.getEmail());
		q.setParameter("pw", fb.getPassword());
		FacebookUser ff = (FacebookUser) q.getSingleResult();

		if (ff != null) {
			i = 1;
		}

		return i;
	}

	@Override
	public List<TimeLine> timelineDAO(FacebookUser fb) {
		Session s = sf.openSession();
		Query q = s.createQuery("from com.facebooklive.entity.TimeLine f");
				
		List<TimeLine> ll=q.getResultList();
		System.out.println(ll.size());
		return ll;
	}

}
