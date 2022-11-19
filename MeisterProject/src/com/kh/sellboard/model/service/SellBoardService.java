package com.kh.sellboard.model.service;

import java.sql.Connection;

import java.util.ArrayList;

import com.kh.common.model.vo.Attachment;
import com.kh.common.model.vo.Interest;
import com.kh.common.model.vo.Local;
import com.kh.common.model.vo.PageInfo;
import com.kh.sellboard.model.dao.SellBoardDao;
import com.kh.sellboard.model.vo.SellBoard;
import static com.kh.common.JDBCTemplate.*;


public class SellBoardService {
	
	public int selectSellBoardListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new SellBoardDao().selectListCount(conn);
		
		close();
		
		return listCount;
	}
	
	
	// 판매게시판 메인 리스트와 페이징처리
	public ArrayList<SellBoard> selectSellBoardList(PageInfo pi){
		
		Connection conn = getConnection();
		
		ArrayList<SellBoard> list = new SellBoardDao().selectSellBoardList(conn, pi);
		
		close();
		
		return list;
		
	}

	// 카테고리 관심사
	public ArrayList<Interest> selectInterestCategory() {
		
		Connection conn = getConnection();
		
		ArrayList<Interest> interest = new SellBoardDao().selectInterestCategory(conn);
		
		close();
		
		return interest;
	}
	
	// 카테고리 지역
	public ArrayList<Local> selectLocalCategory() {
		
		Connection conn = getConnection();
		
		ArrayList<Local> local = new SellBoardDao().selectLocalCategory(conn);
		
		close();
		
		return local;
	}
	
	
	
	// 조회수 증가
	public int increaseCount(int sellNo) {
		
		Connection conn = getConnection();
		
		int result = new SellBoardDao().increaseCount(conn, sellNo);
		
		commitAndRollback(conn, result);
		
		return result;
	}
	
	
	// 판매글 선택
	public SellBoard selectSellBoard(int sellNo) {
        Connection conn = getConnection();
        
        SellBoard s = new SellBoardDao().selectSellBoard(conn, sellNo);
        
        close();
        return s;
    }
	
	// 판매게시글 등록
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
	
	
	
	
    // 파일첨부
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
	 
	 
	

}
