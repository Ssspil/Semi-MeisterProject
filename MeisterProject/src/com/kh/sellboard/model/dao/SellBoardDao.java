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
import com.kh.common.model.vo.PageInfo;
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
    
    // 조회수
    public int selectListCount(Connection conn) {
    	int listCount = 0;
    	
    	PreparedStatement psmt = null;
    	ResultSet rset = null;
    	String sql = prop.getProperty("selectListCount");
    	
    	try {
			psmt = conn.prepareStatement(sql);
			
			rset = psmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("SELL_COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(psmt);
		}
    	return listCount;
    }
    
    // 조회수 증가
 	public int increaseCount(Connection conn, int sellNo) {
 		
 		int result = 0;
 		PreparedStatement psmt = null;
 		String sql = prop.getProperty("increaseCount");
 		
 		try {
 			psmt = conn.prepareStatement(sql);
 			
 			psmt.setInt(1, sellNo);
 			
 			result = psmt.executeUpdate();
 		} catch (SQLException e) {
 			e.printStackTrace();
 		}finally {
 			close(psmt);
 		}
 		return result;
 	}
    
    
    // 판매게시판 메인 리스트와 페이징처리
    public ArrayList<SellBoard> selectSellBoardList(Connection conn, PageInfo pi){
    	
    	ArrayList<SellBoard> list = new ArrayList<>();
    	
    	PreparedStatement psmt = null;
    	ResultSet rset = null;
    	String sql = prop.getProperty("selectSellBoardList");
    	
    	try {
			psmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() +1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			psmt.setInt(1, startRow);
			psmt.setInt(2, endRow);
			
			rset = psmt.executeQuery();
			
			while(rset.next()) {
				list.add(new SellBoard(rset.getInt("SELL_NO"),
										rset.getString("SELL_TITLE"),
										rset.getInt("PRICE"),
										rset.getInt("SELL_RECOMMEND"),
										rset.getDate("SELL_DATE"),
										rset.getInt("INTEREST"),
										rset.getInt("LOCAL"),
										rset.getString("NICKNAME"),
										rset.getString("CHANGE_NAME"),
										rset.getString("FILE_PATH")));	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(psmt);
		}
    	return list;
    	
    }
    
    // 카테고리 관심사
	public ArrayList<Interest> selectInterestCategory(Connection conn) {
		
		ArrayList<Interest> interest = new ArrayList<>();
		
		PreparedStatement psmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectInterestCategory");
		
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
	
	// 카테고리 지역
	public ArrayList<Local> selectLocalCategory(Connection conn) {
		
		ArrayList<Local> local = new ArrayList<>();
		
		PreparedStatement psmt = null;
		ResultSet rset = null;
		 
		String sql = prop.getProperty("selectLocalCategory");
		
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
	
	// 판매게시글 선택 조회
	public SellBoard selectSellBoard(Connection conn, int sellNo) {
        
        // select => ResultSet
        
        SellBoard s = null;
        PreparedStatement psmt = null;
        ResultSet rset = null;
        
        String sql = prop.getProperty("selectSellBoard");
        
        try {
            psmt = conn.prepareStatement(sql);
            
            psmt.setInt(1, sellNo);
            
            rset = psmt.executeQuery();
            
            if(rset.next()) {
                s = new SellBoard(
                        rset.getInt("SELL_NO"),
                        rset.getString("SELL_TITLE"),
                        rset.getString("SELL_CONTENT"),
                        rset.getInt("PRICE"),
                        rset.getInt("SELL_RECOMMEND"),
                        rset.getDate("SELL_DATE"),
                        rset.getString("INTEREST_NAME"),
                        rset.getInt("LOCAL_NO"),
                        rset.getString("NICKNAME"),
                        rset.getString("SELL_DETAIL"),
                        rset.getString("SELL_REGULATION")
                        ); 
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            close(rset);
            close(psmt);
        }
        return s;
        
     }
	
	
	// 판매게시글 등록
	public int insertSellBoard(SellBoard s, Connection conn) {
		
		int result = 0;
		PreparedStatement psmt = null;
		
		String sql = prop.getProperty("insertSellBoard");
		
		try {
			psmt = conn.prepareStatement(sql);
			
            psmt.setString(1, s.getSellTitle());
            psmt.setString(2, s.getSellContent());
            psmt.setInt(3, s.getPrice());
            psmt.setInt(4, s.getInterestNo());
            psmt.setInt(5, s.getLocalNo());
            psmt.setInt(6, s.getUserNO());
            psmt.setString(7, s.getSellDetail());
            psmt.setString(8, s.getSellRegulation());
			
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(psmt);
		}
		return result;
	}
	
	// 파일 첨부
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


	public ArrayList<Interest> clickInterestCategory(Connection conn, int interest_no) {

		ArrayList<Interest> interest = new ArrayList<>();
		
		PreparedStatement psmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("clickInterestCategory");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, interest_no);
			
			rset = psmt.executeQuery();
			
			while(rset.next()) {
				interest.add(new Interest(rset.getInt("INTEREST_NO"),
								  		  rset.getString("INTEREST_NAME")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(psmt);
		}
		
		return interest;
	}

	public ArrayList<Local> clickLocalCategory(Connection conn, int local_no) {
		
		ArrayList<Local> local = new ArrayList<>();
		
		PreparedStatement psmt = null;
		ResultSet rset = null;
		 
		String sql = prop.getProperty("clickLocalCategory");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, local_no);
			
			rset = psmt.executeQuery();
			
			while(rset.next()) {
				local.add(new Local(rset.getInt("LOCAL_NO"),
								    rset.getString("LOCAL_NAME")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(psmt);
		}
		
		return local;
	}
	
	

}
