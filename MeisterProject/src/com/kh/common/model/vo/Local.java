package com.kh.common.model.vo;

public class Local {

	private int LocalNo;
	private String localName;
	
	public Local() {
		super();
	}

	public Local(int localNo, String localName) {
		super();
		LocalNo = localNo;
		this.localName = localName;
	}

	public int getLocalNo() {
		return LocalNo;
	}

	public void setLocalNo(int localNo) {
		LocalNo = localNo;
	}

	public String getLocalName() {
		return localName;
	}

	public void setLocalName(String localName) {
		this.localName = localName;
	}

	@Override
	public String toString() {
		return "Local [LocalNo=" + LocalNo + ", localName=" + localName + "]";
	}
	
	
}
