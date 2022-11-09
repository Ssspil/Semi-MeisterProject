package com.kh.common.model.vo;

public class Interest {
	
    private int InterestNo;
    private String InterestName;
    
    public Interest () {
    	
    }

	public Interest(int interestNo, String interestName) {
		super();
		InterestNo = interestNo;
		InterestName = interestName;
	}

	public int getInterestNo() {
		return InterestNo;
	}

	public void setInterestNo(int interestNo) {
		InterestNo = interestNo;
	}

	public String getInterestName() {
		return InterestName;
	}

	public void setInterestName(String interestName) {
		InterestName = interestName;
	}

	@Override
	public String toString() {
		return "Interest [InterestNo=" + InterestNo + ", InterestName=" + InterestName + "]";
	}
    
    
}
