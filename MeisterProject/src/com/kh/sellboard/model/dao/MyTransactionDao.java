package com.kh.sellboard.model.dao;

import java.io.FileInputStream;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import static com.kh.common.JDBCTemplate.*;

import com.kh.sellboard.model.vo.Transaction;

public class MyTransactionDao {
	
	private Properties prop = new Properties();
	
	public MyTransactionDao() {
        // 1) NoticeDao.class = WEB-INF/classes/com/kh/notice/model/dao.NoticeDao.class를 나타내고
        // 2) NoticeDao.class.getResource = classes를 나타내고
        // 3) ~~.getPath()는 문자열로바꾸어주는 메소드이다.
        String fileName = SellBoardDao.class.getResource("/sql/sellboard/sellboard-mapper.xml").getPath();
        
        try {
            prop.loadFromXML(new FileInputStream(fileName));
        } catch (InvalidPropertiesFormatException e) {
            e.printStackTrace();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
               
    }
	
	public int insertMyTransaction(Transaction tr, Connection conn) {
		
		int result = 0;
		PreparedStatement psmt = null;
		String sql = prop.getProperty("insertMyTransaction");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, tr.getSellNo());
			psmt.setInt(2, tr.getUserNo());
			psmt.setInt(3, tr.getReviewNo());
			
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(psmt);
		}
		return result;
	}

}
