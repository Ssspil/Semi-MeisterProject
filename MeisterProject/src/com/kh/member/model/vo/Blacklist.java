package com.kh.member.model.vo;

import java.util.Date;

public class Blacklist {
	
	private int userNo;
	private Date enrollDate;
	private String reason;
	
	public Blacklist() {
		
	}

	public Blacklist(int userNo, Date enrollDate, String reason) {
		super();
		this.userNo = userNo;
		this.enrollDate = enrollDate;
		this.reason = reason;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}
	
	
}
