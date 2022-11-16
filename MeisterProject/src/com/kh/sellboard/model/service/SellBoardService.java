package com.kh.sellboard.model.service;

import java.sql.Connection;

import java.util.ArrayList;

import com.kh.common.model.vo.Attachment;
import com.kh.common.model.vo.Interest;
import com.kh.common.model.vo.Local;
import com.kh.sellboard.model.dao.SellBoardDao;
import com.kh.sellboard.model.vo.SellBoard;
import static com.kh.common.JDBCTemplate.*;


public class SellBoardService {

	public ArrayList<Interest> selecInterestCategory() {
		
		Connection conn = getConnection();
		
		ArrayList<Interest> Interest = new SellBoardDao().selecInterestCategory(conn);
		
		close();
		
		return Interest;
	}

	public ArrayList<Local> selecLocalCategory() {
		
		Connection conn = getConnection();
		
		ArrayList<Local> local = new SellBoardDao().selecLocalCategory(conn);
		
		close();
		
		return local;
	}
	
	public int increaseCount(int sellNo) {
		
		Connection conn = getConnection();
		
		int result = new SellBoardDao().increaseCount(conn, sellNo);
		
		commitAndRollback(conn, result);
		
		return result;
	}
	
	
	// 게시판 선택?
//	public SellBoard selectSellBoard(int sellNo) {
//        Connection conn = getConnection();
//        
//        SellBoard s = new SellBoardDao().selectSellBoard(conn, sellNo);
//        
//        close();
//        return s;
//    }
    
    public Attachment selectAttachment(int sellNo) {
        Connection conn = getConnection();
        
        Attachment at = new SellBoardDao().selectAttachment(conn, sellNo);
        
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
	
	public int insertSellBoard(SellBoard s, Attachment at) {
		Connection conn = getConnection();
		
		int result1 = new SellBoardDao().insertSellBoard(s, conn);
		
		int result2 = 1;
		
		if(at != null) {
			result2 = new SellBoardDao().insertAttachment(at, conn);
		}
		
		// 트랜잭션 처리
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close();
		
		return result1 * result2;
		
	}

}
