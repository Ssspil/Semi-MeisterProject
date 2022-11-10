package com.kh.sellboard.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.kh.common.model.vo.Interest;
import com.kh.common.model.vo.Local;
import com.kh.manager.notice.model.dao.NoticeDao;

public class SellBoardDao {

    private Properties prop = new Properties();
    
    public SellBoardDao() {
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

	public ArrayList<Interest> selecInterestCategory(Connection conn) {
		
		ArrayList<Interest> interest = new ArrayList<>();
		
		PreparedStatement psmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selecInterestCategory");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			rset = psmt.executeQuery();
			
			while(rset.next()) {
				Interest i = new Interest();
				i.setInterestNo(rset.getInt(1));
				i.setInterestName(rset.getString("INTEREST_NAME"));
				interest.add(i);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return interest;
	}

	public ArrayList<Local> selecLocalCategory(Connection conn) {
		
		ArrayList<Local> local = new ArrayList<>();
		
		PreparedStatement psmt = null;
		ResultSet rset = null;
		 
		String sql = prop.getProperty("selecLocalCategory");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			rset = psmt.executeQuery();
			
			while(rset.next()) {
				Local l = new Local();
				l.setLocalNo(rset.getInt("LOCAL_NO"));
				l.setLocalName(rset.getString("LOCAL_NAME"));
				local.add(l);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return local;
	}

}
