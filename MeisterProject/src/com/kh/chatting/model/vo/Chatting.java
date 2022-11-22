package com.kh.chatting.model.vo;

import java.util.Date;

public class Chatting {
	private int chatNo;
	private String chatContent;
	private String chatDate;
	private int sender;
	private int receiver;
	private int sellNo;
	
	public Chatting(int chatNo, String chatContent, String chatDate, int sender, int receiver, int sellNo) {
		super();
		this.chatNo = chatNo;
		this.chatContent = chatContent;
		this.chatDate = chatDate;
		this.sender = sender;
		this.receiver = receiver;
		this.sellNo = sellNo;
	}
	
	public int getChatNo() {
		return chatNo;
	}
	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}
	public String getChatContent() {
		return chatContent;
	}
	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}
	public String getChatDate() {
		return chatDate;
	}
	public void setChatDate(String chatDate) {
		this.chatDate = chatDate;
	}
	public int getSender() {
		return sender;
	}
	public void setSender(int sender) {
		this.sender = sender;
	}
	public int getReceiver() {
		return receiver;
	}
	public void setReceiver(int receiver) {
		this.receiver = receiver;
	}
	public int getSellNo() {
		return sellNo;
	}
	public void setSellNo(int sellNo) {
		this.sellNo = sellNo;
	}

	@Override
	public String toString() {
		return "Chatting [chatNo=" + chatNo + ", chatContent=" + chatContent + ", chatDate=" + chatDate + ", sender="
				+ sender + ", receiver=" + receiver + ", sellNo=" + sellNo + "]";
	}
	
	
	
}
