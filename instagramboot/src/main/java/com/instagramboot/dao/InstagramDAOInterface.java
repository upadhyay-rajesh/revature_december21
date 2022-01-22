package com.instagramboot.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.instagramboot.entity.InstagramUser;

@Repository
public interface InstagramDAOInterface extends JpaRepository<InstagramUser, String>{

}
