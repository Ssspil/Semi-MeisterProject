package com.kh.report.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.Attachment;
import com.kh.common.model.vo.PageInfo;
import com.kh.manager.notice.model.dao.NoticeDao;
import com.kh.report.model.dao.ReportDao;
import com.kh.report.model.vo.Report;

public class ReportService {

	/**
	 * 사용자가 관리자에게 신고한 메소드(사진포함)
	 * @param re
	 * @param at
	 * @return
	 */
	public int insertReport(Report re, Attachment at) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result1 = new ReportDao().insertReport(re, conn);
		
		int result2 = 1;
		
		if( at != null) {
			result2 = new ReportDao().insertAttachment(at, conn);
		}
		
		// 트랜잭션 처리
		if(result1 > 0 && result2 > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close();
		
		return result1 * result2;
	}

	/**
	 * 신고접수 전체 보기 (페이징처리 포함)
	 * @param pi
	 * @return
	 */
	public ArrayList<Report> selectAllList(PageInfo pi) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Report> list = new ReportDao().selectAllList(pi, conn);
		
		JDBCTemplate.close();
		
		return list;
	}

	/**
	 * 신고접수글 전체 개수 
	 * @return
	 */
	public int selectReportCount() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int listCount = new ReportDao().selectReportCount(conn); //select문이긴한데 갯수를 세야하는거라서 int
		
		JDBCTemplate.close();
		
		return listCount;
	}

	/**
	 * 신고접수 처리완료하게하는 메소드
	 * @param rpno
	 * @return
	 */
	public int reportProcessed(int rpno) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int complete = new ReportDao().reportProcessed(rpno, conn);
		
		JDBCTemplate.close();
		
		return complete;
	}

}
