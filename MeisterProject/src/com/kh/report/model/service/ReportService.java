package com.kh.report.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.Attachment;
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

	public ArrayList<Report> selectAllList() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Report> list = new ReportDao().selectAllList(conn);
		
		JDBCTemplate.close();
		
		return list;
	}

}
