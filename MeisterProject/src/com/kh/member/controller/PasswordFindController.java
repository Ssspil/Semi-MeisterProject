package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.vo.Member;
import com.kh.member.model.service.MemberService;

/**
 * Servlet implementation class PasswordFindController
 */
@WebServlet("/pwdFind.me")
public class PasswordFindController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PasswordFindController() {
        super();
        // TODO Auto-generated constructor stub
    }

    private MemberService ms = new MemberService();
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId");
		String email = request.getParameter("email");
		
		Member pwUser = ms.pwdFind(userId);
		
		
//		HttpSession session = request.getSession();
//		
//		if( session.getAttribute("pwUser") == null) { //아이디를 잘못 입력했을 경우
//			session.setAttribute("alertMsg", "올바른 아이디를 입력해주세요. ");
//		}else {
//			session.setAttribute("alertMsg", "임시 비밀번호 전송 완료! 메일함을 확인해주세요.");
//			session.setAttribute("pwUser", pwUser);
//			
//			System.out.println("비밀번호 찾기 성공");
//		}
//		response.sendRedirect(request.getContextPath()+"/pwdfindform.me");
		
		
		
		System.out.println(pwUser);
		System.out.println(email);
			
		response.sendRedirect(request.getContextPath());

		}

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
