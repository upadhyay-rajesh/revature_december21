package com.facebookboot.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.facebookboot.entity.FacebookUser;

@Repository
public interface FacebookDAOInterface extends JpaRepository<FacebookUser, String>{
	
	
	@Query("from com.facebookboot.entity.FacebookUser ff where ff.address=:cc")
	public FacebookUser serachUserByCity(@Param("cc") String cityName);

}
