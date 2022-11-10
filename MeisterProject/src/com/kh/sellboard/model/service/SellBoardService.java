package com.kh.sellboard.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.Interest;
import com.kh.common.model.vo.Local;
import com.kh.sellboard.model.dao.SellBoardDao;

public class SellBoardService {

	public ArrayList<Interest> selecInterestCategory() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Interest> inteset = new SellBoardDao().selecInterestCategory(conn);
		
		JDBCTemplate.close();
		
		return inteset;
	}

	public ArrayList<Local> selecLocalCategory() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Local> local = new SellBoardDao().selecLocalCategory(conn);
		
		JDBCTemplate.close();
		
		return local;
	}

}
