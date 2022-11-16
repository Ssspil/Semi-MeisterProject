package com.kh.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import static com.kh.common.JDBCTemplate.*;

import com.kh.board.model.dao.BoardDao;
import com.kh.common.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.common.model.vo.PageInfo;

public class BoardService {
	public int selectListCount(int type) {
		Connection conn = getConnection();

		int listCount = new BoardDao().selectListCount(conn, type);

		close();

		return listCount;
	}

	public ArrayList<Board> selectList(int type) {
		Connection conn = getConnection();

		ArrayList<Board> list = new BoardDao().selectList(conn, type);

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

		if (at != null) {
			result2 = new BoardDao().insertAttachment(at, conn);
		}

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

	public Board selectBoard(int boardNo) {

		Connection conn = getConnection();

		Board b = new BoardDao().selectBoard(conn, boardNo);

		close();

		return b;

	}
	
	public int selectBoardWriter(int boardNo) {
		Connection conn = getConnection();

		int no = new BoardDao().selectBoardWriter(conn, boardNo);

		close();

		return no;
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

}
