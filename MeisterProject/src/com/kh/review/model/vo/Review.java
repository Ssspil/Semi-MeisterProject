package com.kh.review.model.vo;

import java.util.Date;

public class Review {
	private int reviewNo;
	private String reviewContent;
	private double avg;
	private String reviewDate;
	private int userNo;
	private int sellNo;
	private String nickname;
	
	public Review() {
		super();
	}
	
	public Review(int reviewNo, String reviewContent, double avg, String reviewDate, int userNo, int sellNo) {
		super();
		this.reviewNo = reviewNo;
		this.reviewContent = reviewContent;
		this.avg = avg;
		this.reviewDate = reviewDate;
		this.userNo = userNo;
		this.sellNo = sellNo;
	}
	
	

	public Review(String reviewContent, double avg, int userNo, int sellNo) {
		super();
		this.reviewContent = reviewContent;
		this.avg = avg;
		this.userNo = userNo;
		this.sellNo = sellNo;
	}
	
	public Review(int reviewNo, String reviewContent, double avg, String reviewDate, int sellNo, String nickname) {
		super();
		this.reviewNo = reviewNo;
		this.reviewContent = reviewContent;
		this.avg = avg;
		this.reviewDate = reviewDate;
		this.sellNo = sellNo;
		this.nickname = nickname;
	}





	public String getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}



	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public double getAvg() {
		return avg;
	}

	public void setAvg(double avg) {
		this.avg = avg;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getSellNo() {
		return sellNo;
	}

	public void setSellNo(int sellNo) {
		this.sellNo = sellNo;
	}
	
	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", reviewContent=" + reviewContent + ", avg=" + avg + ", reviewDate="
				+ reviewDate + ", userNo=" + userNo + ", sellNo=" + sellNo + "]";
	}
	
	
	
	
	
}
