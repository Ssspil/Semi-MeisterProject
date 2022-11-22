package com.kh.report.model.vo;

import java.util.Date;

public class Report {

	private int reportNo;
	private String reportTitle;
	private String reason;
	private String reportContent;
	private Date reportEnrollDate;
	private String status;
	private int reportUserNo;
	private int reportedUserNo;
	private String reportUserId;
	private String reportedUserId;

	// 기본생성자
	public Report() {
		
	}
	
	// 전체 매개변수 생성자
	public Report(int reportNo, String reportTitle, String reason, String reportContent, Date reportEnrollDate,
			String status, int reportUserNo, int reportedUserNo, String reportUserId, String reportedUserId) {
		super();
		this.reportNo = reportNo;
		this.reportTitle = reportTitle;
		this.reason = reason;
		this.reportContent = reportContent;
		this.reportEnrollDate = reportEnrollDate;
		this.status = status;
		this.reportUserNo = reportUserNo;
		this.reportedUserNo = reportedUserNo;
		this.reportUserId = reportUserId;
		this.reportedUserId = reportedUserId;
	}
	// 신고하기 넣기 생성자
	public Report(int reportNo, String reportTitle, String reason, String reportContent, Date reportEnrollDate,
			String status, int reportUserNo, int reportedUserNo) {
		super();
		this.reportNo = reportNo;
		this.reportTitle = reportTitle;
		this.reason = reason;
		this.reportContent = reportContent;
		this.reportEnrollDate = reportEnrollDate;
		this.status = status;
		this.reportUserNo = reportUserNo;
		this.reportedUserNo = reportedUserNo;
	}

	// 신고하기 보기 생성자
	public Report(int reportNo, String reportTitle, String reason, String reportContent, Date reportEnrollDate,
			String status, String reportUserId, String reportedUserId) {
		super();
		this.reportNo = reportNo;
		this.reportTitle = reportTitle;
		this.reason = reason;
		this.reportContent = reportContent;
		this.reportEnrollDate = reportEnrollDate;
		this.status = status;
		this.reportUserId = reportUserId;
		this.reportedUserId = reportedUserId;
	}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public String getReportTitle() {
		return reportTitle;
	}

	public void setReportTitle(String reportTitle) {
		this.reportTitle = reportTitle;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getReportContent() {
		return reportContent;
	}

	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}

	public Date getReportEnrollDate() {
		return reportEnrollDate;
	}

	public void setReportEnrollDate(Date reportEnrollDate) {
		this.reportEnrollDate = reportEnrollDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getReportUserNo() {
		return reportUserNo;
	}

	public void setReportUserNo(int reportUserNo) {
		this.reportUserNo = reportUserNo;
	}

	public int getReportedUserNo() {
		return reportedUserNo;
	}

	public void setReportedUserNo(int reportedUserNo) {
		this.reportedUserNo = reportedUserNo;
	}

	public String getReportUserId() {
		return reportUserId;
	}

	public void setReportUserId(String reportUserId) {
		this.reportUserId = reportUserId;
	}

	public String getReportedUserId() {
		return reportedUserId;
	}

	public void setReportedUserId(String reportedUserId) {
		this.reportedUserId = reportedUserId;
	}

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", reportTitle=" + reportTitle + ", reason=" + reason
				+ ", reportContent=" + reportContent + ", reportEnrollDate=" + reportEnrollDate + ", status=" + status
				+ ", reportUserNo=" + reportUserNo + ", reportedUserNo=" + reportedUserNo + ", reportUserId="
				+ reportUserId + ", reportedUserId=" + reportedUserId + "]";
	}


	


	
	
}
