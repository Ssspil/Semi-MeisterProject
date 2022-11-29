package com.kh.review.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.kh.common.JDBCTemplate;
import com.kh.member.model.dao.MemberDao;
import com.kh.review.model.vo.Review;

public class ReviewDao {
	
	private Properties prop = new Properties();
	
	public ReviewDao() {
		String fileName = MemberDao.class.getResource("/sql/review/review-mapper.xml").getPath();
		
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
	
	public int insertReview(Connection conn, Review r) {
		int result = 0;
		
		PreparedStatement psmt = null;
		
		String sql = prop.getProperty("insertReview");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, r.getReviewContent());
			psmt.setDouble(2, r.getAvg());
			psmt.setInt(3, r.getUserNo());
			psmt.setInt(4, r.getSellNo());
			
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(psmt);
		}
		
		return result;
	}
	
	public int getReviewNo(Connection conn, int userNo, int sellNo) {
		int result = 0;
		
		PreparedStatement psmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getReviewNo");
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, userNo);
			psmt.setInt(2, sellNo);
			
			rset = psmt.executeQuery();
			while(rset.next()) {
				result = rset.getInt("REVIEW_NO");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(psmt);
		}
		
		return result;
	}
	
	public int updateTransaction(Connection conn, int userNo, int sellNo, int reviewNo) {
		int result = 0;
		
		PreparedStatement psmt = null;
		
		String sql = prop.getProperty("updateTransaction");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, reviewNo);
			psmt.setInt(2, userNo);
			psmt.setInt(3, sellNo);
			
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(psmt);
		}
		
		return result;
	}
	
	public int updateReview(Connection conn, int reviewNo, String reviewContent, Double reviewScore) {
		int result = 0;
		
		PreparedStatement psmt = null;
		
		String sql = prop.getProperty("updateReview");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, reviewContent);
			psmt.setDouble(2, reviewScore);
			psmt.setInt(3, reviewNo);
			
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(psmt);
		}
		
		return result;
	}
	
	public int deleteReview(Connection conn, int reviewNo) {
		int result = 0;
		
		PreparedStatement psmt = null;
		
		String sql = prop.getProperty("deleteReview");
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, reviewNo);
			
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(psmt);
		}
		
		return result;
	}
}
