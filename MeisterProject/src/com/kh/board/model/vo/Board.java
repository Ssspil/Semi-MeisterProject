package com.kh.board.model.vo;
public class Board {
   private int boardNo;
   private String boardTitle;
   private int boardType;
   private String boardContent;
   private int boardCount;
   private int boardRecommend;
   private String boardDate;
   private String status;
   private int userNo;
   private String titleImg;
   private int replyCount;   // 커뮤니티 게시판에 썸네일 표시용
   private String memberNic;
   private String userId;
   
   
   public String getUserId() {
	return userId;
}
public void setUserId(String userId) {
	this.userId = userId;
}
public Board() {
	   
   }
   // 이이수 hot list
   public Board(int boardNo, String boardTitle,int boardType, String boardContent, int boardCount, int boardRecommend,
         String boardDate, int userNo, int replyCount) {
      super();
      this.boardNo = boardNo;
      this.boardTitle = boardTitle;
      this.boardType = boardType;
      this.boardContent = boardContent;
      this.boardCount = boardCount;
      this.boardRecommend = boardRecommend;
      this.boardDate = boardDate;
      this.userNo = userNo;
      this.replyCount = replyCount;
      
     
   }
   
   //  이이수 LIST
   public Board(int boardNo,String boardTitle,int boardType,String boardContent, int boardCount, int boardRecommend, int userNo,int replyCount, String boardDate) {
	      super();
	      this.boardNo = boardNo;
	      this.boardTitle = boardTitle;
	      this.boardType = boardType;
	      this.boardContent =  boardContent;
	      this.boardCount = boardCount;
	      this.boardRecommend = boardRecommend;
	      this.userNo = userNo;
	      this.replyCount = replyCount;
	      this.boardDate = boardDate;
	 
	   }
   
   // 유홍상
   // 게시글 등록
   public Board(int boardNo, String boardTitle, String boardContent, int userNo, int boardType) {
      super();
      this.boardNo = boardNo;
      this.boardTitle = boardTitle;
      this.boardContent = boardContent;
      this.userNo = userNo;
      this.boardType=boardType;


   }
   
   // 게시글 수정 부분 생성자
   public Board(int boardNo, String boardTitle, String boardContent) {
      super();
      this.boardNo = boardNo;
      this.boardTitle = boardTitle;
      this.boardContent = boardContent;
   }
   
   // 게시글 상세보기
   public Board(int boardNo, String boardTitle, String boardContent, int boardRecommend, int userNo, String boardDate, String memberNic) {
	   super();
      this.boardNo = boardNo;
      this.boardTitle = boardTitle;
      this.boardContent = boardContent;
      this.boardRecommend = boardRecommend;
      this.userNo = userNo;
      this.boardDate = boardDate;
      this.memberNic = memberNic;
      
   }
   
   //내 커뮤니티 게시글 보기
   public Board(int boardNo,String boardTitle,String boardContent, int replyCount,int userNo,int boardRecommend,String boardDate) {
	      super();
	      this.boardNo = boardNo;
	      this.boardTitle = boardTitle;
	      this.boardContent =  boardContent;
	      this.replyCount = replyCount;
	      this.userNo = userNo;
	      this.boardRecommend = boardRecommend; 
	      this.boardDate = boardDate;
	   }

   
   public Board(int boardNo,String boardContent, String boardTitle, int boardCount, int boardRecommend, int userNo
         ) {
      super();
      this.boardNo = boardNo;
      this.boardContent =  boardContent;
      this.boardTitle = boardTitle;
      this.boardCount = boardCount;
      this.boardRecommend = boardRecommend;
      this.userNo = userNo;

   }
   
   	// 메인페이지에 쓸 생성자
   public Board(int boardNo, String boardTitle, int boardType, String boardContent, int boardCount, int boardRecommend,
			int replyCount) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardType = boardType;
		this.boardContent = boardContent;
		this.boardCount = boardCount;
		this.boardRecommend = boardRecommend;
		this.replyCount = replyCount;
	}

 // BoardList
	public Board(int boardNo, String userId, String memberNic, String boardTitle, String boardDate, String boardContent, String status) {
	super();
	this.boardNo = boardNo;
	this.userId = userId;
	this.memberNic = memberNic;
	this.boardTitle = boardTitle;
	this.boardDate = boardDate;
	this.boardContent = boardContent;
	this.status = status;
}
	public int getReplyCount() {
		return replyCount;
	}


public void setReplyCount(int replyCount) {
      this.replyCount = replyCount;
   }

   public int getBoardNo() {
      return boardNo;
   }

   public void setBoardNo(int boardNo) {
      this.boardNo = boardNo;
   }

   public String getBoardTitle() {
      return boardTitle;
   }

   public void setBoardTitle(String boardTitle) {
      this.boardTitle = boardTitle;
   }
   public int getBoardType() {
      return boardType;
   }

   public void setBoardType(int boardType) {
      this.boardType = boardType;
   }

   public String getBoardContent() {
      return boardContent;
   }

   public void setBoardContent(String boardContent) {
      this.boardContent = boardContent;
   }

   public int getBoardCount() {
      return boardCount;
   }

   public void setBoardCount(int boardCount) {
      this.boardCount = boardCount;
   }

   public int getBoardRecommend() {
      return boardRecommend;
   }

   public void setBoardRecommend(int boardRecommend) {
      this.boardRecommend = boardRecommend;
   }

   public String getBoardDate() {
      return boardDate;
   }

   public void setBoardDate(String boardDate) {
      this.boardDate = boardDate;
   }

   public String getStatus() {
      return status;
   }

   public void setStatus(String status) {
      this.status = status;
   }

   public int getUserNo() {
      return userNo;
   }

   public void setUserNo(int userNo) {
      this.userNo = userNo;
   }

   public String getTitleImg() {
      return titleImg;
   }

   public void setTitleImg(String titleImg) {
      this.titleImg = titleImg;
   }

   @Override
   public String toString() {
      return "Board [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardType=" + boardType +", boardContent=" + boardContent
            + ", boardCount=" + boardCount + ", boardRecommend=" + boardRecommend + ", boardDate=" + boardDate
            + ", status=" + status + ", userNo=" + userNo + ",userId=" + userId + ", titleImg=" + titleImg + ", replyCount=" + replyCount + "]";
   }

   public String getMemberNic() {
      return memberNic;
   }

   public void setMemberNic(String memberNic) {
      this.memberNic = memberNic;
   }
   
   

   
}