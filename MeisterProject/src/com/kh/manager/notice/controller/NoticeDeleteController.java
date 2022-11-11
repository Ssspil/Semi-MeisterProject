package com.kh.manager.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.manager.notice.model.service.NoticeService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class NoticeDeleteController
 */
@WebServlet("/delete.ad")
public class NoticeDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDeleteController() {
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
		
		
		int boardNo = Integer.parseInt(request.getParameter("nno"));
		
		int result = new NoticeService().deleteNoticeBoard(boardNo);
				
	
		if(result > 0) {//성공
			request.getSession().setAttribute("alertMsg", "성공적으로 게시글을 삭제했습니다.");
			response.sendRedirect(request.getContextPath()+"/notice.ad"); //공지사항 게시판의 목록을 요청하는 url
			
			System.out.println("게시글 삭제 성공");
			
		}else { //실패
			request.setAttribute("errerMsg", "게시글 삭제 실패 !");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
