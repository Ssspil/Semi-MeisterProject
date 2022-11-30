package com.kh.review.model.service;

import java.sql.Connection;

import com.kh.common.JDBCTemplate;
import com.kh.review.model.dao.ReviewDao;
import com.kh.review.model.vo.Review;

public class ReviewService {
	
	public int insertReview(Review r) {
	      Connection conn = JDBCTemplate.getConnection();
	      
	      int result = new ReviewDao().insertReview(conn, r);
	      
	      if(result > 0) {
	         JDBCTemplate.commit(conn);
	      }
	      
	      else {
	         JDBCTemplate.rollback(conn);
	      }
	      
	      JDBCTemplate.close();
	      
	      return result;
	      
	}
	
	public int getReviewNo(int userNo, int sellNo) {
	      Connection conn = JDBCTemplate.getConnection();
	      
	      int result = new ReviewDao().getReviewNo(conn, userNo, sellNo);
	      
	      JDBCTemplate.close();
	      
	      return result;
	      
	}
	
	public int updateTransaction(int userNo, int sellNo, int reviewNo) {
	      Connection conn = JDBCTemplate.getConnection();
	      
	      int result = new ReviewDao().updateTransaction(conn, userNo, sellNo, reviewNo);
	      
	      if(result > 0) {
	         JDBCTemplate.commit(conn);
	      }
	      
	      else {
	         JDBCTemplate.rollback(conn);
	      }
	      
	      JDBCTemplate.close();
	      
	      return result;
	      
	}
	
	public int updateReview(int reviewNo, String reviewContent, Double reviewScore) {
	      Connection conn = JDBCTemplate.getConnection();
	      
	      int result = new ReviewDao().updateReview(conn, reviewNo, reviewContent, reviewScore);
	      
	      if(result > 0) {
	         JDBCTemplate.commit(conn);
	      }
	      
	      else {
	         JDBCTemplate.rollback(conn);
	      }
	      
	      JDBCTemplate.close();
	      
	      return result;
	      
	}
	
	public int deleteReview(int reviewNo) {
	      Connection conn = JDBCTemplate.getConnection();
	      
	      int result = new ReviewDao().deleteReview(conn, reviewNo);
	      
	      if(result > 0) {
	         JDBCTemplate.commit(conn);
	      }
	      
	      else {
	         JDBCTemplate.rollback(conn);
	      }
	      
	      JDBCTemplate.close();
	      
	      return result;
	      
	}
	
}
