package com.kh.member.model.dao;

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
		System.out.println("DAO : "+ result);
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
	
}
