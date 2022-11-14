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

import com.kh.common.model.vo.Attachment;
import com.kh.common.model.vo.Interest;
import com.kh.common.model.vo.Local;
import com.kh.sellboard.model.vo.SellBoard;

import static com.kh.common.JDBCTemplate.*;

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
				i.setInterestNo(rset.getInt("INTEREST_NO"));
				i.setInterestName(rset.getString("INTEREST_NAME"));
				interest.add(i);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(psmt);
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
		}finally {
			close(rset);
			close(psmt);
		}
		
		return local;
	}
	
//	public SellBoard selectSellBoard(Connection conn, int boardNo) {
//        
//        // select => ResultSet
//        
//        SellBoard s = null;
//        PreparedStatement psmt = null;
//        ResultSet rset = null;
//        
//        String sql = prop.getProperty("selectSellBoard");
//        
//        try {
//            psmt = conn.prepareStatement(sql);
//            
//            psmt.setInt(1, boardNo);
//            
//            rset = psmt.executeQuery();
//            
//            if(rset.next()) {
//                s = new SellBoard(
//                        rset.getInt("SELL_NO"),
//                        rset.getString("CATEGORY_NAME"),
//                        rset.getString("BOARD_TITLE"),
//                        rset.getString("BOARD_CONTENT"),
//                        rset.getString("USER_ID"),
//                        rset.getDate("CREATE_DATE")
//                        ); 
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }finally {
//            close(rset);
//            close(psmt);
//        }
//        return s;
        
       
        
//    }
	
	public int insertSellBoard(SellBoard s, Connection conn) {
		
		int result = 0;
		PreparedStatement psmt = null;
		
		String sql = prop.getProperty("insertSellBoard");
		
		try {
			psmt = conn.prepareStatement(sql);
			
            psmt.setString(1, s.getSellTitle());
            psmt.setString(2, s.getSellContent());
            psmt.setInt(3, s.getPrice());
            psmt.setInt(4, s.getInterest());
            psmt.setInt(5, s.getLocal());
            psmt.setInt(6, s.getUserNO());
			
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(psmt);
		}
		return result;
	}
	
	public Attachment selectAttachment(Connection conn, int sellNo) {
        
        Attachment at = null;
        PreparedStatement psmt = null;
        ResultSet rset = null;
        
        String sql = prop.getProperty("selectAttachment");
        
        try {
            psmt = conn.prepareStatement(sql);
            
            psmt.setInt(1, sellNo);
            
            rset = psmt.executeQuery();
            
            if(rset.next()) {
                
                at = new Attachment();
                
                at.setFileNo(rset.getInt("FILE_NO"));
                at.setOriginName(rset.getString("ORIGIN_NAME"));
                at.setChangeName(rset.getString("CHANGE_NAME")); 
                at.setFilePath(rset.getString("FILE_PATH"));
                at.setFileLevel(rset.getInt("FILE_LEVEL"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            close(rset);
            close(psmt);
        }
        return at;
    }
	
	public int insertAttachment(Attachment at, Connection conn) {
        
        int result = 0;
        PreparedStatement psmt = null;
        
        String sql = prop.getProperty("insertAttachment");
        
        try {
            psmt = conn.prepareStatement(sql);
            
            psmt.setString(1, at.getOriginName());
            psmt.setString(2, at.getChangeName());
            psmt.setString(3, at.getFilePath());
            
            result = psmt.executeUpdate();
            
        } catch (SQLException e) {

            e.printStackTrace();
        }finally {
            close(psmt);
        }
        return result;
	}
	
public int insertNewAttachment(Attachment at, Connection conn) {
        
        int result = 0;
        PreparedStatement psmt = null;
        
        String sql = prop.getProperty("insertNewAttachment");
        
        try {
            psmt = conn.prepareStatement(sql);
            
            psmt.setInt(1, at.getRefNo());
            psmt.setString(2, at.getOriginName());
            psmt.setString(3, at.getChangeName());
            psmt.setInt(4, at.getFileLevel());
            
            result = psmt.executeUpdate();
            
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            close(psmt);
        }
        return result;
        
        
    }

}
