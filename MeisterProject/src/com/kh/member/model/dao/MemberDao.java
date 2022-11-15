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
import com.kh.manager.notice.model.vo.Notice;
import com.kh.member.model.vo.Member;

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
		

	public int expertSubmit(Connection conn, Member m) {
		int result = 0;

		PreparedStatement psmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("expertSubmit");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, m.getUserName());
			psmt.setString(2, m.getGender());
			psmt.setString(3, m.getEmail());
			psmt.setString(4, m.getPhone());
			psmt.setString(5, m.getSpeciality());
			psmt.setString(6, m.getExpSubmit());
			psmt.setString(7, m.getUserId());
			
			result = psmt.executeUpdate();	
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
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
	
	public Attachment selectAttachment(Connection conn, int userNo) {
		
		Attachment at = null;
		PreparedStatement psmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAttachment");
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, userNo);
			
			rset = psmt.executeQuery();
			
			if(rset.next()) {
				at = new Attachment();
				
				at.setFileNo(rset.getInt("FILE_NO"));
				at.setOriginName(rset.getString("ORIGIN_NAME"));
				at.setChangeName(rset.getNString("CHANGE_NAME"));
				at.setFilePath(rset.getNString("FILE_PATH"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(psmt);
		}
		
		return at;
	}

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
		}
		
		return memList;
	}
	
}
