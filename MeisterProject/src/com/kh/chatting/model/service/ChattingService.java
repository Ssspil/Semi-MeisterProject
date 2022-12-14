package com.kh.chatting.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.chatting.model.dao.ChattingDao;
import com.kh.chatting.model.vo.Chatting;
import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.Attachment;

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
	
	public Chatting selectChatList(int receiver, int sender, int sellNo){
		Connection conn = JDBCTemplate.getConnection();
		Chatting list = new ChattingDao().selectChatList(conn, receiver, sender, sellNo);
		
		JDBCTemplate.close();
		return list;
	}
	
	public ArrayList<Chatting> selectNote(int sender, int receiver, int sellNo){
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Chatting> list = new ChattingDao().selectNote(conn, sender, receiver, sellNo);
		
		JDBCTemplate.close();
		return list;
	}
	
	public ArrayList<Integer> selectAllReceiver() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Integer> list = new ChattingDao().selectAllReceiver(conn);
		
		JDBCTemplate.close();
		return list;
	}
	
	public ArrayList<Integer> selectAllSender() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Integer> list = new ChattingDao().selectAllSender(conn);
		
		JDBCTemplate.close();
		return list;
	}
	
	public ArrayList<Integer> selectAllSellNo() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Integer> list = new ChattingDao().selectAllSellNo(conn);
		
		JDBCTemplate.close();
		return list;
	}
	
	public String selectAllSellTitle(int sellNo) {
		Connection conn = JDBCTemplate.getConnection();
		String title = new ChattingDao().selectAllSellTitle(conn, sellNo);
		
		JDBCTemplate.close();
		return title;
	}
	
	public ArrayList<Chatting> selectChatDetail(int receiver, int sender, int sellNo){
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Chatting> list = new ChattingDao().selectChatDetail(conn, receiver, sender, sellNo);
		
		JDBCTemplate.close();
		return list;
	}
	
	public ArrayList<String> selectChatDate(int receiver, int sender, int sellNo){
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<String> list = new ChattingDao().selectChatDate(conn, receiver, sender, sellNo);
		
		JDBCTemplate.close();
		return list;
	}
	
	public Attachment getProfile(int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		Attachment at = new ChattingDao().getProfile(conn, userNo);
		
		JDBCTemplate.close();
		return at;
	}
}
