package com.kh.chatting.model.dao;

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
			psmt = conn.prepareStatement(sql);
			
			content = data[2];
			sender = Integer.parseInt(data[0]);
			receiver = Integer.parseInt(data[1]);
			System.out.println("content : "+content+" sender : "+sender+" receiver : "+receiver);
			
			psmt.setString(1, content);
			psmt.setInt(2, sender);
			psmt.setInt(3, receiver);
			psmt.setInt(4, 1);
				
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(psmt);
		}
		
		return result;
	}
}
