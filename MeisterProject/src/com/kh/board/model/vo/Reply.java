package com.kh.board.model.vo;

import com.kh.common.model.vo.Attachment;

public class Reply {

	private int replyNo;
	private int replyCount;
	private String replyContent;
	private String replyDate;
	private int boardNo;
	private int userNo;
	private String mbNic;
	private String boardTitle;
	private String status;
	private Attachment at;
	private String userId;

	
	
	public Reply(){
		
	}

	
	public Reply(int replyNo, int replyCount, String replyContent, String replyDate, int boardNo, int userNo,
			String mbNic) {
		super();
		this.replyNo = replyNo;
		this.replyCount = replyCount;
		this.replyContent = replyContent;
		this.replyDate = replyDate;
		this.boardNo = boardNo;
		this.userNo = userNo;
		this.mbNic = mbNic;
		
	}

	// 댓글 리스트
	public Reply(int replyNo, String replyContent, int userNo, String mbNic, String replyDate) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.replyDate = replyDate;
		this.userNo = userNo;
		this.mbNic = mbNic;
	}
	
	public Reply(int replyNo, String user_id, String mbNic, String replyDate, String replyContent, String status) {
		super();
		this.replyNo = replyNo;
		this.userId = user_id;
		this.mbNic = mbNic;
		this.replyDate = replyDate;
		this.replyContent = replyContent;
		this.status = status;
	}
	
	// 댓글 등록
	public Reply(int replyNo, String replyContent, int userNo, String replyDate) {
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.userNo = userNo;
		this.replyDate = replyDate;
	}
	
	//내 댓글 보기
	public Reply(int replyNo,int boardNo,String boardTitle, String replyContent, String replyDate, int userNo) {
		super();
		this.replyNo = replyNo;
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.replyContent = replyContent;
		this.replyDate = replyDate;
		this.userNo = userNo;
	}
	
//	public Reply(int boardNo,int replyNo, String userId, String mbNic , String replyDate, String replyContent, String status) {
//		super();
//		this.boardNo = boardNo;
//		this.replyNo = replyNo;
//		this.userId = userId;
//		this.mbNic = mbNic;
//		this.replyDate = replyDate;
//		this.replyContent = replyContent;
//		this.status = status;
//	}

	public String getBoardTitle() {
		return boardTitle;
	}


	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}


	public String getMbNic() {
		return mbNic;
	}


	public void setMbNic(String mbNic) {
		this.mbNic = mbNic;
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
				+ ", replyDate=" + replyDate + ", boardNo=" + boardNo + ",boardTitle=" + boardTitle +", userNo=" + userNo +  ", user_Id=" + userId + ",]";
	}


	public Attachment getAt() {
		return at;
	}


	public void setAt(Attachment at) {
		this.at = at;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}

}
