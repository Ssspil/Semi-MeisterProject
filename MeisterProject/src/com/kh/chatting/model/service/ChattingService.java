package com.kh.chatting.model.service;

import java.sql.Connection;

import com.kh.chatting.model.dao.ChattingDao;
import com.kh.common.JDBCTemplate;

public class ChattingService {
	
	public int insertChatting(String chatData) {
	      Connection conn = JDBCTemplate.getConnection();
	      
	      int result = new ChattingDao().insertChatting(conn, chatData);
	      System.out.println("service : "+result);
	      if(result > 0) {
	         JDBCTemplate.commit(conn);
	      }else {
	         JDBCTemplate.rollback(conn);
	      }
	      
	      JDBCTemplate.close();
	      
	      return result;
	}
}
