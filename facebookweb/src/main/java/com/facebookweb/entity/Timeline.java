package com.facebookweb.entity;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="Facebooktimeline")
public class Timeline {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long timelineId;
	
	private String sender_id;
	private String receiver_id;
	private String message;
	private LocalDate mdate;
	
	@ManyToOne
	private FacebookUser fuser;

	public long getTimelineId() {
		return timelineId;
	}

	public void setTimelineId(long timelineId) {
		this.timelineId = timelineId;
	}

	public String getSender_id() {
		return sender_id;
	}

	public void setSender_id(String sender_id) {
		this.sender_id = sender_id;
	}

	public String getReceiver_id() {
		return receiver_id;
	}

	public void setReceiver_id(String receiver_id) {
		this.receiver_id = receiver_id;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public LocalDate getMdate() {
		return mdate;
	}

	public void setMdate(LocalDate mdate) {
		this.mdate = mdate;
	}

	public FacebookUser getFuser() {
		return fuser;
	}

	public void setFuser(FacebookUser fuser) {
		this.fuser = fuser;
	}
	
	
	
	
	

}
