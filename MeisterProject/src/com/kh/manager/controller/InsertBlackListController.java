package com.kh.manager.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class InsertBlackListController
 */
@WebServlet("/insertbl.ad")
public class InsertBlackListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertBlackListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
	    // 관리자가 아니면 실행 안되게 하는 것.
	    if( !(request.getSession().getAttribute("loginUser") != null && 
	            ((Member)request.getSession().getAttribute("loginUser")).getUserId().equals("admin@admin.com"))) {
	        request.setAttribute("errorMsg", "관리자 권한이 없습니다.");
	        request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
	        
	        return;
	    }
		
		int userNo = Integer.parseInt(request.getParameter("uno"));
		
		Member blackUser = new MemberService().insertBlackUser(userNo);
		
		if(blackUser == null) {
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		} else {
		
			System.out.printf("관리자가 %s 의 회원을 블랙리스트에 넣었습니다. \n", blackUser.getUserId());
			
			response.sendRedirect(request.getContextPath()+"/users.ad");
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
