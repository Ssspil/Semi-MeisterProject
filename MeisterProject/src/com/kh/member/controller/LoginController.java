package com.kh.member.controller;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class LoginFormController
 */
@WebServlet("/login.me")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
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
		String userPwd = request.getParameter("userPwd");
		
		Member loginUser = ms.loginMember(userId, userPwd);
		
		if(loginUser == null) { // 로그인 실패 => 에러페이지 응답
			request.setAttribute("errorMsg", "로그인에 실패했습니다.");
			
			// 응답페이지 jsp에 위임시 필요한 객체 (RequestDispatcher)
			RequestDispatcher view = request.getRequestDispatcher("/views/common/errorPage.jsp");
			
			// 포워딩 방식 : 해당 경로로 선택된 뷰가 보여질뿐 url은 변하지 않음
			view.forward(request, response);
			
		}else { // 로그인 성공 => index 페이지 응답
			
			// 로그인한 회원의 정보를 로그아웃 하기전까지 계속 가져다 쓸것이기 때문에 session에 담기
			
			// Servlet에서 JSP 내장객체 중 Session에 접근하고자 한다면 우선 session 객체를 얻어와야함
			HttpSession session=request.getSession();
			session.setAttribute("loginUser", loginUser);
			
			session.setAttribute("alertMsg", "성공적으로 로그인이 되었습니다.");

			
			response.sendRedirect(request.getContextPath());
			
			System.out.println("로그인이 되었습니다.");
			
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
