package com.kh.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import static com.kh.common.JDBCTemplate.*;

import com.kh.board.model.dao.BoardDao;
import com.kh.common.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.common.model.vo.PageInfo;

public class BoardService {
	
	
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
	
}
