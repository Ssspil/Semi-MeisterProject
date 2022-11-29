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
public ArrayList<SellBoard> selectSellBoardList(Connection conn, PageInfo pi , int local_no, int interest_no ){
    	
    	ArrayList<SellBoard> list = new ArrayList<>();
    	
    	PreparedStatement psmt = null;
    	ResultSet rset = null;
    	String sql = prop.getProperty("selectSellBoardList");
    	if(local_no == 0) {
    		sql = sql.replace("$1", "");
    	}else {
    		sql = sql.replace("$1", "AND LOCAL_NO = ?");
    	}
    	if(interest_no == 0) {
    		sql = sql.replace("$2", "");
    	}else {
    		sql = sql.replace("$2", "AND INTEREST_NO = ?");
    	}
    	
    	try {
			psmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() +1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			int i =1;
			
			if(local_no != 0 && interest_no != 0) {
				psmt.setInt(i++, local_no);
				psmt.setInt(i++, interest_no);	
			}else if(local_no != 0){
				psmt.setInt(i++, local_no);
			}else if(interest_no != 0){
				psmt.setInt(i++, interest_no);
			}
			
			psmt.setInt(i++, startRow);
			psmt.setInt(i++, endRow);
			
			rset = psmt.executeQuery();
			
			while(rset.next()) {
				list.add(new SellBoard(rset.getInt("SELL_NO"),
										rset.getString("SELL_TITLE"),
										rset.getInt("PRICE"),
										rset.getInt("SELL_RECOMMEND"),
										rset.getDate("SELL_DATE"),
										rset.getInt("INTEREST_NO"),
										rset.getInt("LOCAL_NO"),
										rset.getString("NICKNAME"),
										rset.getString("TITLEIMG"),
										rset.getString("LOCAL_NAME"),
										rset.getString("INTEREST_NAME")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(psmt);
		}
    	return list;
    	
    }

	// 판매게시판 검색 리스트와 페이징처리
	public ArrayList<SellBoard> selectSearchSellBoardList(Connection conn, PageInfo pi , String search ){
		
		ArrayList<SellBoard> list = new ArrayList<>();
		
		PreparedStatement psmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSearchSellBoardList");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() +1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			
			psmt.setString(1, "%"+search+"%");
			psmt.setString(2, "%"+search+"%");
			psmt.setInt(3, startRow);
			psmt.setInt(4, endRow);
			
			rset = psmt.executeQuery();
			
			while(rset.next()) {
				list.add(new SellBoard(rset.getInt("SELL_NO"),
										rset.getString("SELL_TITLE"),
										rset.getInt("PRICE"),
										rset.getInt("SELL_RECOMMEND"),
										rset.getDate("SELL_DATE"),
										rset.getInt("INTEREST_NO"),
										rset.getInt("LOCAL_NO"),
										rset.getString("NICKNAME"),
										rset.getString("TITLEIMG"),
										rset.getString("LOCALNAME"),
										rset.getString("INTERESTNAME")));	
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
                s.setUserNO(rset.getInt("USER_NO"));
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

	// 메인페이지에 띄울 메소드
	public ArrayList<SellBoard> selectAllList(Connection conn) {
		
		ArrayList<SellBoard> sellList = new ArrayList<>();
		
		PreparedStatement psmt = null;
		ResultSet rset = null;
		
		SellBoard sb = null;
		
		String sql = prop.getProperty("selectAllList");
		
		try {
			psmt = conn.prepareStatement(sql);
			
            rset = psmt.executeQuery();
            
            while(rset.next()) {
                sb = new SellBoard(
                		rset.getInt("SELL_NO"),
                        rset.getString("SELL_TITLE"),
                        rset.getString("SELL_CONTENT"),
                        rset.getInt("PRICE"),
                        rset.getString("TITLEIMG"),
                        rset.getInt("INTEREST_NO"),
                        rset.getString("NICKNAME")
                        ); 
                
                sellList.add(sb);
            }
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return sellList;
	}
	
	public int updateSellBoard(Connection conn, SellBoard s) {
		
		int result = 0;
		PreparedStatement psmt = null;
		String sql = prop.getProperty("updateSellBoard");
		
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
	
	public int updateAttachment(Attachment at, Connection conn) {
		
		int result = 0;
		PreparedStatement psmt = null;
		String sql = prop.getProperty("updateAttachment");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, at.getOriginName());
			psmt.setString(2, at.getChangeName());
			psmt.setString(3, at.getFilePath());
			psmt.setInt(4, at.getFileNo());
			
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(psmt);
		}
		return result;
		
		
	}
	
	public int deleteSellBoard(int sellNo, Connection conn) {
		
		int result = 0;
		
		PreparedStatement psmt = null;
		String sql = prop.getProperty("deleteSellBoard");
		
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
	
	public void deleteAttachment(int sellNo, Connection conn) {
		
		PreparedStatement psmt = null;
		String sql = prop.getProperty("deleteAttachment");
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, sellNo);
			
			psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(psmt);
		}
	}
	
	// 좋아요 조회
	public int selectRecommend(Connection conn, int sellNo, int userNo) {

		int result = 0;
	
		PreparedStatement psmt = null;
	
		ResultSet rset = null;
	
		String sql = prop.getProperty("selectRecommend");
	
		try {
			psmt = conn.prepareStatement(sql);
	
			psmt.setInt(1, sellNo);
			psmt.setInt(2, userNo);
	
			rset = psmt.executeQuery();
	
			if (rset.next()) {
				result = rset.getInt("CNT");
			}
	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(psmt);
		}
	
		return result;
	}
	
	// 좋아요 등록
	public int insertRecommend(Connection conn, int sellNo, int userNo) {
		
		int result = 0;
	
		PreparedStatement psmt = null;
	
		String sql = prop.getProperty("insertRecommend");
	
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, sellNo);
			psmt.setInt(2, userNo);
	
			result = psmt.executeUpdate();
	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(psmt);
		}
		return result;
	}
	
	// 좋아요 삭제
	public int deleteRecommend(Connection conn, int sellNo, int userNo) {
		
		int result = 0;
	
		PreparedStatement psmt = null;
	
		String sql = prop.getProperty("deleteRecommend");
		System.out.println(sql);
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, sellNo);
			psmt.setInt(2, userNo);
	
			result = psmt.executeUpdate();
	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(psmt);
		}
		return result;
	}
	
	// 좋아요 갯수
	public int countRecommend(Connection conn, int sellNo) {

		int result = 0;
		PreparedStatement psmt = null;
		ResultSet rset = null;
	
		String sql = prop.getProperty("countRecommend");
	
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, sellNo);
			
			rset = psmt.executeQuery();
	
			if (rset.next()) {
				result = rset.getInt("CNT");
			}
	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(psmt);
		}
		return result;
	}
	
	// 관리자 페이지 판매게시판
	public ArrayList<SellBoard> selectAllSellBoard(Connection conn){
		
		ArrayList<SellBoard> getAllSellBoard = new ArrayList<>();
		PreparedStatement psmt =  null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAllSellBoard");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			rset = psmt.executeQuery();
			
			while(rset.next()) {
				getAllSellBoard.add(new SellBoard(rset.getInt("SELL_NO"),
												  rset.getString("SELL_TITLE"),
												  rset.getString("SELL_CONTENT"),
												  rset.getInt("PRICE"),
												  rset.getInt("SELL_COUNT"),
												  rset.getInt("SELL_RECOMMEND"),
												  rset.getDate("SELL_DATE"),
												  rset.getString("SELL_REGULATION"),
												  rset.getString("STATUS"),
												  rset.getString("INTEREST_NAME"),
												  rset.getString("LOCAL_NAME"),
												  rset.getString("NICKNAME"),
												  rset.getString("USER_ID")
						));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(psmt);	
	}
		return getAllSellBoard;
	
	

	}

	/* 관리자 페이지 판매게시판 첨부파일*/
	public ArrayList<Attachment> selectAllAttachment(Connection conn) {
		
		ArrayList<Attachment> getAllAttachment = new ArrayList<>();
		
		PreparedStatement psmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAllAttachment");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			rset = psmt.executeQuery();
			
			Attachment at = null;
			
			while(rset.next()) {
                at = new Attachment();
                
                at.setFileNo(rset.getInt("FILE_NO"));
                at.setRefNo(rset.getInt("REF_NO"));
                at.setOriginName(rset.getString("ORIGIN_NAME"));
                at.setChangeName(rset.getString("CHANGE_NAME")); 
                at.setFilePath(rset.getString("FILE_PATH"));

                getAllAttachment.add(at);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(psmt);
		}
		
		return getAllAttachment;
	}

	// 관리자가 판매게시글 삭제하는 메소드
	public int deleteSellboard(Connection conn ,int sellNo) {
		
		int result = 0;
		
		PreparedStatement psmt = null;
		
		String sql = prop.getProperty("deleteSellboard");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, sellNo);
			
			result = psmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(psmt);
		}

		return result;
	}
	
	

}
