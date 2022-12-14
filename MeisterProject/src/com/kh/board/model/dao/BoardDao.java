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

import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.Attachment;
import com.kh.common.model.vo.PageInfo;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.Reply;

public class BoardDao {
	private Properties prop = new Properties();

	public BoardDao() {
		try {
			prop.loadFromXML(new FileInputStream(BoardDao.class.getResource("/sql/board/board-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int selectListCount(Connection conn, int type, String keyword) {
		// select문 -> Result객체
		int listCount = 0;

		PreparedStatement psmt = null;

		ResultSet rset = null;

		String sql = prop.getProperty("selectListCount");
		
		if("".equals(keyword)) {
			sql = prop.getProperty("selectListCount");
		} else {
			sql = prop.getProperty("selectListSearchCount");
			keyword="%"+keyword+"%";
		}
//		if(!"".equals(keyword)) {
//			sql = prop.getProperty("selectListSearchCount");
//			keyword="%"+keyword+"%";
//		}

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, type);
			
			if(!"".equals(keyword)) {
				psmt.setString(2, "%"+keyword+"%");
			}
			
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
						rset.getString("BOARD_TITLE"),
						0, rset.getString("BOARD_CONTENT"),
						rset.getInt("BOARD_COUNT"),
						rset.getInt("BOARD_RECOMMEND"),
						rset.getString("BOARD_DATE"),
						rset.getInt("USER_NO"),		
						rset.getInt("REPLY_COUNT"));
				board.add(b);
				
			}

			int cnt = board.size();

			if (cnt < 3) {
				for (int i = 0; i < 3 - cnt; i++) {
					Board b = new Board(0, "게시글 없음.", i, "없음", 0, 0, 0 , 0 ,"");
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

	// 게시글 상세보기
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
				b = new Board(
						rset.getInt("BOARD_NO"),
						rset.getString("BOARD_TITLE"),
						rset.getString("BOARD_CONTENT"),
						rset.getInt("BOARD_RECOMMEND"),
						rset.getInt("USER_NO"),
						rset.getString("BOARD_DATE"),
						rset.getString("NICKNAME")
						);
				b.setReplyCount(rset.getInt("REPLY_COUNT"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(psmt);
		}
		return b;
	}

	// 게시글 상세보기 이미지
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
			
			close(rset);
			close(psmt);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(psmt);
		}

		return at;
	}
	
	// 댓글 프로필 
	public Attachment selectAttachment(Connection conn, ArrayList<Reply> list) {

		Attachment at = null;
		PreparedStatement psmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectAttachmentThumbnail");

		try {
			psmt = conn.prepareStatement(sql);
			
			for(Reply r : list) {
				
				psmt.setInt(1, r.getUserNo());
				rset = psmt.executeQuery();
				//글내용 이미지
				if (rset.next()) {
					at = new Attachment();
					
					at.setFileNo(rset.getInt("FILE_NO"));
					at.setOriginName(rset.getString("ORIGIN_NAME"));
					at.setChangeName(rset.getString("CHANGE_NAME"));
					at.setFilePath(rset.getString("FILE_PATH"));
					r.setAt(at);
				}
			}
			
			close(rset);
			close(psmt);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(psmt);
		}

		return at;
	}

	public ArrayList<Board> selectList(Connection conn, int type, String keyword) {

		ArrayList<Board> list = new ArrayList<>();

		PreparedStatement psmt = null;

		ResultSet rset = null;

		String sql = prop.getProperty("selectList");
		
		if("".equals(keyword)) {
			sql = prop.getProperty("selectList");
		} else {
			sql = prop.getProperty("selectListSearch");
			keyword="%"+keyword+"%";
		}

		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, type);
			
			if(!"".equals(keyword)) {
				psmt.setString(2, keyword);
			}
			
			rset = psmt.executeQuery();

			while (rset.next()) {
				String file_name = rset.getString("FILE_PATH") == null ? "" : rset.getString("FILE_PATH");
				String change_name = rset.getString("change_name") == null ? "" : rset.getString("change_name");

				String file = "";
				file = "/" + file_name + "/" + change_name;
				Board b;
				b = new Board(rset.getInt("BOARD_NO"),
						rset.getString("BOARD_TITLE"),
						type, rset.getString("BOARD_CONTENT"),
						rset.getInt("BOARD_COUNT"), 
						rset.getInt("BOARD_RECOMMEND"),
						rset.getInt("USER_NO"),
						rset.getInt("REPLY_COUNT"),
					    rset.getString("BOARD_DATE"));
				
				b.setTitleImg(file);
						
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

	// 게시글 등록
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

	// 게시글 사진 등록
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
	
	// 게시글 수정
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
	
	// 게시글 사진 수정
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
	
	// 게시글 삭제
	public int deleteBoard(int boardNo, Connection conn) {

		int result = 0;

		PreparedStatement psmt = null;

		String sql = prop.getProperty("deleteBoard");

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

	// 게시글 사진 삭제
	public void deleteAttachment(int boardNo, Connection conn) {

		PreparedStatement psmt = null;

		String sql = prop.getProperty("deleteAttachment");

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, boardNo);

			psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(psmt);
		}
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
	
	// 댓글 등록
	public int insertReply(Connection conn, Reply r) {

		int result = 0;

		PreparedStatement psmt = null;

		String sql = prop.getProperty("insertReply");

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, r.getReplyContent());
			psmt.setInt(2, r.getBoardNo());
			psmt.setInt(3, r.getUserNo());

			result = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(psmt);
		}

		return result;
	}
		
	// 댓글 리스트
	public ArrayList<Reply> selectReplyList(Connection conn, int boardNo) {
		
		ArrayList<Reply> list = new ArrayList<>();
		
		PreparedStatement psmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReplyList");
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, boardNo);
			
			
			rset = psmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Reply(
						rset.getInt("REPLY_NO"),
						rset.getString("REPLY_CONTENT"),
						rset.getInt("USER_NO"),
						rset.getString("NICKNAME"),
						rset.getString("REPLY_DATE")
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
	
	// 댓글 수정
	public int updateReply(Connection conn, Reply r) {

		int result = 0;
		PreparedStatement psmt = null;
		String sql = prop.getProperty("updateReply");

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, r.getReplyContent());
			psmt.setInt(2, r.getReplyNo());

			result = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(psmt);
		}

		return result;
	}
	
	// 댓글 삭제
	public int deleteReply(int replyNo, Connection conn) {

		int result = 0;

		PreparedStatement psmt = null;

		String sql = prop.getProperty("deleteReply");

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, replyNo);

			result = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(psmt);
		}
		return result;
	}
	
	public ArrayList<Board> myCommunity(Connection conn,int userNo){
		
			ArrayList<Board> list = new ArrayList<>();
			
			PreparedStatement psmt = null;
			
			ResultSet rset = null;
			
			String sql = prop.getProperty("myCommunity");
			
			try {
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, userNo);
				
				rset = psmt.executeQuery();
		
				while(rset.next()) {
					Board b;
					b = new Board(rset.getInt("BOARD_NO"),
							rset.getString("BOARD_TITLE"),
							rset.getString("BOARD_CONTENT"),
							rset.getInt("BOARD_RECOMMEND"),
							rset.getInt("USER_NO"),
							rset.getInt("REPLY_COUNT"),
						    rset.getString("BOARD_DATE"));
		
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
	
	public int selectListCount2(Connection conn,int type) {
		
		int listCount = 0;
		
		PreparedStatement psmt = null;
		
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount2");
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, type);
			
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
	
	public ArrayList<Reply> myReply(Connection conn,int type) {
			
			ArrayList<Reply> list = new ArrayList<>();
			
			PreparedStatement psmt = null;
			ResultSet rset = null;
			
			String sql = prop.getProperty("myReply");
			
			try {
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, type);
				rset = psmt.executeQuery();
				
				while(rset.next()) {
					list.add(new Reply(
							rset.getInt("REPLY_NO"),
							rset.getInt("BOARD_NO"),
							rset.getString("BOARD_TITLE"),
							rset.getString("REPLY_CONTENT"),
							rset.getString("REPLY_DATE"),
							rset.getInt("USER_NO")
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

	// 좋아요 조회
	public int selectRecommend(Connection conn, int boardNo, int userNo) {

		int result = 0;
	
		PreparedStatement psmt = null;
	
		ResultSet rset = null;
	
		String sql = prop.getProperty("selectRecommend");
	
		try {
			psmt = conn.prepareStatement(sql);
	
			psmt.setInt(1, boardNo);
			psmt.setInt(2, userNo);
	
			rset = psmt.executeQuery();
	
			if (rset.next()) {
				result = rset.getInt("CNT");
			}
	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(psmt);
		}
	
		return result;
	}
	
	// 좋아요 등록
	public int insertRecommend(Connection conn, int boardNo, int userNo) {
		
		int result = 0;
	
		PreparedStatement psmt = null;
	
		String sql = prop.getProperty("insertRecommend");
	
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, boardNo);
			psmt.setInt(2, userNo);
	
			result = psmt.executeUpdate();
	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(psmt);
		}
		return result;
	}
	
	// 좋아요 삭제
	public int deleteRecommend(Connection conn, int boardNo, int userNo) {
		
		int result = 0;
	
		PreparedStatement psmt = null;
	
		String sql = prop.getProperty("deleteRecommend");
		System.out.println(sql);
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, boardNo);
			psmt.setInt(2, userNo);
	
			result = psmt.executeUpdate();
	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(psmt);
		}
		return result;
	}
	
	// 좋아요 갯수
	public int countRecommend(Connection conn, int boardNo) {

		int result = 0;
		PreparedStatement psmt = null;
		ResultSet rset = null;
	
		String sql = prop.getProperty("countRecommend");
	
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, boardNo);
			
			rset = psmt.executeQuery();
	
			if (rset.next()) {
				result = rset.getInt("CNT");
			}
	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(psmt);
		}
		return result;
	}

	public ArrayList<Board> selectAllList(Connection conn) {
		ArrayList<Board> list = new ArrayList<>();
		
		PreparedStatement psmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAllList");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			rset = psmt.executeQuery();
			
			Board b = null;
			
			while(rset.next()) {
				b = new Board(
								rset.getInt("BOARD_NO"),
								rset.getString("BOARD_TITLE"),
								rset.getInt("BOARD_TYPE"),
								rset.getString("BOARD_CONTENT"),
								rset.getInt("BOARD_COUNT"), 
								rset.getInt("BOARD_RECOMMEND"),
								rset.getInt("REPLY_COUNT"));
				
				
				list.add(b);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(psmt);
		}
		
		return list;
	}
	
	public ArrayList<Board> selectBoardList(Connection conn) {
		ArrayList<Board> board = new ArrayList<Board>();
		
		PreparedStatement psmt = null;
		
		ResultSet rset = null;

		String sql = prop.getProperty("selectBoardList");

		try {
			psmt = conn.prepareStatement(sql);

			rset = psmt.executeQuery();

			while (rset.next()) {
				Board b = new Board(
						rset.getInt("BOARD_NO"),
						rset.getString("USER_ID"),
						rset.getString("NICKNAME"),
						rset.getString("BOARD_TITLE"),
						rset.getString("BOARD_DATE"),
						rset.getString("BOARD_CONTENT"),
						rset.getString("STATUS"));
						
				board.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(psmt);
		}

		return board;
	}
	
	public int deleteboardlist(int boardNo, Connection conn) {

		int result = 0;

		PreparedStatement psmt = null;

		String sql = prop.getProperty("deleteboardlist");

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
	
	public ArrayList<Reply> replyList(Connection conn, int boardNo) {

		ArrayList<Reply> rlist = new ArrayList<>();

		PreparedStatement psmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("replyList");

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, boardNo);

			rset = psmt.executeQuery();

			while (rset.next()) {
				rlist.add(new Reply(rset.getInt("REPLY_NO"), 
									rset.getString("USER_ID"),
									rset.getString("NICKNAME"), 
									rset.getString("REPLY_DATE"),
									rset.getString("REPLY_CONTENT"),
									rset.getString("STATUS")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(psmt);
		}

		return rlist;
	}
	
	// 관리자 댓글 삭제
	public int deleteReplylist(int replyNo, Connection conn) {

		int result = 0;

		PreparedStatement psmt = null;

		String sql = prop.getProperty("deleteReplylist");

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, replyNo);

			result = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(psmt);
		}
		return result;
	}


}	