package com.kh.member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.Attachment;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;
import com.kh.review.model.vo.Review;
import com.kh.sellboard.model.vo.SellBoard;

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

	 /**
	  * 전문가되기 위해 관리자에게 요청을 보내는 메소드
	  * @param m
	  * @param at
	  * @return
	  */
	 public int expertSubmit(Member m, Attachment at) {
		 Connection conn = JDBCTemplate.getConnection();
		 
		 int result1 = new MemberDao().expertSubmit(conn, m);
		 
		 int result2 = 1;
		 //				at.setRefNo(subNo);
		 if(at != null) {
			 int subNo = new MemberDao().selectSubNo(conn, m);
			 result2 = new MemberDao().insertExpertAttachment(conn, at, subNo);
		 }
		 
		 if (result1 > 0 && result2 > 0) {
			 JDBCTemplate.commit(conn);
		 } else {
			 JDBCTemplate.rollback(conn);
		 }
			 
		 JDBCTemplate.close();
		 
		 return result1 * result2;
	 }
	
	 public Member selectMember(int userNo) {
			
			Connection conn = JDBCTemplate.getConnection();
			
			Member m = new MemberDao().selectMemberByNo(conn, userNo);
			
			JDBCTemplate.close();
			
			return m; 
			
	}
	
	 public Attachment selectAttachment(int userNo, int fileLevel) {
			
			Connection conn = JDBCTemplate.getConnection();
			
			Attachment at = new MemberDao().selectAttachment(conn, userNo, fileLevel);
			
			JDBCTemplate.close();
			
			return at; 
			
	}

	/**
	 * 관리자가 전체회원 조회하는 메소드
	 * @return
	 */
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
	
	/**
	 * 관리자가 블랙리스트를 넣어주는 메소드
	 * @param userNo
	 * @return
	 */
	public Member insertBlackUser(int userNo, String reason) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		// 유저번호로인해 MEMBER테이블에 블랙리스트칼럼에 여부를 Y로 바꿔주는 것
		int result1 = new MemberDao().insertBlackUser(conn, userNo);
		// 어떤 이유로 블랙리스트 넣었는지 BLACKLIST테이블에 이유를 넣어주는 것
		int result2 = new MemberDao().insertBlacklist(conn, userNo, reason);
		
		Member blackUser = null;
		
		if(result1 > 0 && result2 > 0) {
			
			blackUser = new MemberDao().selectBlackUserByNo(conn, userNo);
			
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		

		return blackUser;
	}
	
	/**
	 * 관리자페이지에서 블랙리스트를 한번에 보게하는 메소드
	 * @return
	 */
	public ArrayList<Member> selectAllBlacklist() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Member> blacklist = new MemberDao().selectAllBlacklist(conn);
		
		JDBCTemplate.close();
		
		return blacklist;
	}

	
	
	public String selectNickName(int receiver) {
		Connection conn = JDBCTemplate.getConnection();
		
		String nickName = new MemberDao().selectNickName(conn, receiver);
		
		JDBCTemplate.close();
		
		return nickName;
	}

	/**
	 * 블랙리스트테이블에서 정보를 삭제하는 메소드
	 * @param userNo
	 * @return
	 */
	public Member deleteblacklist(int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		// 블랙유저를 블랙리스트에서 삭제하는 메소드
		int result1 = new MemberDao().deleteBlacklist(conn, userNo);
		// 유저번호로인해 MEMBER테이블에 블랙리스트칼럼에 여부를 N로 바꿔주는 것
		int result2 = new MemberDao().deleteBlackUser(conn, userNo);
		
		Member delMem = null;

		if(result1 > 0 && result2 > 0) {
			delMem = new MemberDao().selectMemberByNo(conn, userNo);
			
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		
		return delMem;
	}

	/**
	 * 닉네임으로 유저번호를 찾는 메소드
	 * @param findNick
	 * @return
	 */
	public int userNoFromNickname(String findNick) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int reportedUserNo = new MemberDao().userNoFromNickname(conn, findNick);
		
		JDBCTemplate.close();
		
		return reportedUserNo;
	}
	   
	public int changePwd(int userNo, String newPwd) {
	      Connection conn = JDBCTemplate.getConnection();
	      
	      int result = new MemberDao().changePwd(conn, userNo, newPwd);
	      
	      if(result > 0) {
	         JDBCTemplate.commit(conn);
	      }else {
	         JDBCTemplate.rollback(conn);
	      }
	      
	      JDBCTemplate.close();
	      
	      return result;
	      
	}
	   
	public int deleteMember(int userNo) {
	      Connection conn = JDBCTemplate.getConnection();
	      
	      int result = new MemberDao().deleteMember(conn, userNo);
	      
	      if(result > 0) {
	         JDBCTemplate.commit(conn);
	      }else {
	         JDBCTemplate.rollback(conn);
	      }
	      
	      JDBCTemplate.close();
	      
	      return result;
	      
	}   
	// 판매게시판 조회(유저번호 사용)   
	public ArrayList<SellBoard> getMySellBoard(int userNo, int startPage, int endPage){
		Connection conn = JDBCTemplate.getConnection();
	      
		ArrayList<SellBoard> result = new MemberDao().getMySellBoard(conn, userNo, startPage, endPage);
	      	      
	    JDBCTemplate.close();
	      	     
	    return result;
	}
	   
	public ArrayList<String> selectInterest(int categoryNo){
		Connection conn = JDBCTemplate.getConnection();
	      
		ArrayList<String> result = new MemberDao().selectInterest(conn, categoryNo);
	      	      
	    JDBCTemplate.close();
	      	     
	    return result;
	}

	
	public ArrayList<String> selectLocal(int categoryNo){
		Connection conn = JDBCTemplate.getConnection();
	      
		ArrayList<String> result = new MemberDao().selectLocal(conn, categoryNo);
	      	      
	    JDBCTemplate.close();
	      	     
	    return result;
	}   
	

	//페이징 처리용

	public int selectListCount() {
		Connection conn = JDBCTemplate.getConnection();

		int listCount = new MemberDao().selectListCount(conn);

		JDBCTemplate.close();

		return listCount;
	}
	
	public ArrayList<Integer> getTransaction(int userNo){
		Connection conn = JDBCTemplate.getConnection();
	      
		ArrayList<Integer> result = new MemberDao().getTransaction(conn, userNo);
	      	      
	    JDBCTemplate.close();
	      	     
	    return result;
	}
	// 거래내역 조회(판매글 번호 사용)
	public ArrayList<SellBoard> getSellBoard(int sellNo){
		Connection conn = JDBCTemplate.getConnection();
	      
		ArrayList<SellBoard> result = new MemberDao().getSellBoard(conn, sellNo);
	      	      
	    JDBCTemplate.close();
	      	     
	    return result;
	}
	   
	public int updateStatus(int userNo, int sellNo, int status) {
		Connection conn = JDBCTemplate.getConnection();

		int listCount = new MemberDao().updateStatus(conn, userNo, sellNo, status);

		JDBCTemplate.close();

		return listCount;
	}

	public ArrayList<Member> submlitListAllSelect() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Member> submitList =  new MemberDao().submlitListAllSelect(conn);
		
		JDBCTemplate.close();
		
		return submitList;
	}

	/**
	 * 전문가 인증 첨부파일 가져오기
	 * @return
	 */
	public ArrayList<Attachment> selectAllList() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Attachment> atArr = new MemberDao().selectAllAt(conn);
		
		JDBCTemplate.close();
		
		return atArr;
	}
	   
	public Review getReview(int reviewNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		Review review = new MemberDao().getReview(conn, reviewNo);
		
		JDBCTemplate.close();
		
		return review;
	}

	public int expertCommit(int userNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MemberDao().expertCommit(userNo);
		
		JDBCTemplate.close();
		
		return result;
		
	}


	
	
}
