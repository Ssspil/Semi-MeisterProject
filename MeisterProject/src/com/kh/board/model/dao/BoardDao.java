package com.kh.board.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;

import com.kh.common.model.vo.Attachment;
import com.kh.common.model.vo.PageInfo;
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
	
	public int selectListCount(Connection conn) {
		// select문 -> Result객체
		int listCount = 0;
		
		PreparedStatement psmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			rset = psmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("BOARD_COUNT");
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(psmt);
		}
		
		return listCount;
	}
	
	public ArrayList<Board> getHotBoard(Connection conn){
		ArrayList<Board> board = new ArrayList<Board>();
		PreparedStatement psmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getHotBoard");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			rset = psmt.executeQuery();
			
			if(rset.next()) {
				Board b = new Board(
						rset.getInt("BOARD_NO"),
						rset.getString("BOARD_CONTENT"),
						rset.getString("BOARD_TITLE"),
						rset.getInt("BOARD_COUNT"),
						rset.getInt("BOARD_RECOMMEND"),
						rset.getInt("USER_NO"),
						rset.getDate("BOARD_DATE")
					);
				
				board.add(b);
			}	
			
			int cnt = board.size();
			
			if(board.size() < 3) {
				
				for(int i=0; i < 3-cnt; i++){
					Board b = new Board(0,"작성된 게시글이 없습니다.","없음",0,0,0,new Date());
					board.add(b);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(psmt);
		}
		
		return board;
	}
	
public Board selectBoard(Connection conn , int boardNo) {
		
		// select= > ResultSet
		
		Board b = null;
		PreparedStatement psmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBoard");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, boardNo);
			
			rset = psmt.executeQuery();
			
			if(rset.next()) {
				b = new Board(
						rset.getInt("BOARD_NO"),
						rset.getString("BOARD_CONTENT"),
						rset.getString("BOARD_TITLE"),
						rset.getInt("BOARD_COUNT"),
						rset.getInt("BOARD_RECOMMEND"),
						rset.getInt("USER_NO"),
						rset.getDate("BOARD_DATE")
						);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(psmt);
		}
		return b;
	}

public Attachment selectAttachment(Connection conn, int boardNo) {
	
	Attachment at = null;
	PreparedStatement psmt = null;
	ResultSet rset = null;
	
	String sql = prop.getProperty("selectAttachment");
	
	try {
		psmt = conn.prepareStatement(sql);
		psmt.setInt(1, boardNo);
		
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
		close(rset);
		close(psmt);
	}
	
	
	return at;
}
	public ArrayList<Board> selectList(Connection conn , PageInfo pi){
		
		// select 문 => ResultSet
		ArrayList<Board> list = new ArrayList<>();
		
		PreparedStatement psmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			psmt.setInt(1, startRow);
			psmt.setInt(2, endRow);
			
			rset = psmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt("BOARD_NO"),
						 rset.getString("BOARD_CONTENT"),
						  rset.getString("BOARD_TITLE"),
						  rset.getInt("BOARD_COUNT"),
						  rset.getInt("BOARD_RECOMMEND"),
						  rset.getInt("USER_NO"),
						  rset.getDate("BOARD_DATE")
						  ));
			}
		
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(psmt);
		}
		
		return list;
	}
public int increaseCount(Connection conn, int boardNo) {
		
		int result = 0;
		
		PreparedStatement psmt = null;
		
		String sql = prop.getProperty("increaseCount");
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, boardNo);
			
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(psmt);
		}
		
		return result;
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
