package com.kh.sellboard.model.vo;

public class Local {
	
	private int localNo;
	private String localName;
	
	public Local() {
		super();
	}
	
	public Local(int localNo, String localName) {
		super();
		this.localNo = localNo;
		this.localName = localName;
	}
	
	public int getLocalNo() {
		return localNo;
	}
	public void setLocalNo(int localNo) {
		this.localNo = localNo;
	}
	public String getLocalName() {
		return localName;
	}
	public void setLocalName(String localName) {
		this.localName = localName;
	}
	
	

	

}
