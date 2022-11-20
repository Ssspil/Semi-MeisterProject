package com.kh.report.model.vo;

import java.util.Date;

public class Report {

	private int reportNo;
	private String reportTitle;
	private String reason;
	private String reportContent;
	private Date reportEnrollDate;
	private String status;
	private int reportUser;
	private int reportedUser;

	// 기본생성자
	public Report() {
		
	}

	// 전체 매개변수 생성자
	public Report(int reportNo, String reportTitle, String reason, String reportContent, Date reportEnrollDate,
			String status, int reportUser, int reportedUser) {
		super();
		this.reportNo = reportNo;
		this.reportTitle = reportTitle;
		this.reason = reason;
		this.reportContent = reportContent;
		this.reportEnrollDate = reportEnrollDate;
		this.status = status;
		this.reportUser = reportUser;
		this.reportedUser = reportedUser;
	}
	
	// 신고할 때 
	public Report(String reportTitle, String reason, String reportContent, int reportUser, int reportedUser) {
		super();
		this.reportTitle = reportTitle;
		this.reason = reason;
		this.reportContent = reportContent;
		this.reportUser = reportUser;
		this.reportedUser = reportedUser;
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

	public int getReportUser() {
		return reportUser;
	}

	public void setReportUser(int reportUser) {
		this.reportUser = reportUser;
	}

	public int getReportedUser() {
		return reportedUser;
	}

	public void setReportedUser(int reportedUser) {
		this.reportedUser = reportedUser;
	}

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", reportTitle=" + reportTitle + ", reason=" + reason
				+ ", reportContent=" + reportContent + ", reportEnrollDate=" + reportEnrollDate + ", status=" + status
				+ ", reportUser=" + reportUser + ", reportedUser=" + reportedUser + "]";
	}
	
	
	
	
}
