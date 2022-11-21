package com.kh.report.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.Attachment;
import com.kh.member.model.dao.MemberDao;
import com.kh.report.model.vo.Report;

public class ReportDao {

	private Properties prop = new Properties();
	
	public ReportDao() {
		String fileName = MemberDao.class.getResource("/sql/report/report-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 신고하기글 넣기
	 * @param re
	 * @param conn
	 * @return
	 */
	public int insertReport(Report re, Connection conn) {
		int result1 = 0;
		PreparedStatement psmt = null;
		
		String sql = prop.getProperty("insertReport");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, re.getReportTitle());
			psmt.setString(2, re.getReportContent());
			psmt.setString(3, re.getReason());
			psmt.setInt(4, re.getReportNo());
			psmt.setInt(5, re.getReportedUser());
			
			result1 = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(psmt);
		}
		
		return result1;
	}

	/**
	 * 신고하기 하면서 첨부파일 넣은거 인서트해주는 메소드
	 * @param at
	 * @param conn
	 * @return
	 */
	public int insertAttachment(Attachment at, Connection conn) {
	        
	        int result2 = 0;
	        PreparedStatement psmt = null;
	        
	        String sql = prop.getProperty("insertAttachment");
	        
	        try {
	            psmt = conn.prepareStatement(sql);
	            
	            psmt.setString(1, at.getOriginName());
	            psmt.setString(2, at.getChangeName());
	            psmt.setString(3, at.getFilePath());
	            
	            result2 = psmt.executeUpdate();
	            
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            JDBCTemplate.close(psmt);
	        }
	        
	        return result2;
	    }







}
