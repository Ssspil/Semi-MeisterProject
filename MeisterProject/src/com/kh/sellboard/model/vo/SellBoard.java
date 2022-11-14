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
	private int local;
	private int interest;
	
	public SellBoard() {
		
	}
	
	// 기본생성자
	public SellBoard(int sellNo, String sellTitle, String sellContent, int price, int sellCount, int sellRecommend,
			Date sellDate, String status, int userNO, String titleImg, int local, int interest) {
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
		this.local = local;
		this.interest = interest;
	}

	// 판매 게시판 등록 부분 생성자
	public SellBoard(String sellTitle, String sellContent, int price, int local, int interest, int userNO) {
		super();
		this.sellTitle = sellTitle;
		this.sellContent = sellContent;
		this.price = price;
		this.local = local;
		this.interest = interest;
		this.userNO = userNO;
	}

	// 판매 게시판 수정 부분 생성자
	public SellBoard(int sellNo, String sellTitle, String sellContent, int price, Date sellDate, int local,
			int interest) {
		super();
		this.sellNo = sellNo;
		this.sellTitle = sellTitle;
		this.sellContent = sellContent;
		this.price = price;
		this.sellDate = sellDate;
		this.local = local;
		this.interest = interest;
	}

	// 판매 게시판 조회 부분 생성자
	public SellBoard(int sellNo, String sellTitle, int price, int sellCount, int sellRecommend, Date sellDate,
			int local, int interest) {
		super();
		this.sellNo = sellNo;
		this.sellTitle = sellTitle;
		this.price = price;
		this.sellCount = sellCount;
		this.sellRecommend = sellRecommend;
		this.sellDate = sellDate;
		this.local = local;
		this.interest = interest;
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

	public int getLocal() {
		return local;
	}

	public void setLocal(int local) {
		this.local = local;
	}

	public int getInterest() {
		return interest;
	}

	public void setInterest(int interest) {
		this.interest = interest;
	}

	@Override
	public String toString() {
		return "SellBoard [sellNo=" + sellNo + ", sellTitle=" + sellTitle + ", sellContent=" + sellContent + ", price="
				+ price + ", sellCount=" + sellCount + ", sellRecommend=" + sellRecommend + ", sellDate=" + sellDate
				+ ", status=" + status + ", userNO=" + userNO + ", titleImg=" + titleImg + ", local=" + local
				+ ", interest=" + interest + "]";
	}
	
	
	
	
}
