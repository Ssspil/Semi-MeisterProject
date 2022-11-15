package com.kh.member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.Attachment;
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
	 
	 public Member updateMember(Member m, Attachment at) {
		 Connection conn = JDBCTemplate.getConnection();
		 
		 int result = new MemberDao().updateMember(conn, m);
		 
		 Member updateMem = null;
		 
		 int result2 = 1;
		 
		 if(at != null) {
			 result2 = new MemberDao().insertAttachment(conn, at);
		 }
		 
		 if (result > 0 && result2 > 0) {
			JDBCTemplate.commit(conn);
			updateMem = new MemberDao().selectMember(conn, m.getUserId());
		 } else {
			System.out.println("result2 : "+ result2);
			JDBCTemplate.rollback(conn);
		 }
		 
		 JDBCTemplate.close();
		 
		 return updateMem;
	 }
	

	 public int nicknameCheck(String nickname) {
		 
		 Connection conn = JDBCTemplate.getConnection();
			
		 int result = new MemberDao().nicknameCheck(conn, nickname);
		 
		 JDBCTemplate.close();
		
		 return result;
	 }

	 public Member expertSubmit(Member m) {
		 Connection conn = JDBCTemplate.getConnection();
		 
		 int result = new MemberDao().expertSubmit(conn, m);
		 Member updateMem = null;
		 
		 if (result > 0) {
			 JDBCTemplate.commit(conn);
			 updateMem = new MemberDao().selectMember(conn, m.getUserId());
		 } else {
			 JDBCTemplate.rollback(conn);
		 }
			 
		 JDBCTemplate.close();
		 
		 return updateMem;
	 }
	
	 public Member selectMember(int userNo) {
			
			Connection conn = JDBCTemplate.getConnection();
			
			Member m = new MemberDao().selectMemberByNo(conn, userNo);
			
			JDBCTemplate.close();
			
			return m; 
			
	}
	
	 public Attachment selectAttachment(int userNo) {
			
			Connection conn = JDBCTemplate.getConnection();
			
			Attachment at = new MemberDao().selectAttachment(conn, userNo);
			
			JDBCTemplate.close();
			
			return at; 
			
	}

	 
	public ArrayList<Member> selectAllMember() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Member> memList = new MemberDao().selectAllMember(conn);
		
		JDBCTemplate.close();
		
		return memList;
	}

	/**
	 * 관리자가 전문가인 회원 정보변경하게하는 메소드
	 * @param m
	 * @return
	 */
	public Member userExUpdateByManager(Member m) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MemberDao().userExUpdateByManager(m, conn);
		
		Member newMem = null;
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
			
			newMem = new MemberDao().selectMember(conn, m.getUserId());
		} else {
			JDBCTemplate.rollback(conn);
		}
		
		
		JDBCTemplate.close();
		
		return newMem;
	}

	/**
	 * 관리자가 일반회원 정보변경하게하는 메소드
	 * @param m
	 * @return
	 */
	public Member userUpdateByManager(Member m) {
		

		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MemberDao().userUpdateByManager(m, conn);
		
		Member newMem = null;
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
			
			newMem = new MemberDao().selectMember(conn, m.getUserId());
		} else {
			JDBCTemplate.rollback(conn);
		}
		
		
		JDBCTemplate.close();
		
		return newMem;
	}

	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	  

	
	
}
