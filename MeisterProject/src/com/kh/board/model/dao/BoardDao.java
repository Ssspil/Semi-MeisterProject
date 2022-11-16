package com.kh.board.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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

	public int selectListCount(Connection conn, int type) {
		// select문 -> Result객체
		int listCount = 0;

		PreparedStatement psmt = null;

		ResultSet rset = null;

		String sql = prop.getProperty("selectListCount");

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, type);
			rset = psmt.executeQuery();

			if (rset.next()) {
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

	public ArrayList<Board> getHotBoard(Connection conn) {
		ArrayList<Board> board = new ArrayList<Board>();
		PreparedStatement psmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("getHotBoard");

		try {
			psmt = conn.prepareStatement(sql);

			rset = psmt.executeQuery();

			while (rset.next()) {
				Board b = new Board(rset.getInt("BOARD_NO"),
						rset.getString("BOARD_CONTENT"),
						rset.getString("BOARD_TITLE"),
						rset.getInt("BOARD_COUNT"),
						rset.getInt("BOARD_RECOMMEND"),
						rset.getInt("USER_NO"),
						rset.getInt("REPLY_COUNT"),
						rset.getString("BOARD_DATE"));

				board.add(b);
			}

			int cnt = board.size();

			if (cnt < 3) {

				for (int i = 0; i < 3 - cnt; i++) {
					Board b = new Board(0, "작성된 게시글이 없습니다.", "없음", 0, 0, 0, "", "");
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

	public Board selectBoard(Connection conn, int boardNo) {

		Board b = null;
		
		PreparedStatement psmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectBoard");

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, boardNo);

			rset = psmt.executeQuery();

			if (rset.next()) {
				b = new Board(rset.getInt("BOARD_NO"),
						rset.getString("BOARD_CONTENT"),
						rset.getString("BOARD_TITLE"),
						rset.getInt("BOARD_COUNT"),
						rset.getInt("BOARD_RECOMMEND"),
						rset.getInt("USER_NO"),
						rset.getString("NICKNAME"),
						rset.getString("BOARD_DATE")
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

			if (rset.next()) {
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

	public ArrayList<Board> selectList(Connection conn, int type) {

		// select 문 => ResultSet
		ArrayList<Board> list = new ArrayList<>();

		PreparedStatement psmt = null;

		ResultSet rset = null;

		String sql = prop.getProperty("selectList");

		try {
			psmt = conn.prepareStatement(sql);

			// int startPage = pi.getStartPage();
			// int boardLimit = pi.getStartPage() * pi.getBoardLimit();
			psmt.setInt(1, type);

			System.out.println("type:" + type);
			// psmt.setInt(2, boardLimit);

			rset = psmt.executeQuery();

			while (rset.next()) {
				String file_name = rset.getString("FILE_PATH") == null ? "" : rset.getString("FILE_PATH");
				String change_name = rset.getString("change_name") == null ? "" : rset.getString("change_name");

				String file = "";
				file = file_name + "/" + change_name;
				Board b;
				b = new Board(rset.getInt("BOARD_NO"), rset.getString("BOARD_CONTENT"), rset.getString("BOARD_TITLE"),
						rset.getInt("BOARD_COUNT"), rset.getInt("BOARD_RECOMMEND"), rset.getInt("USER_NO"),
						rset.getString("BOARD_DATE"), file);

				list.add(b);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(psmt);
		}

		return list;
	}

	public int increaseCount(int boardNo, Connection conn) {

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

	public int insertBoard(Board b, Connection conn, int type) {

		int result = 0;

		PreparedStatement psmt = null;

		String sql = prop.getProperty("insertBoard");

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, b.getBoardTitle());
			psmt.setString(2, b.getBoardContent());
			psmt.setInt(3, b.getUserNo());
			psmt.setInt(4, type);
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
	
	public int insertNewAttachment(Attachment at, Connection conn) {

		int result = 0;
		PreparedStatement psmt = null;

		String sql = prop.getProperty("insertNewAttachment");

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, at.getRefNo());
			psmt.setString(2, at.getOriginName());
			psmt.setString(3, at.getChangeName());
			psmt.setString(4, at.getFilePath());

			result = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(psmt);
		}

		return result;
	}
	
	public int updateBoard(Connection conn, Board b) {
		
		int result = 0;
		PreparedStatement psmt = null;
		String sql = prop.getProperty("updateBoard");
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, b.getBoardTitle());
			psmt.setString(2, b.getBoardContent());
			psmt.setInt(3, b.getBoardNo());
			
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(psmt);
		}
		
		return result;
	}
	
	public int updateAttachment(Attachment at, Connection conn) {

		int result = 0;
		PreparedStatement psmt = null;
		String sql = prop.getProperty("updateAttachment");

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, at.getOriginName());
			psmt.setString(2, at.getChangeName());
			psmt.setString(3, at.getFilePath());
			psmt.setInt(4, at.getFileNo());

			result = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(psmt);
		}

		return result;
	}
	
	public ArrayList<Board> searchList(Connection conn, String searchType, String keyword){
		   ArrayList<Board> list = new ArrayList<>();
		   
		   PreparedStatement psmt = null;
		   
		   ResultSet rset = null;
		   
		   String sql=prop.getProperty("searchList");

		   sql = sql.replace("@", searchType); 
		   
		   try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, "%"+keyword+"%"); //
			
			rset = psmt.executeQuery();
			
			while(rset.next()) {
				Board b = new Board();
				b.setBoardTitle(rset.getString("BOARD_TITLE"));
				list.add(b);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(psmt);
		}
		   return list;
	   }

}
