package com.kh.chatting.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.chatting.model.dao.ChattingDao;
import com.kh.chatting.model.vo.Chatting;
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
	
	public ArrayList<Chatting> selectNoteList(int userNo){
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Chatting> list = new ChattingDao().selectNoteList(conn, userNo);
		
		JDBCTemplate.close();
		return list;
	}
	
	public ArrayList<Chatting> selectNote(int sender, int receiver, int sellNo){
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Chatting> list = new ChattingDao().selectNote(conn, sender, receiver, sellNo);
		
		JDBCTemplate.close();
		return list;
	}
}
