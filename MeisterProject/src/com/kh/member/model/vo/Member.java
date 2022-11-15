package com.kh.member.model.vo;

import java.util.Date;

public class Member {
	private int userNo;
	private String userId;
	private String userPwd;
	private String nickName;
	private String interest;
	private Date enrollDate;
	private String userName;
	private String gender;
	private String email;
	private String phone;
	private String status;
	private String blackList;
	private String speciality;
	private String expSubmit;
	private String expert;
	private String profileImg;
	
	// 기본 생성자
	public Member() {
		
	}

	// 로그인 부분 생성자
	public Member(int userNo, String userId, String userPwd, String nickName, String interest, Date enrollDate,
			String userName, String gender, String email, String phone, String status, String blackList,
			String speciality, String expSubmit, String expert) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.nickName = nickName;
		this.interest = interest;
		this.enrollDate = enrollDate;
		this.userName = userName;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.status = status;
		this.blackList = blackList;
		this.speciality = speciality;
		this.expSubmit = expSubmit;
		this.expert = expert;
	}

	// 일반 유저 회원가입 부분 생성자
	public Member(String userId, String userPwd, String nickName, String interest) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.nickName = nickName;
		this.interest = interest;
	}

	// 전문가 인증 부분 생성자
	// 아이디를 조건문으로 사용, UPDATE 문으로 나머지 값들 삽입	
	public Member(String userId, String userName, String gender, String email, String phone, String speciality,
			String expSubmit) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.speciality = speciality;
		this.expSubmit = expSubmit;
	}

	// 개인정보 수정 부분 생성자
	public Member(String userId, String nickName, String interest, String userName, String email, String phone) {
		super();
		this.userId = userId;
		this.nickName = nickName;
		this.interest = interest;
		this.userName = userName;
		this.email = email;
		this.phone = phone;
	}
	// 관리자가 회원정보 수정부분 생성자1
	public Member(int userNo, String userId, String userPwd, String nickName, String interest, String userName,
			String gender, String email, String phone, String speciality, String expert) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.nickName = nickName;
		this.interest = interest;
		this.userName = userName;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.speciality = speciality;
		this.expert = expert;
	}
	// 관리자가 회원정보 수정부분 생성자2
	public Member(int userNo, String userId, String userPwd, String nickName, String interest, String expert) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.nickName = nickName;
		this.interest = interest;
		this.expert = expert;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getInterest() {
		return interest;
	}

	public void setInterest(String interest) {
		this.interest = interest;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getSpeciality() {
		return speciality;
	}

	public void setSpeciality(String speciality) {
		this.speciality = speciality;
	}

	public String getExpert() {
		return expert;
	}

	public void setExpert(String expert) {
		this.expert = expert;
	}

	public String getProfileImg() {
		return profileImg;
	}
	
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	
	public String getBlackList() {
		return blackList;
	}

	public void setBlackList(String blackList) {
		this.blackList = blackList;
	}

	public String getExpSubmit() {
		return expSubmit;
	}

	public void setExpSubmit(String expSubmit) {
		this.expSubmit = expSubmit;
	}

	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", nickName=" + nickName
				+ ", interest=" + interest + ", enrollDate=" + enrollDate + ", userName=" + userName + ", gender="
				+ gender + ", email=" + email + ", phone=" + phone + ", status=" + status + ", blackList=" + blackList
				+ ", speciality=" + speciality + ", expSubmit=" + expSubmit + ", expert=" + expert+"]";
	}
	
	

	
	

	
}
