package com.kh.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import static com.kh.common.JDBCTemplate.*;

import com.kh.board.model.dao.BoardDao;
import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.Reply;
import com.kh.chatting.model.dao.ChattingDao;
import com.kh.common.model.vo.PageInfo;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

public class BoardService {
	public int selectListCount(int type, String keyword) {
		Connection conn = getConnection();

		int listCount = new BoardDao().selectListCount(conn, type, keyword);

		close();

		return listCount;
	}

	public ArrayList<Board> selectList(int type, String keyword) {
		Connection conn = getConnection();

		ArrayList<Board> list = new BoardDao().selectList(conn, type, keyword);

		close();
		return list;
	}

	public ArrayList<Board> getHotBoard() {
		Connection conn = getConnection();

		ArrayList<Board> list = new BoardDao().getHotBoard(conn);

		close();

		return list;
	}

	public int increaseCount(int boardNo) {

		Connection conn = getConnection();

		int result = new BoardDao().increaseCount(boardNo, conn);

		commitAndRollback(conn, result);

		return result;
	}

	public int insertBoard(Board b, Attachment at, int type) {
		Connection conn = getConnection();

		int result1 = new BoardDao().insertBoard(b, conn, type);

		int result2 = 1;

		
		 if (at != null) { result2 = new BoardDao().insertAttachment(at, conn); }
		

		if (result1 > 0 && result2 > 0) {

			commit(conn);
		} else {
			rollback(conn);
		}

		close();

		return result1 * result2;

	}
	
	public int updateBoard(Board b, Attachment at) {
		Connection conn = getConnection();
		
		int result = new BoardDao().updateBoard(conn, b);
		
		int result2 = 1;
		
		if(at != null) {
			
			if(at.getFileNo() != 0) {
				
				result2 = new BoardDao().updateAttachment(at, conn);
			} else { // 기존에 첨부파일이 없었을경우 => insert문 실행
				result2 = new BoardDao().insertNewAttachment(at, conn);
			}
		}
		
		if(result > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close();
		
		return result * result2;
	}
	
	public int deleteBoard(int boardNo) {
		Connection conn = getConnection();
		
		int result = new BoardDao().deleteBoard(boardNo, conn);
		
		new BoardDao().deleteAttachment(boardNo, conn);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close();
		
		return result;
	}

	public Board selectBoard(int boardNo) {

		Connection conn = getConnection();

		Board b = new BoardDao().selectBoard(conn, boardNo);

		close();

		return b;

	}
	

	public Attachment selectAttachment(int boardNo) {
		Connection conn = getConnection();

		Attachment at = new BoardDao().selectAttachment(conn, boardNo);

		close();

		return at;
	}
	
	public ArrayList<Board> searchList(String searchType, String keyword){
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().searchList(conn , searchType , keyword);
		
		close();
		
		return list;
		
	}

	public void commitAndRollback(Connection conn, int result) {
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close();
	}
	
	// 댓글
	public int insertReply(Reply r) {
		
		Connection conn = getConnection();
		
		int result = new BoardDao().insertReply(conn, r);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}
	
	public ArrayList<Reply> selectReplyList(int boardNo) {
		
		Connection conn = getConnection();
		
		ArrayList<Reply> list = new BoardDao().selectReplyList(conn, boardNo);
		
		new BoardDao().selectAttachment(conn, list);
		
		close();
		
		return list;
	}
	
	public int updateReply(Reply r) {
		Connection conn = getConnection();
		
		int result = new BoardDao().updateReply(conn, r);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close();
		
		return result;
	}
	
	public int deleteReply(int replyNo) {
		
		Connection conn = getConnection();
		
		int result = new BoardDao().deleteReply(replyNo, conn);

		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close();
		
		return result;
	}
	
	
	public ArrayList<Board> myCommunity(int userNo){
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().myCommunity(conn,userNo);
		
		close();
		
		return list;
	}
	
	public int selectListCount2(int type) {
		Connection conn = getConnection();

		int listCount = new BoardDao().selectListCount2(conn,type);

		close();

		return listCount;
	}
	
	public ArrayList<Reply> myReply(int type) {
			
			Connection conn = getConnection();
			
			ArrayList<Reply> list = new BoardDao().myReply(conn,type);
			
			close();
			
			return list;
		}
	
	public int selectRecommend(int boardNo, int userNo) {
		
		Connection conn = getConnection();
	
		int result = new BoardDao().selectRecommend(conn, boardNo, userNo);
	
		close();
	
		return result;
	}
	
	public int insertRecommend(int boardNo, int userNo) {
		
		Connection conn = getConnection();
	
		int result = new BoardDao().insertRecommend(conn, boardNo, userNo);
	
		close();
	
		return result;
	}
	
	public int deleteRecommend(int boardNo, int userNo) {
		
		Connection conn = getConnection();
	
		int result = new BoardDao().deleteRecommend(conn, boardNo, userNo);
	
		close();
	
		return result;
	}
	
	public int countRecommend(int boardNo) {
		
		Connection conn = getConnection();
	
		int result = new BoardDao().countRecommend(conn, boardNo);
	
		close();
	
		return result;
	}
	
	public int countRecommend(int boardNo, int num) {
		
		Connection conn = getConnection();
	
		int result = new BoardDao().countRecommend(conn, boardNo);
	
		close();
	
		return result;
	}

	/**
	 * 게시글 전체 다 가져오는 메소드
	 * @return
	 */
	public ArrayList<Board> selectAllList() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Board> list = new BoardDao().selectAllList(conn);
		
		JDBCTemplate.close();
		
		return list;
	}
	public ArrayList<Board> selectBoardList() {
		Connection conn = getConnection();

		ArrayList<Board> list = new BoardDao().selectBoardList(conn);

		close();

		return list;
	}
	
	public Board deleteboardlist(int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result1 = new BoardDao().deleteboardlist(conn, userNo);
		
		Member delMem = null;

		if(result1 > 0) {
			delMem = new BoardDao().selectMemberByNo(conn, userNo);
			
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		
		return delMem;
	}

}
