package com.kh.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import static com.kh.common.JDBCTemplate.*;

import com.kh.board.model.dao.BoardDao;
import com.kh.common.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.common.model.vo.PageInfo;

public class BoardService {
	 public int selectListCount() {
			Connection conn = getConnection();
			
			int listCount = new BoardDao().selectListCount(conn);
			
			close();
			
			return listCount;
		}
		
		public ArrayList<Board> selectList(PageInfo pi){
			Connection conn = getConnection();
			
			ArrayList<Board> list = new BoardDao().selectList(conn, pi);
			
			close();
			
			return list;
		}
		
		public ArrayList<Board> getHotBoard(){
			Connection conn = getConnection();
			
			ArrayList<Board> list = new BoardDao().getHotBoard(conn);
			
			close();
			
			return list;
		}
	
		public int increaseCount(int boardNo) {
			
			Connection conn = getConnection();
			
			int result = new BoardDao().increaseCount(conn, boardNo);
			
			commitAndRollback(conn, result);
			
			return result;
		}
	public int insertBoard(Board b , Attachment at) {
		Connection conn = getConnection();
		
		int result1 = new BoardDao().insertBoard(b, conn);
		
		int result2 = 1;
		
		if(at != null) {
			result2 = new BoardDao().insertAttachment(at, conn);
		}
	
		if(result1 > 0 && result2 > 0) {
		
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close();
		
		return result1 * result2;
		
		
		
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
	public void commitAndRollback(Connection conn, int result) {
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close();
	}
	
}
