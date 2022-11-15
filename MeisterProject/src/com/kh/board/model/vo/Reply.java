package com.kh.board.model.vo;

public class Reply {

	private int replyNo;
	private int replyCount;
	private String replyContent;
	private String replyDate;
	private int boardNo;
	private int userNo;
	
	
	public Reply(){
		
	}


	public Reply(int replyNo, int replyCount, String replyContent, String replyDate, int boardNo, int userNo) {
		super();
		this.replyNo = replyNo;
		this.replyCount = replyCount;
		this.replyContent = replyContent;
		this.replyDate = replyDate;
		this.boardNo = boardNo;
		this.userNo = userNo;
	}


	public int getReplyNo() {
		return replyNo;
	}


	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}


	public int getReplyCount() {
		return replyCount;
	}


	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}


	public String getReplyContent() {
		return replyContent;
	}


	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}


	public String getReplyDate() {
		return replyDate;
	}


	public void setReplyDate(String replyDate) {
		this.replyDate = replyDate;
	}


	public int getBoardNo() {
		return boardNo;
	}


	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", replyCount=" + replyCount + ", replyContent=" + replyContent
				+ ", replyDate=" + replyDate + ", boardNo=" + boardNo + ", userNo=" + userNo + "]";
	}
	
	
}
