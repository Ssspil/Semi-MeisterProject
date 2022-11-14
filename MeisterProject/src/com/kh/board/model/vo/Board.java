package com.kh.board.model.vo;

public class Board {
	private int boardNo;
	private String boardTitle;
	private int boardType;
	private String boardContent;
	private int boardCount;
	private int boardRecommend;
	private String boardString;
	private String status;
	private int userNo;
	private String titleImg;	// 커뮤니티 게시판에 썸네일 표시용
	
	
	
	public Board() {
		
	}
	
	// 기본생성자
	public Board(int boardNo, String boardTitle,int boardType, String boardContent, int boardCount, int boardRecommend,
			String boardString, String status, int userNo, String titleImg) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardType = boardType;
		this.boardContent = boardContent;
		this.boardCount = boardCount;
		this.boardRecommend = boardRecommend;
		this.boardString = boardString;
		this.status = status;
		this.userNo = userNo;
		this.titleImg = titleImg;
	}
	
	// 유홍상
	
	
	// 이이수
	public Board(int boardNo, String boardContent,String boardTitle,int boardCount,int boardRecommend , int userNo,String boardString,String titleImg) {
		super();
		this.boardNo = boardNo;
		this.boardContent = boardContent;
		this.boardTitle = boardTitle;
		this.boardCount = boardCount;
		this.boardRecommend = boardRecommend;
		this.userNo = userNo;
		this.boardString = boardString;
		this.titleImg = titleImg;
		
	}
	
	// 게시글 수정 부분 생성자
	public Board(int boardNo, String boardTitle, String boardContent, String boardString, int userNO) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardString = boardString;
		this.userNo = userNO;
	}
	
	// 게시글 목록 불러오기 부분 생성자
	// title Img는 sql문에서 Attachment 테이블과 조인해서 FILE_PATH || CHANGE_NAME을 가져옵니다
	public Board(int boardNo,String boardContent, String boardTitle,int boardType, int boardCount, int boardRecommend, int userNo,String boardString,
			String status, String titleImg) {
		super();
		this.boardNo = boardNo;
		this.boardContent =  boardContent;
		this.boardTitle = boardTitle;
		this.boardCount = boardCount;
		this.boardRecommend = boardRecommend;
		this.userNo = userNo;
		this.boardString = boardString;
		this.status = status;
		this.titleImg = titleImg;
	}
	public Board(int boardNo,String boardContent, String boardTitle,int boardType, int boardCount, int boardRecommend, int userNo,String boardString) {
		super();
		this.boardNo = boardNo;
		this.boardContent =  boardContent;
		this.boardTitle = boardTitle;
		this.boardCount = boardCount;
		this.boardRecommend = boardRecommend;
		this.userNo = userNo;
		this.boardString = boardString;

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

	public String getBoardString() {
		return boardString;
	}

	public void setBoardString(String boardString) {
		this.boardString = boardString;
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
				+ ", boardCount=" + boardCount + ", boardRecommend=" + boardRecommend + ", boardString=" + boardString
				+ ", status=" + status + ", userNo=" + userNo + ", titleImg=" + titleImg + "]";
	}
	
	
	
	
	
	
	
}
