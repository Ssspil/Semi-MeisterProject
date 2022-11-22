package com.kh.chatting.model.dao;

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

import com.kh.chatting.model.vo.Chatting;
import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.Attachment;
import com.kh.member.model.dao.MemberDao;

public class ChattingDao {
	private Properties prop = new Properties();
	
	public ChattingDao() {
		String fileName = MemberDao.class.getResource("/sql/chatting/chatting-mapper.xml").getPath();
		
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
	
	public int insertChatting(Connection conn, String chatData) {
		int result = 0;
		String data[] = chatData.split(",");
		String content = "";
		int sender = 0;
		int receiver = 0;
		PreparedStatement psmt = null;
		
		String sql = prop.getProperty("insertChat");
		
		try {
			for(int i = 0; i < data.length; i += 3) {
				psmt = conn.prepareStatement(sql);
				content = data[i+2];
				sender = Integer.parseInt(data[i]);
				receiver = Integer.parseInt(data[i+1]);
				System.out.println("content : "+content+" sender : "+sender+" receiver : "+receiver);
				
				psmt.setString(1, content);
				psmt.setInt(2, sender);
				psmt.setInt(3, receiver);
				psmt.setInt(4, 1);
				
				result = psmt.executeUpdate();
				psmt = null;
			}
				
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(psmt);
		}
		
		return result;
	}
	
	public Chatting selectNoteList(Connection conn, int receiver, int sender){
		Chatting list = null;
		
		PreparedStatement psmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectNoteList");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, sender);
			psmt.setInt(2, receiver);
			psmt.setInt(3, receiver);
			psmt.setInt(4, sender);
			
			rset = psmt.executeQuery();

			while(rset.next()) {
				list = new Chatting(rset.getInt("CHAT_NO"),
									rset.getString("CHAT_CONTENT"),
									rset.getString("CHAT_DATE"),
									rset.getInt("SENDER"),
									rset.getInt("RECEIVER"),
									rset.getInt("SELL_NO")
				);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(psmt);
		}
		
		return list;
	}
	
	public ArrayList<Chatting> selectNote(Connection conn, int sender, int receiver, int sellNo){
		ArrayList<Chatting> list = new ArrayList<>();
		
		PreparedStatement psmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectNote");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, sender);
			psmt.setInt(2, receiver);
			psmt.setInt(3, sellNo);
			
			rset = psmt.executeQuery();

			while(rset.next()) {
				list.add(new Chatting(rset.getInt("CHAT_NO"),
									rset.getString("CHAT_CONTENT"),
									rset.getString("CHAT_DATE"),
									rset.getInt("SENDER"),
									rset.getInt("RECEIVER"),
									rset.getInt("SELL_NO")
				));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(psmt);
		}
		
		return list;
	}
	
	public ArrayList<Integer> selectAllReceiver(Connection conn){
		ArrayList<Integer> list = new ArrayList<>();
		
		PreparedStatement psmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAllReceiver");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			rset = psmt.executeQuery();
			while(rset.next()) {
				list.add(rset.getInt("RECEIVER"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(psmt);
		}
		
		return list;
	}
	
	public ArrayList<Integer> selectAllSender(Connection conn){
		ArrayList<Integer> list = new ArrayList<>();
		
		PreparedStatement psmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAllSender");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			rset = psmt.executeQuery();
			while(rset.next()) {
				list.add(rset.getInt("SENDER"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(psmt);
		}
		
		return list;
	}
	
	public ArrayList<Chatting> selectChatDetail(Connection conn, int receiver, int sender, int sellNo){
		ArrayList<Chatting> list = new ArrayList<Chatting>();
		
		PreparedStatement psmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectChatDetail");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, sender);
			psmt.setInt(2, receiver);
			psmt.setInt(3, sellNo);
			psmt.setInt(4, receiver);
			psmt.setInt(5, sender);
			psmt.setInt(6, sellNo);
			
			rset = psmt.executeQuery();

			while(rset.next()) {
				list.add(new Chatting(rset.getInt("CHAT_NO"),
									rset.getString("CHAT_CONTENT"),
									rset.getString("CHAT_DATE"),
									rset.getInt("SENDER"),
									rset.getInt("RECEIVER"),
									rset.getInt("SELL_NO")
				));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(psmt);
		}
		
		return list;
	}
	
	public ArrayList<String> selectChatDate(Connection conn, int receiver, int sender, int sellNo){
		ArrayList<String> list = new ArrayList<String>();
		
		PreparedStatement psmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectChatDate");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, sender);
			psmt.setInt(2, receiver);
			psmt.setInt(3, sellNo);
			psmt.setInt(4, receiver);
			psmt.setInt(5, sender);
			psmt.setInt(6, sellNo);
			
			rset = psmt.executeQuery();

			while(rset.next()) {
				list.add(rset.getString("CHAT_DATE"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(psmt);
		}
		
		return list;
	}
	
	public Attachment getProfile(Connection conn, int userNo) {
		
		Attachment at = null;
		PreparedStatement psmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getProfile");
		
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
}
