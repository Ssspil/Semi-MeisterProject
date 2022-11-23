package com.kh.report.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.Attachment;
import com.kh.common.model.vo.PageInfo;
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
			psmt.setInt(4, re.getReportUserNo());
			psmt.setInt(5, re.getReportedUserNo());
			
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
	            
	            //psmt.setInt(1, at.getRefNo());
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
	
	/**
	 * 신고접수 전체 보기 (페이징처리 포함)
	 * @param pi
	 * @param conn
	 * @return
	 */
	public ArrayList<Report> selectAllList(PageInfo pi, Connection conn) {
		
		ArrayList<Report> list = new ArrayList<>();
		PreparedStatement psmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAllList");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() +1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			psmt.setInt(1, startRow);
			psmt.setInt(2, endRow);
			
			rset = psmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Report(rset.getInt("REPORT_NO"),
									rset.getString("REPORT_TITLE"),
									rset.getString("REASON"),
									rset.getString("REPORT_CONTENT"),
									rset.getDate("REPORT_DATE"),
									rset.getString("STATUS"),
									rset.getString("REPORT_USER"),
									rset.getString("REPORTED_USER")
									));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close();
		}
		
		return list;
	}
	
	/**
	 * 신고접수글 전체 개수 
	 * @param conn
	 * @return
	 */
	public int selectReportCount(Connection conn) {
		//select문 -> ResultSet객체
		int listCount = 0;
		
		PreparedStatement psmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReportCount");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			rset = psmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(psmt);
		}
		return listCount;
	}
	
	/**
	 * 처리완료하는 메소드
	 * @param rpno
	 * @return
	 */
	public int reportProcessed(int rpno, Connection conn) {
		
		int complete = 0;
		
		PreparedStatement psmt = null;
		
		String sql = prop.getProperty("reportProcessed");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, rpno);
			
			complete = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(psmt);
		}
		
		return complete;
	}
	
	/**
	 * 신고하기의 전체 첨부파일을 가져오는 메소드
	 * @param conn
	 * @return
	 */
	public ArrayList<Attachment> selectAllAt(Connection conn) {
		ArrayList<Attachment> atArr = new ArrayList<>();
		
		PreparedStatement psmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAllAt");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			rset = psmt.executeQuery();
			
			while(rset.next()) {
				atArr.add(new Attachment(rset.getInt("FILE_NO"),
										 rset.getString("ORIGIN_NAME"),
										 rset.getString
										
						));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return atArr;
	}

	
	







}
