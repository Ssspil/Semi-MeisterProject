package com.kh.report.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class ReportFormController
 */
@WebServlet("/report.me")
public class ReportFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    // 로그인이 된 상태가 아니면 실행 안되게 하는 것.
	    if( request.getSession().getAttribute("loginUser") == null) {
	    	HttpSession session = request.getSession();
	    	session.setAttribute("errorMsg", "회원가입 후 이용하실 수 있습니다.");
	        request.getRequestDispatcher("views/member/loginForm.jsp").forward(request, response);
	        
	        return;
	    }
	    
	    System.out.println("신고하러 가기");
		
		request.getRequestDispatcher("views/report/reportForm.jsp").forward(request, response);;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
