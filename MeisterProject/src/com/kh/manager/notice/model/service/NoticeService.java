package com.kh.manager.notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;
import com.kh.manager.notice.model.dao.NoticeDao;
import com.kh.manager.notice.model.vo.Notice;

public class NoticeService {
    
	
    public int insertNotice(Notice n) {
        Connection conn = JDBCTemplate.getConnection();
        
        int result = new NoticeDao().insertNotice(n, conn);
        
        if (result > 0) {
        	JDBCTemplate.commit(conn);
        } else {
        	JDBCTemplate.rollback(conn);
        }
        
        JDBCTemplate.close();
        
        return result;
    }

    
    public ArrayList<Notice> selectNoticeList(PageInfo pi){
        
        Connection conn = JDBCTemplate.getConnection();
        
        ArrayList<Notice> list = new NoticeDao().selectNoticeList(pi ,conn);
        
        JDBCTemplate.close();
        
        return list;
     
    }

	public Notice selectNotice(int noticeNo) {

		Connection conn = JDBCTemplate.getConnection();
		
		Notice n = new NoticeDao().selectNotice(noticeNo, conn);
		
		JDBCTemplate.close();
		
		return n;		
	}


	public int selectNoticeListCount() {

		Connection conn = JDBCTemplate.getConnection();
		int listCount = new NoticeDao().selectNoticeListCount(conn); //select문이긴한데 갯수를 세야하는거라서 int
		
		JDBCTemplate.close();
		
		return listCount;
	}


	public int deleteNoticeBoard(int noticeNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new NoticeDao().deleteNoticeBoard(noticeNo, conn);
				
		if(result > 0 ) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close();
		
		return result;
	}


	public int updateNoticeBoard(Notice n) {
		
		Connection conn = JDBCTemplate.getConnection();
        
        int result = new NoticeDao().updateNoticeBoard(n, conn);
        
        if (result > 0) {
        	JDBCTemplate.commit(conn);
        } else {
        	JDBCTemplate.rollback(conn);
        }
        
        JDBCTemplate.close();
        
        return result;
	}


	public ArrayList<Notice> searchNotice(String search, PageInfo pi) {
		
		Connection conn = JDBCTemplate.getConnection();
        
        ArrayList<Notice> list = new NoticeDao().searchNotice(search, pi, conn);
        
        JDBCTemplate.close();
        
        return list;
		
	}
	

	public int searchNoticeCount(String search) {

		Connection conn = JDBCTemplate.getConnection();
		
		int listCount = new NoticeDao().searchNoticeCount(search, conn);
		
		JDBCTemplate.close();
		
		return listCount;
	}


		
	
	}
