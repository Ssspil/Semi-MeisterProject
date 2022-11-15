package com.kh.manager.notice.model.dao;

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

import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;
import com.kh.manager.notice.model.vo.Notice;

public class NoticeDao {

    private Properties prop = new Properties();
    
    public NoticeDao() {
        // 1) NoticeDao.class = WEB-INF/classes/com/kh/notice/model/dao.NoticeDao.class를 나타내고
        // 2) NoticeDao.class.getResource = classes를 나타내고
        // 3) ~~.getPath()는 문자열로바꾸어주는 메소드이다.
        String fileName = NoticeDao.class.getResource("/sql/notice/notice-mapper.xml").getPath();
        
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
	
	
	
	public int insertNotice(Notice n, Connection conn) {
		
		 	int result = 0;
	        
	        PreparedStatement psmt = null;
	        
	        String sql = prop.getProperty("insertNotice");
	        
	        try {
	            psmt = conn.prepareStatement(sql);
	            
	            psmt.setString(1, n.getNoticeTitle());
	            psmt.setString(2, n.getNoticeContent());
	            
	            result = psmt.executeUpdate();
	            
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            JDBCTemplate.close(psmt);
	        }
	        
	        return result;
	    }



	public ArrayList<Notice> selectNoticeList(PageInfo pi ,Connection conn) {
        // Select문 => ResultSet객체(여러행)
        ArrayList<Notice> list = new ArrayList<>();
        
        PreparedStatement psmt = null;
        
        ResultSet rset = null;
        
        String sql = prop.getProperty("selectNoticeList");
        
        try {
            psmt = conn.prepareStatement(sql);
            
            int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() +1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			psmt.setInt(1, startRow);
			psmt.setInt(2, endRow);
			
            rset = psmt.executeQuery();
            
            while(rset.next()) {
                list.add(new Notice(rset.getInt("NOTICE_NO"),
                                    rset.getString("NOTICE_TITLE"),
                                    rset.getString("NOTICE_CONTENT"),
                                    rset.getDate("CREATE_DATE")));
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
        	JDBCTemplate.close(rset);
        	JDBCTemplate.close(psmt);
        }
        
        return list;
    }



	public Notice selectNotice(int noticeNo, Connection conn) {
		//select문은 반환형이 ResultSet
		ResultSet rset = null;
		
		Notice n = null;
		
		PreparedStatement psmt = null;
		
		String sql = prop.getProperty("selectNotice");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, noticeNo);
			
			rset = psmt.executeQuery();
			
			if(rset.next()) {
				n = new Notice (rset.getInt("NOTICE_NO"),
								rset.getString("NOTICE_TITLE"),
								rset.getString("NOTICE_CONTENT"));
			}
						
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(psmt);
		}
		return n;
	}



	public int selectNoticeListCount(Connection conn) {
		//select문 -> ResultSet객체
		int listCount = 0;
		
		PreparedStatement psmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectNoticeListCount");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			rset = psmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(psmt);
		}
		return listCount;
	}



	public int deleteNoticeBoard(int noticeNo, Connection conn) {

		int result = 0; //update를 처리할 행의 갯수를 받음
		
		PreparedStatement psmt = null;
		
		String sql = prop.getProperty("deleteNoticeBoard");
		
		try {
			psmt = conn.prepareStatement(sql);
		
			psmt.setInt(1, noticeNo);
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(psmt);
		}
		return result;
	}



	public int updateNoticeBoard(Notice n, Connection conn) {

		int result = 0;
		PreparedStatement psmt = null;
		String sql = prop.getProperty("updateNoticeBoard");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, n.getNoticeTitle());
			psmt.setString(2, n.getNoticeContent());
			psmt.setInt(3, n.getNoticeNo());
			
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(psmt);
		}
		return result;
		
	}



	public ArrayList<Notice> searchNotice(String search, PageInfo pi, Connection conn) {
		
		ArrayList<Notice> list = new ArrayList<>();
		
		//select문은 반환형이 ResultSet
		ResultSet rset = null;
		
		PreparedStatement psmt = null;
		
		String sql = prop.getProperty("searchNotice");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, "%"+ search + "%" );
			
			rset = psmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Notice (rset.getInt("NOTICE_NO"),
									 rset.getString("NOTICE_TITLE"),
									 rset.getDate("CREATE_DATE")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(psmt);
			JDBCTemplate.close(rset);
		}
		
		return list;
	}



	public int searchNoticeCount(String search, Connection conn) {

		int listCount = 0;
		
		PreparedStatement psmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchNoticeCount");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, "%"+ search + "%" );
			
			rset = psmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(psmt);
		}
		return listCount;
	}
		
	


	
	
	
		
	
	
	
	
	

}
