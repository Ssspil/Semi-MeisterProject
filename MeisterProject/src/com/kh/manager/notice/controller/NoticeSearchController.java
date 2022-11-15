package com.kh.manager.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.manager.notice.model.service.NoticeService;
import com.kh.manager.notice.model.vo.Notice;
import com.kh.member.model.vo.Member;
import com.kh.common.model.vo.PageInfo;

/**
 * Servlet implementation class NoticeSearchController
 */
@WebServlet("/search.no")
public class NoticeSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
	
		// 관리자가 아니면 실행 안되게 하는 것.
	    if( !(request.getSession().getAttribute("loginUser") != null && 
	            ((Member)request.getSession().getAttribute("loginUser")).getUserId().equals("admin@admin.com"))) {
	        request.setAttribute("errorMsg", "관리자 권한이 없습니다.");
	        request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
	        
	        return;
	    }
	    
	    request.setCharacterEncoding("UTF-8");
	    
	    String search = request.getParameter("search");
	    
	    //페이지 번호
	    int currentPage = Integer.parseInt(request.getParameter("currentPage") == null ? "1" : request.getParameter("currentPage")); 
		
	    //한 페이지에 나타낼 리스트 변수 선언
	    int boardLimit = 10;
	    
	    //검색 전체  list count
	    int listCount = new NoticeService().searchNoticeCount(search);
	    
	    //page count
	    int pageCount = (int)Math.ceil((double)listCount / boardLimit); //ceil은 올림함수
	    
	  
	    PageInfo pi = new PageInfo(currentPage, boardLimit, boardLimit);
	    
	    //글 목록 전체 가져오기
	    ArrayList<Notice> list = new NoticeService().searchNotice(search, pi);

	    System.out.println("공지사항 검색");

	    request.setAttribute("list", list);
	    request.setAttribute("search", search);
	    request.setAttribute("pi", pi);
	    request.getRequestDispatcher("views/manager/noticeManager.jsp").forward(request, response);
	    

	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
