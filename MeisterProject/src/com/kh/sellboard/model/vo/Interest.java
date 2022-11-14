package com.kh.sellboard.model.vo;

public class Interest {
	
	private int interestNo;
	private String interestName;
	
	public Interest() {
		super();
	}
	
	public Interest(int interestNo, String interestName) {
		super();
		this.interestNo = interestNo;
		this.interestName = interestName;
	}
	
	public int getInterestNo() {
		return interestNo;
	}

	public void setInterestNo(int interestNo) {
		this.interestNo = interestNo;
	}

	public String getInterestName() {
		return interestName;
	}

	public void setInterestName(String interestName) {
		this.interestName = interestName;
	}

	

	
	
	

}
