package com.kh.member.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.InvalidPropertiesFormatException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;

import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.Attachment;

import com.kh.member.model.vo.Member;
import com.kh.review.model.vo.Review;
import com.kh.sellboard.model.vo.SellBoard;

public class MemberDao {
	
	private Properties prop = new Properties();
	
	public MemberDao() {
		String fileName = MemberDao.class.getResource("/sql/member/member-mapper.xml").getPath();
		
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

	public Member loginMember(String userId, String userPwd, Connection conn) {
		// select문 => ResultSet 객체 => Member 객체
		
		Member m = null;
		
		PreparedStatement psmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("loginMember");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, userId);
			psmt.setString(2, userPwd);
			
			rset = psmt.executeQuery();
			
			if(rset.next()) {
				m= new Member(rset.getInt("USER_NO"),
						rset.getString("USER_ID"),
						rset.getString("USER_PWD"),
						rset.getString("NICKNAME"),
						rset.getString("INTEREST"),
						rset.getDate("ENROLL_DATE"),
						rset.getString("USER_NAME"),
						rset.getString("GENDER"),
						rset.getString("EMAIL"),
						rset.getString("PHONE"),
						rset.getString("STATUS"),
						rset.getString("BLACKLIST"),
						rset.getString("SPECIALITY"),
						rset.getString("EXP_SUBMIT"),
						rset.getString("EXPERT")
						);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(psmt);
		}
		
		return m;
		
		
	}
	
	public int insertMember(Member m, Connection conn) {
		
		int result = 0;
		
		PreparedStatement psmt = null;
		
		String sql = prop.getProperty("insertMember");
		
		try {
			psmt = conn.prepareStatement(sql);
			/*
			 * INSERT INTO MEMBER
			 * VALUES (.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, SYSDATE, NULL, 'Y'(생략가능));
			 */
			
			psmt.setString(1, m.getUserId());
			psmt.setString(2, m.getUserPwd());
			psmt.setString(3, m.getNickName());
			psmt.setString(4, m.getInterest());
			
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(psmt);
		}
		
		return result;
	}

	public Member pwdFind(String userId, Connection conn) {

		Member m = null;
		PreparedStatement psmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("pwdFind");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, userId);
			
			rset = psmt.executeQuery();
			if(rset.next()) {
				m = new Member();
				m.setUserId(rset.getString("USER_ID"));
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(psmt);
		}
		return m;
	}
	
	public int idCheck(Connection conn, String checkId) {
		
		// select -> ResultSET (숫자하나)
		int count = 0;
		
		PreparedStatement psmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("idCheck");
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, checkId);
			
			rset = psmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(psmt);
		}
		
		return count;		
	}
	
	public int updateMember(Connection conn, Member m) {
		PreparedStatement psmt = null;
		int result = 0;
		String sql = prop.getProperty("updateMember");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, m.getNickName());
			psmt.setString(2, m.getInterest());
			psmt.setString(3, m.getUserName());
			psmt.setString(4, m.getPhone());
			psmt.setString(5, m.getEmail());
			psmt.setString(6, m.getUserId());
			
			System.out.println("nickname : " +m.getNickName());
			System.out.println("interest : " +m.getInterest());
			System.out.println("name : " +m.getUserName());
			System.out.println("phone : " +m.getPhone());
			System.out.println("email : " +m.getEmail());
			System.out.println("ID : " +m.getUserId());
			
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(psmt);
		}
		return result;
	}
	
	public Member selectMember(Connection conn, String userId) {
		
		Member m = null;
		
		PreparedStatement psmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMember");
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, userId);
			
			rset = psmt.executeQuery();
			
			if(rset.next()) {
				m= new Member(rset.getInt("USER_NO"),
						rset.getString("USER_ID"),
						rset.getString("USER_PWD"),
						rset.getString("NICKNAME"),
						rset.getString("INTEREST"),
						rset.getDate("ENROLL_DATE"),
						rset.getString("USER_NAME"),
						rset.getString("GENDER"),
						rset.getString("EMAIL"),
						rset.getString("PHONE"),
						rset.getString("STATUS"),
						rset.getString("BLACKLIST"),
						rset.getString("SPECIALITY"),
						rset.getString("EXP_SUBMIT"),
						rset.getString("EXPERT")
						);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(psmt);
		}
		return m;
	}
	
	public Member selectMemberByNo(Connection conn, int userNo) {
		
		Member m = null;
		
		PreparedStatement psmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMemberByNo");
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, userNo);
			
			rset = psmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("USER_NO"),
						rset.getString("USER_ID"),
						rset.getString("USER_PWD"),
						rset.getString("NICKNAME"),
						rset.getString("INTEREST"),
						rset.getDate("ENROLL_DATE"),
						rset.getString("USER_NAME"),
						rset.getString("GENDER"),
						rset.getString("EMAIL"),
						rset.getString("PHONE"),
						rset.getString("STATUS"),
						rset.getString("BLACKLIST"),
						rset.getString("SPECIALITY"),
						rset.getString("EXP_SUBMIT"),
						rset.getString("EXPERT")
						);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(psmt);
		}
		return m;
	}
	
	public int nicknameCheck(Connection conn, String nickname) {
		
		// select -> ResultSET (숫자하나)
		int result = 0;
		
		PreparedStatement psmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("nicknameCheck");
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, nickname);
			
			rset = psmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(psmt);
		}
		
		return result;
	}

	// SUBMIT 테이블로 넣기
	public int expertSubmit(Connection conn, Member m) {
		int result = 0;
		PreparedStatement psmt = null;
		
		String sql = prop.getProperty("expertSubmit");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, m.getUserNo());
			psmt.setString(2, m.getUserName());
			psmt.setString(3, m.getGender());
			psmt.setString(4, m.getEmail());
			psmt.setString(5, m.getPhone());
			psmt.setString(6, m.getSpeciality());
			
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(psmt);
		}
		
		return result;
	}
	
	public int insertAttachment(Connection conn, Attachment at) {
		int result = 0;
		int same = 0;
		int delete = 0;
		
		PreparedStatement psmt = null;
		
		String sql = prop.getProperty("insertAttachment");
		String selectSql = prop.getProperty("selectSameAttachment");
		String deleteSql = prop.getProperty("deleteAttachment");
		
		try {
			psmt = conn.prepareStatement(selectSql);
			psmt.setInt(1, at.getRefNo());
			same = psmt.executeUpdate();
			
			if(same > 0) {
				psmt = null;
				psmt = conn.prepareStatement(deleteSql);
				psmt.setInt(1, at.getRefNo());
				
				delete = psmt.executeUpdate();
			}
			
			psmt = null;
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, at.getRefNo());
			psmt.setString(2, at.getOriginName());
			psmt.setString(3, at.getChangeName());
			psmt.setString(4, at.getFilePath());
			
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(psmt);
		}
		return result;
	}
	
	/**
	 * 전문가 신청할 때 전문가라고 증명할 첨부파일 넣기
	 * @param conn
	 * @param at
	 * @return
	 */
	public int insertExpertAttachment(Connection conn, Attachment at, int subNo) {
		int result = 0;
		
		PreparedStatement psmt = null;
		
		String sql = prop.getProperty("insertExpertAttachment");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, subNo);
			psmt.setString(2, at.getOriginName());
			psmt.setString(3, at.getChangeName());
			psmt.setString(4, at.getFilePath());
			
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(psmt);
		}
		return result;
	}
	public Attachment selectAttachment(Connection conn, int userNo, int fileLevel) {
		
		Attachment at = null;
		PreparedStatement psmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAttachment");
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, userNo);
			psmt.setInt(2, fileLevel);
			
			rset = psmt.executeQuery();
			
			if(rset.next()) {
				at = new Attachment();
				
				at.setFileNo(rset.getInt("FILE_NO"));
				at.setOriginName(rset.getString("ORIGIN_NAME"));
				at.setChangeName(rset.getString("CHANGE_NAME"));
				at.setFilePath(rset.getString("FILE_PATH"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(psmt);
		}
		
		return at;
	}

	/**
	 * 관리자가 회원정보 다 보는 메소드
	 * @param conn
	 * @return
	 */
	public ArrayList<Member> selectAllMember(Connection conn) {
		
		ArrayList<Member> memList = new ArrayList<>();
		
		PreparedStatement psmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAllMember");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			rset = psmt.executeQuery();
			
            while(rset.next()) {
                memList.add(new  Member(rset.getInt("USER_NO"),
						rset.getString("USER_ID"),
						rset.getString("USER_PWD"),
						rset.getString("NICKNAME"),
						rset.getString("INTEREST_NAME"),
						rset.getDate("ENROLL_DATE"),
						rset.getString("USER_NAME"),
						rset.getString("GENDER"),
						rset.getString("EMAIL"),
						rset.getString("PHONE"),
						rset.getString("STATUS"),
						rset.getString("BLACKLIST"),
						rset.getString("SPECIALITY"),
						rset.getString("EXP_SUBMIT"),
						rset.getString("EXPERT")
						));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(psmt);
		}
		
		return memList;
	}

	/**
	 * 관리자가 전문가인 회원 정보변경하게하는 메소드
	 * @param m
	 * @param conn
	 * @return
	 */
	public int userExUpdateByManager(Member m, Connection conn) {
		
		PreparedStatement psmt = null;
		
		int result = 0;
		
		String sql = prop.getProperty("userExUpdateByManager");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, m.getUserId());
			psmt.setString(2, m.getUserPwd());
			psmt.setString(3, m.getNickName());
			psmt.setString(4, m.getInterest());
			psmt.setString(5, m.getUserName());
			psmt.setString(6, m.getGender());
			psmt.setString(7, m.getEmail());
			psmt.setString(8, m.getPhone());
			psmt.setString(9, m.getSpeciality());
			psmt.setString(10, m.getExpert());
			psmt.setInt(11, m.getUserNo());
					
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(psmt);
		}
		
		return result;
	}
	
	/**
	 * 관리자가 일반회원 정보변경하게 하는 메소드
	 * @param m
	 * @param conn
	 * @return
	 */
	public int userUpdateByManager(Member m, Connection conn) {
		PreparedStatement psmt = null;
		
		int result = 0;
		
		String sql = prop.getProperty("userUpdateByManager");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, m.getUserId());
			psmt.setString(2, m.getUserPwd());
			psmt.setString(3, m.getNickName());
			psmt.setString(4, m.getInterest());
			psmt.setString(5, m.getExpert());
			psmt.setInt(6, m.getUserNo());
					
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(psmt);
		}
		
		return result;
	}

	/**
	 * 관리자가 유저를 블랙리스트로 넣어서 블래리스트 여부와 상태를 바꾸어주는 메소드
	 * @param conn
	 * @param userNo
	 * @return
	 */
	public int insertBlackUser(Connection conn, int userNo) {
		
		PreparedStatement psmt = null;
		int result1 = 0;
		
		String sql = prop.getProperty("insertBlackUser");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, userNo);
			
			result1 = psmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(psmt);
		}
		
		return result1;
	}
	
	/**
	 * 관리자가 BLACKLIST테이블에 이유를 넣어주는 메소드
	 * @param conn
	 * @param userNo
	 * @param reason
	 * @return
	 */
	public int insertBlacklist(Connection conn, int userNo, String reason) {
		PreparedStatement psmt = null;
		int result2 = 0;
		
		String sql = prop.getProperty("insertBlacklist");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, userNo);
			psmt.setString(2, reason);
			
			result2 = psmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(psmt);
		}
		
		return result2;
	}

	/**
	 * 유저번호로 블랙리스트를 검색하는 메소드 
	 * @param conn
	 * @param userNo
	 * @return
	 */
	public Member selectBlackUserByNo(Connection conn, int userNo) {
		
		Member m = null;
		
		PreparedStatement psmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBlackUserByNo");
		
		try {
			psmt = conn.prepareStatement(sql);

			
			psmt.setInt(1, userNo);
			
			rset = psmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("USER_NO"),
						rset.getString("USER_ID"),
						rset.getString("USER_PWD"),
						rset.getString("NICKNAME"),
						rset.getString("INTEREST"),
						rset.getDate("ENROLL_DATE"),
						rset.getString("USER_NAME"),
						rset.getString("GENDER"),
						rset.getString("EMAIL"),
						rset.getString("PHONE"),
						rset.getString("STATUS"),
						rset.getString("BLACKLIST"),
						rset.getString("SPECIALITY"),
						rset.getString("EXP_SUBMIT"),
						rset.getString("EXPERT")
						);
			}

			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(psmt);
		}
		return m;
	}

	/**
	 * 관리자페이지에서 블랙리스트를 한번에 보게하는 메소드
	 * @param conn
	 * @return
	 */
	public ArrayList<Member> selectAllBlacklist(Connection conn) {
		ArrayList<Member> blacklist = new ArrayList<>();
		
		PreparedStatement psmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAllBlacklist");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			rset = psmt.executeQuery();
			
			while(rset.next()) {
	        	blacklist.add(new  Member(rset.getInt("USER_NO"),
						rset.getString("USER_ID"),
						rset.getString("NICKNAME"),
						rset.getString("USER_NAME"),
						rset.getString("BLACKLIST"),
						rset.getDate("BLACK_DATE"),
						rset.getString("REASON")
						));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(psmt);
		}
		
		return blacklist;
	}


	public String selectNickName(Connection conn, int receiver) {
		String nickName = "";
		
		PreparedStatement psmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectNickName");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, receiver);
			
			rset = psmt.executeQuery();
			
			while(rset.next()) {
	        	nickName = rset.getString("NICKNAME");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(psmt);
		}
		
		return nickName;
	}

	/**
	 * 블랙유저를 블랙리스트에서 삭제하는 메소드
	 * @param conn
	 * @param userNo
	 * @return
	 */
	public int deleteBlacklist(Connection conn, int userNo) {
		PreparedStatement psmt = null;
		int result1 = 0;
		
		String sql = prop.getProperty("deleteBlacklist");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, userNo);
			
			result1 = psmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(psmt);
		}
		
		return result1;
	}

	/**
	 * 유저번호로인해 MEMBER테이블에 블랙리스트칼럼에 여부를 N로 바꿔주는 것
	 * @param conn
	 * @param userNo
	 * @return
	 */
	public int deleteBlackUser(Connection conn, int userNo) {
		PreparedStatement psmt = null;
		int result2 = 0;
		
		String sql = prop.getProperty("deleteBlackUser");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, userNo);
			
			result2 = psmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(psmt);
		}
		
		return result2;
	}

	public int userNoFromNickname(Connection conn, String findNick) {
		PreparedStatement psmt = null;
		int reportedUserNo = 0;
		ResultSet rset = null;
		
		String sql = prop.getProperty("userNoFromNickname");

		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, findNick);
			
			rset = psmt.executeQuery();
			
			if(rset.next()) {
				reportedUserNo = Integer.parseInt(rset.getString("USER_NO"));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(psmt);
			JDBCTemplate.close(rset);
		}
		
		return reportedUserNo;
	}
	
	public int changePwd(Connection conn, int userNo, String newPwd) {

		int result = 0;
		
		PreparedStatement psmt = null;
		
		String sql = prop.getProperty("changePwd");
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, newPwd);
			psmt.setInt(2, userNo);
			
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(psmt);
		}
		
		return result;
	}
	
	public int deleteMember(Connection conn, int userNo) {

		int result = 0;
		
		PreparedStatement psmt = null;
		
		String sql = prop.getProperty("deleteMember");
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, userNo);
			
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(psmt);
		}
		
		return result;
	}

	public ArrayList<SellBoard> getMySellBoard(Connection conn, int userNo, int startPage, int endPage){
		ArrayList<SellBoard> sell = new ArrayList<>();
		
		PreparedStatement psmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMySellBoard");
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, userNo);
			psmt.setInt(2, endPage);
			psmt.setInt(3, startPage);
			
			System.out.println(endPage);
			System.out.println(startPage);
			
			rset = psmt.executeQuery();
			
			while(rset.next()) {
				sell.add(new SellBoard(rset.getInt("SELL_NO"),
									rset.getString("SELL_TITLE"),
									rset.getInt("PRICE"),
									rset.getString("INTEREST_NAME")
					));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(psmt);
		}
		
		return sell;
	}
	
	public ArrayList<String> selectInterest(Connection conn, int categoryNo){
		ArrayList<String> category = new ArrayList<>();
		
		PreparedStatement psmt = null;
		
		ResultSet rset = null;	
		String sql = prop.getProperty("selectInterest");

		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, categoryNo);
			
			rset = psmt.executeQuery();
			
			while(rset.next()) {
				category.add(rset.getString("INTEREST_NAME"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(psmt);
		}
		
		return category;
	}
	
	public ArrayList<String> selectLocal(Connection conn, int categoryNo){
		ArrayList<String> category = new ArrayList<>();
		
		PreparedStatement psmt = null;
		
		ResultSet rset = null;
		String sql = prop.getProperty("selectLocal");
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, categoryNo);
			
			rset = psmt.executeQuery();
			
			while(rset.next()) {
				category.add(rset.getString("LOCAL_NAME"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(psmt);
		}
		
		return category;
	}
	
	//페이징처리용 
	public int selectListCount(Connection conn) {
		
		int listCount = 0;
		
		PreparedStatement psmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			rset = psmt.executeQuery();
			
			
			if(rset.next()) {
				listCount = rset.getInt("SELL_COUNT");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(psmt);
		}
		
		return listCount;
	}
	
	//페이징처리용 
		public int selectListStatusCount(Connection conn, int type) {
			
			int listCount = 0;
			
			PreparedStatement psmt = null;
			ResultSet rset = null;
			
			String sql = prop.getProperty("selectListStatusCount");
			
			try {
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, type);
				rset = psmt.executeQuery();
				
				
				if(rset.next()) {
					listCount = rset.getInt("SELL_COUNT");
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(psmt);
			}
			
			return listCount;
		}
 
 	public ArrayList<Integer> getTransaction(Connection conn, int userNo){
		ArrayList<Integer> list = new ArrayList<>();
		
		PreparedStatement psmt = null;
		
		ResultSet rset = null;	
		String sql = prop.getProperty("getTransaction");

		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, userNo);

			rset = psmt.executeQuery();
			
			while(rset.next()) {
				list.add(rset.getInt("SELL_NO"));
				list.add(rset.getInt("REVIEW_NO"));
				list.add(rset.getInt("STATUS"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(psmt);
		}
		
		return list;
	}
 	
 	public ArrayList<SellBoard> getSellBoard(Connection conn, int sellNo){
		ArrayList<SellBoard> sell = new ArrayList<>();
		
		PreparedStatement psmt = null;
		
		ResultSet rset = null;
		String sql = prop.getProperty("selectSellBoard");
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, sellNo);
			
			rset = psmt.executeQuery();
			
			while(rset.next()) {
				sell.add(new SellBoard(rset.getInt("SELL_NO"),
									rset.getString("SELL_TITLE"),
									rset.getString("SELL_CONTENT"),
									rset.getInt("PRICE"),
									rset.getString("INTEREST_NAME"),
									rset.getInt("USER_NO")
					));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(psmt);
		}
		
		return sell;
	}
 	
 	public int updateStatus(Connection conn, int userNo, int sellNo, int status) {
		
		int result = 0;
		
		PreparedStatement psmt = null;
		
		String sql = prop.getProperty("updateStatus");
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, status);
			psmt.setInt(2, sellNo);
			psmt.setInt(3, userNo);
			
			result = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(psmt);
		}
		
		return result;
	}

	public ArrayList<Member> submlitListAllSelect(Connection conn) {
		ArrayList<Member> submlitListAllSelect = new ArrayList<>();
		
		PreparedStatement psmt = null;	
		ResultSet rset = null;
		
		String sql = prop.getProperty("submlitListAllSelect");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			rset = psmt.executeQuery();
			
			
			Member m = null;
			while(rset.next()) {
				m = new Member(rset.getInt("SUBNO"),
							   rset.getInt("USER_NO"),
							   rset.getString("USER_NAME"),
							   rset.getString("GENDER"),
							   rset.getString("EMAIL"),
							   rset.getString("PHONE"),
							   rset.getString("SPECIALITY")
							   );		
				submlitListAllSelect.add(m);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(psmt);
		}
		
		return submlitListAllSelect;
	}

	/**
	 * 전문가 인증하기 위한 첨부파일 다 가져오는 메소드
	 * @param conn
	 * @return
	 */
	public ArrayList<Attachment> selectAllAt(Connection conn) {
		
		ArrayList<Attachment> atArr = new ArrayList<>();
		Attachment at = null;
		
		PreparedStatement psmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAllAt");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			rset = psmt.executeQuery();
			
			while(rset.next()) {
				at = new Attachment();
			
				at.setFileNo(rset.getInt("FILE_NO"));
				at.setRefNo(rset.getInt("REF_NO"));
				at.setOriginName(rset.getString("ORIGIN_NAME"));
				at.setChangeName(rset.getString("CHANGE_NAME"));
				at.setFilePath(rset.getString("FILE_PATH"));
				
				atArr.add(at);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return atArr;
	}

	public Review getReview(Connection conn, int reviewNo) {
		Review r = null;
		PreparedStatement psmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getReview");
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, reviewNo);
			rset = psmt.executeQuery();
			
			while(rset.next()) {
				r = new Review(rset.getString("REVIEW_CONTENT"), rset.getDouble("AVG"), rset.getInt("USER_NO"), rset.getInt("SELL_NO"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return r;
	}

	public int selectSubNo(Connection conn, Member m) {
		int subNo = 0;
		PreparedStatement psmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSubNo");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			rset = psmt.executeQuery();
			
			if(rset.next()) {
				subNo = rset.getInt("SUBNO");
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(psmt);
		}
		
		
		return subNo;
	}



	/**
	 * MEMBER.submit 제출했으면 승인 받을때 까지 W로 바꾸는 메소드
	 * @param userNo
	 */
	public void expertWait(Connection conn, int userNo) {
		PreparedStatement psmt = null;
		int result = 0;
		
		String sql = prop.getProperty("expertWait");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, userNo);
			
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			JDBCTemplate.close(psmt);
		}
		
	}

	/**
	 * 전문가 제출한 개인정보를 객체에 담아 가져오는 메소드
	 * @param conn
	 * @param subNo
	 * @return
	 */
	public Member exportData(Connection conn, int subNo) {
		
		Member ExMem = new Member();
		
		PreparedStatement psmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("exportData");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, subNo);
			
			rset = psmt.executeQuery();
			
			if(rset.next()) {
				ExMem = new Member(rset.getInt("SUBNO"),
							   rset.getInt("USER_NO"),
							   rset.getString("USER_NAME"),
							   rset.getString("GENDER"),
							   rset.getString("EMAIL"),
							   rset.getString("PHONE"),
							   rset.getString("SPECIALITY")
							   );
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(psmt);
		}
		
		return ExMem;
	}

	
	/**
	 * 개인정보 담았으니 SUBMIT 테이블에서 데이터를 지워주는 메소드
	 * @param conn
	 * @param subNo
	 * @return
	 */
	public int deleteSubmit(Connection conn, int subNo) {
		PreparedStatement psmt = null;
		
		int result = 0;
		
		String sql = prop.getProperty("deleteSubmit");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, subNo);
			
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(psmt);
		}
		
		return result;
	}

	/**
	 * MEMBER 테이블에 전문가의 개인정보를 넣기
	 * @param conn
	 * @param exMem
	 * @return
	 */
	public int updateToExpert(Connection conn, Member exMem) {

		int result = 0;
		
		PreparedStatement psmt = null;
		
		String sql = prop.getProperty("updateToExpert");
		
		try {
			psmt  = conn.prepareStatement(sql);
//			UPDATE MEMBER
//			SET USER_NAME = ?,
//				GENDER = ?,
//				EMAIL = ?,
//				PHONE = ?,
//				SPECIALITY = ?,
//				EXPERT = 'Y'
//			WHERE USER_NO = ?
			
			psmt.setString(1, exMem.getUserName());
			psmt.setString(2, exMem.getGender());
			psmt.setString(3, exMem.getEmail());
			psmt.setString(4, exMem.getPhone());
			psmt.setString(5, exMem.getSpeciality());
			psmt.setInt(6, exMem.getUserNo());
			
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
