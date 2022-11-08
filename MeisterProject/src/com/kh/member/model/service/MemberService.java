package com.kh.member.model.service;

import java.sql.Connection;

import com.kh.common.JDBCTemplate;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

public class MemberService {
	
	
	/**
	 * 로그인 요청 서비스
	 * @param userId => 사용자가 입력했던 아이디값
	 * @param userPwd => 사용자가 입력했던 비밀번호값
	 * 
	 */
	public Member loginMember(String userId, String userPwd) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		Member m = new MemberDao().loginMember(userId, userPwd, conn);
		
		JDBCTemplate.close();
		
		return m; 
		
	}
	
	/**
	    * 회원 가입용 서비스
	    * @param => 회원가입할 회원의 정보를 담은 Member객체
	    * @param => 처리된 행수 (int)
	    * 
	    */
	   
	   public int insertMember(Member m) {
	      Connection conn = JDBCTemplate.getConnection();
	      
	      int result = new MemberDao().insertMember(m, conn);
	      
	      if(result > 0) {
	         JDBCTemplate.commit(conn);
	      }else {
	         JDBCTemplate.rollback(conn);
	      }
	      
	      JDBCTemplate.close();
	      
	      return result;
	      
	   }

	public Member pwdFind(String userId) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		Member m = new MemberDao().pwdFind(userId, conn);
		
		JDBCTemplate.close();
		
		return m; 
		
	}

	// 아이디 중복체크
	 public int idCheck(String checkId) {
			
			Connection conn = JDBCTemplate.getConnection();
			
			int count = new MemberDao().idCheck(conn, checkId);
			
			JDBCTemplate.close();
			
			return count;
		}   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	  

	
	
}
