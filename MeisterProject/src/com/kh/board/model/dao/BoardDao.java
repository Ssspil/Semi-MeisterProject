package com.kh.board.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.common.model.vo.Attachment;
import com.kh.board.model.vo.Board;

public class BoardDao {
private Properties prop = new Properties();
	
	public BoardDao() {
		try {
			prop.loadFromXML(new FileInputStream(BoardDao.class.getResource("/sql/board/board-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertBoard(Board b , Connection conn) {
		
		int result = 0; 
		
		PreparedStatement psmt = null;
		
		String sql = prop.getProperty("insertBoard");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, b.getBoardTitle());
			psmt.setString(2, b.getBoardContent());
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(psmt);
		}
		
		return result;
	}
	
public int insertAttachment(Attachment at, Connection conn) {
		
		int result = 0;
		PreparedStatement psmt = null;
		
		String sql = prop.getProperty("insertAttachment");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, at.getOriginName());
			psmt.setString(2, at.getChangeName());
			psmt.setString(3, at.getFilePath());
			
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(psmt);
		}
		return result;
	}
	

	
	
}
