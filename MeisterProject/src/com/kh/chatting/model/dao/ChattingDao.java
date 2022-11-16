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
	
	public ArrayList<Chatting> selectNoteList(Connection conn, int userNo){
		ArrayList<Chatting> list = new ArrayList<>();
		
		PreparedStatement psmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectNoteList");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, userNo);
			
			rset = psmt.executeQuery();

			while(rset.next()) {
				list.add(new Chatting(rset.getInt("CHAT_NO"),
									rset.getString("CHAT_CONTENT"),
									rset.getDate("CHAT_DATE"),
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
									rset.getDate("CHAT_DATE"),
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
}
