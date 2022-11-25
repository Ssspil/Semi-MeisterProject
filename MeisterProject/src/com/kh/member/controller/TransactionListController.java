package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.common.model.vo.PageInfo;
import com.kh.member.model.service.MemberService;

/**
 * Servlet implementation class TransactionListController
 */
@WebServlet("/myTransaction.me")
public class TransactionListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TransactionListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		//페이징 처리
		//페이징 처리~
				int listCount; 
				int currentPage; 
				int pageLimit; 
				int boardLimit; 
				int maxPage; 
				int startPage;
				int endPage;
				
				listCount = new MemberService().selectListCount(1);
				
				currentPage = Integer.parseInt(request.getParameter("currentPage") == null ? "1" : request.getParameter("currentPage"));
			
				pageLimit = 10;
				
				boardLimit = 6;
			
				maxPage = 11;

				maxPage = (int)Math.ceil((double)listCount/ boardLimit);
				
				startPage = (currentPage -1) / pageLimit * pageLimit + 1;
				
				endPage = startPage + pageLimit - 1;
				
				if(endPage > maxPage) {
					endPage = maxPage;
				}
				
				PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
				request.setAttribute("pi", pi);
				
		
		
		
		
		
		
		
		if(session.getAttribute("loginUser") == null) { // 로그인 안한 상태
			session.setAttribute("alertMsg", "로그인 후 이용가능한 서비스 입니다.");
			response.sendRedirect(request.getContextPath());
		} else { // 로그인 한 상태
			request.getRequestDispatcher("views/member/myTransactionPage.jsp").forward(request, response);
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
