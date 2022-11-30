package com.kh.sellboard.model.vo;

import java.util.Date;

public class SellBoard {
	private int sellNo;
	private String sellTitle;
	private String sellContent;
	private int price;
	private int sellCount;
	private int sellRecommend;
	private Date sellDate;
	private String status;
	private int userNO;
	private String titleImg;	// 판매 게시판에 썸네일 표시용
	private int localNo;
	private int interestNo;
	private String nickname;
	private String changeName;
	private String filePath;
	private String interestName;
	private String sellDetail;
	private String sellRegulation;
	private String userId;
	private String localName;
	
	
	
	public SellBoard() {
		
	}
	

	
	
	// 전체 매개변수 생성자
	public SellBoard(int sellNo, String sellTitle, String sellContent, int price, int sellCount, int sellRecommend,
			Date sellDate, String status, int userNO, String titleImg, int localNo, int interestNo, String nickname,
			String changeName, String filePath, String interestName, String sellDetail, String sellRegulation,
			String userId, String localName) {
		super();
		this.sellNo = sellNo;
		this.sellTitle = sellTitle;
		this.sellContent = sellContent;
		this.price = price;
		this.sellCount = sellCount;
		this.sellRecommend = sellRecommend;
		this.sellDate = sellDate;
		this.status = status;
		this.userNO = userNO;
		this.titleImg = titleImg;
		this.localNo = localNo;
		this.interestNo = interestNo;
		this.nickname = nickname;
		this.changeName = changeName;
		this.filePath = filePath;
		this.interestName = interestName;
		this.sellDetail = sellDetail;
		this.sellRegulation = sellRegulation;
		this.userId = userId;
		this.localName = localName;
	}





	// 기본생성자
	public SellBoard(int sellNo, String sellTitle, String sellContent, int price, int sellCount, int sellRecommend,
			Date sellDate, String status, int userNO, String titleImg, int localNo, int interestNo, String nickname,
			String changeName, String filePath, String sellDetail, String sellRegulation, String userId) {
		super();
		this.sellNo = sellNo;
		this.sellTitle = sellTitle;
		this.sellContent = sellContent;
		this.price = price;
		this.sellCount = sellCount;
		this.sellRecommend = sellRecommend;
		this.sellDate = sellDate;
		this.status = status;
		this.userNO = userNO;
		this.titleImg = titleImg;
		this.localNo = localNo;
		this.interestNo = interestNo;
		this.nickname = nickname;
		this.changeName = changeName;
		this.filePath = filePath;
		this.sellDetail = sellDetail;
		this.sellRegulation = sellRegulation;
		this.userId = userId;
		
	}
	
	// 양진호
	// 판매 게시판 등록 부분 생성자
	public SellBoard(String sellTitle, String sellContent, int price, int localNo, int interestNo, int userNO, String sellDetail, String sellRegulation) {
		super();
		this.sellTitle = sellTitle;
		this.sellContent = sellContent;
		this.price = price;
		this.localNo = localNo;
		this.interestNo = interestNo;
		this.userNO = userNO;
		this.sellDetail = sellDetail;
		this.sellRegulation = sellRegulation;
	}

	// 판매 게시판 수정 부분 생성자
	public SellBoard(int sellNo, String sellTitle, String sellContent, int price, Date sellDate, int localNo,
			int interestNo) {
		super();
		this.sellNo = sellNo;
		this.sellTitle = sellTitle;
		this.sellContent = sellContent;
		this.price = price;
		this.sellDate = sellDate;
		this.localNo = localNo;
		this.interestNo = interestNo;
	}
	
	// 양진호 수정
	// 판매 게시판 리스트 부분 생성자 
	public SellBoard(int sellNo, String sellTitle, int price, int sellRecommend, Date sellDate,
			int interestNo, int localNo, String nickname, String titleImg, String localName, String interestName) {
		super();
		this.sellNo = sellNo;
		this.sellTitle = sellTitle;
		this.price = price;
		this.sellRecommend = sellRecommend;
		this.sellDate = sellDate;
		this.interestNo = interestNo;
		this.localNo = localNo;
		this.nickname = nickname;
		this.titleImg = titleImg;
		this.localName = localName;
		this.interestName = interestName;
	}
	
	
	// 검색할때 생성자
	public SellBoard(int sellNo, String sellTitle, int price, int sellRecommend, Date sellDate,
			int interestNo, int localNo, String nickname, String titleImg,int userNO, String localName, String interestName) {
		super();
		this.sellNo = sellNo;
		this.sellTitle = sellTitle;
		this.price = price;
		this.sellRecommend = sellRecommend;
		this.sellDate = sellDate;
		this.interestNo = interestNo;
		this.localNo = localNo;
		this.nickname = nickname;
		this.titleImg = titleImg;
		this.userNO = userNO;
		this.localName = localName;
		this.interestName = interestName;
	}
	
	
	// 판매 게시판 상세조회 부분 생성자
	public SellBoard(int sellNo, String sellTitle, String sellContent, int price, int sellRecommend, Date sellDate,
			String interestName, int localNo, String nickname, String sellDetail, String sellRegulation) {
		super();
		this.sellNo = sellNo;
		this.sellTitle = sellTitle;
		this.sellContent = sellContent;
		this.price = price;
		this.sellRecommend = sellRecommend;
		this.sellDate = sellDate;
		this.interestName= interestName;
		this.localNo = localNo;
		this.nickname = nickname;
		this.sellDetail = sellDetail;
		this.sellRegulation = sellRegulation;
	}
	
	// 메인페이지에 띄울 생성자
	public SellBoard(int sellNo, String sellTitle, String sellContent, int price, String titleImg, int interestNo,
			String nickname) {
		super();
		this.sellNo = sellNo;
		this.sellTitle = sellTitle;
		this.sellContent = sellContent;
		this.price = price;
		this.titleImg = titleImg;
		this.interestNo = interestNo;
		this.nickname = nickname;
	}
	
	// 내가 쓴 판매 게시글 용도
	public SellBoard(int sellNo, String sellTitle, int price, String interestName) {
		super();
		this.sellNo = sellNo;
		this.sellTitle = sellTitle;
		this.price = price;
		this.interestName = interestName;
	}

	// 거래내역 표시 용도
	public SellBoard(int sellNo, String sellTitle, String sellContent, int price, String interestName, int userNO) {
		super();
		this.sellNo = sellNo;
		this.sellTitle = sellTitle;
		this.sellContent = sellContent;
		this.price = price;
		this.interestName = interestName;
		this.userNO = userNO;
	}
	
	// 관리자페이지에 보여줄 판매게시글 생성자
	public SellBoard(int sellNo, String sellTitle, String sellContent, int price, int sellCount, int sellRecommend, Date sellDate,
			            String sellRegulation, String status, String interestName, String localName, String nickname, String userId) {
		super();
		this.sellNo = sellNo;
		this.sellTitle = sellTitle;
		this.sellContent = sellContent;
		this.price = price;
		this.sellCount = sellCount;
		this.sellRecommend = sellRecommend;
		this.sellDate = sellDate;
		this.sellRegulation = sellRegulation;
		this.status = status;
		this.interestName = interestName;
		this.localName = localName;
		this.nickname = nickname;
		this.userId = userId;
	}
	





	public int getSellNo() {
		return sellNo;
	}

	public void setSellNo(int sellNo) {
		this.sellNo = sellNo;
	}

	public String getSellTitle() {
		return sellTitle;
	}

	public void setSellTitle(String sellTitle) {
		this.sellTitle = sellTitle;
	}

	public String getSellContent() {
		return sellContent;
	}

	public void setSellContent(String sellContent) {
		this.sellContent = sellContent;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getSellCount() {
		return sellCount;
	}

	public void setSellCount(int sellCount) {
		this.sellCount = sellCount;
	}

	public int getSellRecommend() {
		return sellRecommend;
	}

	public void setSellRecommend(int sellRecommend) {
		this.sellRecommend = sellRecommend;
	}

	public Date getSellDate() {
		return sellDate;
	}

	public void setSellDate(Date sellDate) {
		this.sellDate = sellDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getUserNO() {
		return userNO;
	}

	public void setUserNO(int userNO) {
		this.userNO = userNO;
	}

	public String getTitleImg() {
		return titleImg;
	}

	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}

	public int getLocalNo() {
		return localNo;
	}

	public void setLocalNo(int localNo) {
		this.localNo = localNo;
	}

	public int getInterestNo() {
		return interestNo;
	}

	public void setInterestNo(int interestNo) {
		this.interestNo = interestNo;
	}
	
	public String getNickname() {
		return nickname;
	}
	
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	/* 판매게시판 조회를 위한 생성자추가*/
	public String getChangeName() {
		return changeName;
	}
	
	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}
	
	public String getFilePath() {
		return filePath;
	}
	
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	
	public String getLocalName() {
		return localName;
	}

	public void setLocalName(String localName) {
		this.localName = localName;
	}
	
	public String getInterestName() {
		return interestName;
	}

	public void setInterestName(String interestName) {
		this.interestName = interestName;
	}
	
	public String getSellDetail() {
		return sellDetail;
	}
	
	public void setSellDetail(String sellDetail) {
		this.sellDetail = sellDetail;
	}
	
	public String getSellRegulation() {
		return sellRegulation;
	}
	
	public void setSellRegulation(String sellRegulation) {
		this.sellRegulation = sellRegulation;
	}
	
	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}

	
	
	

	@Override
	public String toString() {
		return "SellBoard [sellNo=" + sellNo + ", sellTitle=" + sellTitle + ", sellContent=" + sellContent + ", price="
				+ price + ", sellCount=" + sellCount + ", sellRecommend=" + sellRecommend + ", sellDate=" + sellDate
				+ ", status=" + status + ", userNO=" + userNO + ", titleImg=" + titleImg + ", localNo=" + localNo
				+ ", interestNo=" + interestNo + ", nickname=" + nickname + ", interestName="+ interestName +""
						+ ", sellDetail="+ sellDetail +", sellRegulation="+ sellRegulation +", userId="+ userId +"]";
	}

	
	
	
}
