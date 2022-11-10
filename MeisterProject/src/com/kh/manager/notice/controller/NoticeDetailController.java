package com.kh.manager.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.manager.notice.model.service.NoticeService;
import com.kh.manager.notice.model.vo.Notice;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class NoticeDetailController
 */
@WebServlet("/detail.ad")
public class NoticeDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("공지사항 상세보기");
		
		// 관리자가 아니면 실행 안되게 하는 것.
	    if( !(request.getSession().getAttribute("loginUser") != null && 
	            ((Member)request.getSession().getAttribute("loginUser")).getUserId().equals("admin@admin.com"))) {
	        request.setAttribute("errorMsg", "관리자 권한이 없습니다.");
	        request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
	        
	        return;
	    }
		
		request.setCharacterEncoding("UTF-8");
		
		// 클릭했을 때 공지사항의 글번호 nno
		int noticeNo = Integer.parseInt(request.getParameter("nno"));
		
	
//		if(result > 0) { //성공했을 경우 => 해당 공지사항 상세조회
			
			Notice n = new NoticeService().selectNotice(noticeNo);
			
			
			request.setAttribute("n", n);
			request.getRequestDispatcher("views/manager/noticeDetailView.jsp").forward(request, response); //포워딩함
			
//		}else { //실패했을 경우 에러페이지
			
//			request.setAttribute("errorMsg", "공지사항 조회 실패");
//			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
	
//		}	

	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
