package com.kh.manager.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.Attachment;
import com.kh.common.model.vo.PageInfo;
import com.kh.member.model.vo.Member;
import com.kh.report.model.service.ReportService;
import com.kh.report.model.vo.Report;

/**
 * Servlet implementation class ReportController
 */
@WebServlet("/report.ad")
public class ReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("신고관리 페이지로 이동");
		
	    // 관리자가 아니면 실행 안되게 하는 것.
	    if( !(request.getSession().getAttribute("loginUser") != null && 
	            ((Member)request.getSession().getAttribute("loginUser")).getUserId().equals("admin@admin.com"))) {
	        request.setAttribute("errorMsg", "관리자 권한이 없습니다.");
	        request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
	        
	        return;
	    }
	    
	 // --------- 페이징처리 시작 -------- 
	    int listCount; //현재 총 게시글 갯수
		int currentPage; //현재 페이지(사용자가 요청한 페이지)
		int pageLimit; //페이지 하단에 보여질 페이징바의 페이지 최대 갯수
		int boardLimit; // 페이지에 보여질 게시글의 최대 갯수
		
		int maxPage; //가장 마지막 페이지가 몇번째 페이지인지 나타냄(총 페이지 수)
		int startPage;// 페이지 하단에 보여질 페이징바의 시작수
		int endPage;
	    
		
		
		listCount = new ReportService().selectReportCount(); 
		
		// * currentPage : 현재페이지
		currentPage = Integer.parseInt(request.getParameter("currentPage") == null ? "1" : request.getParameter("currentPage"));
		
		// * pageLimit : 페이지 하단에 보여질 페이징바의 페이지 최대 갯수(페이지목록들을 몇 개 단위로 출력할건지!)
		pageLimit = 10;
		
		// * boardLimit : 한 페이지에 보여질 게시글의 최대갯수(게시글 몇 개 단위씩)
		boardLimit = 10;
	    
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
	    
		startPage = (currentPage -1 ) /pageLimit * pageLimit + 1;
	    
		endPage  = startPage + pageLimit -1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		// 1. 페이징바 만들 때 필요한 객체
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
	    
	    
	    // --------- 페이징처리 끝 --------  //
		

		// 게시글 전체, 첨부파일 전체 긁어오기
		ArrayList<Report> list = new ReportService().selectAllList(pi);
		ArrayList<Attachment> atArr = new ReportService().selectAllList();
		
		request.setAttribute("list", list);
		request.setAttribute("atArr", atArr);
		request.setAttribute("pi", pi);
		
		request.getRequestDispatcher("views/manager/reportManager.jsp").forward(request, response);
		
		System.out.println("신고관리 페이지로 이동");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
