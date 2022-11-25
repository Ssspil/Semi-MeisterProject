package com.kh.sellboard.model.vo;

public class Transaction {
	
	private int sellNo;
	private int userNo;
	private int reviewNo;
	private String status;

	public Transaction() {
		
	}

	public Transaction(int sellNo, int userNo, int reviewNo) {
		super();
		this.sellNo = sellNo;
		this.userNo = userNo;
		this.reviewNo = reviewNo;

	}

	public int getSellNo() {
		return sellNo;
	}

	public void setSellNo(int sellNo) {
		this.sellNo = sellNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	
	public String getStatus() {
		return status;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Transaction [sellNo=" + sellNo + ", userNo=" + userNo + ", reviewNo=" + reviewNo + ", status=" + status + "]";
	}
	
	

}
