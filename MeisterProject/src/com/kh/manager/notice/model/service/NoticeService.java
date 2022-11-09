package com.kh.manager.notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
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
}
