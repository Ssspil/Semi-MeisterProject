package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MemberUpdateController
 */
@WebServlet("/update.me")
public class MemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId");
		String nickName = request.getParameter("nickName");
		String interest = request.getParameter("interests");
		String userName = request.getParameter("userName");
		String phone = null;
		String email = null;
		String emailBack = request.getParameter("emailBack");;
		
		if(request.getParameter("phoneMid") != null || request.getParameter("phoneLast") != null) {			
			phone = ("010".concat(request.getParameter("phoneMid"))).concat(request.getParameter("phoneLast"));
		}
		
		if(request.getParameter("emailFront") != null || (request.getParameter("emailBack") != null)){
			if(emailBack.equals("other")) {
				emailBack = request.getParameter("emailBackOther");
			}
			System.out.println(emailBack);
			email = ((request.getParameter("emailFront")).concat("@")).concat(emailBack);
		}
		
		Member m  = new Member(userId, nickName, interest, userName, email, phone);
		
		Member updateMem = new MemberService().updateMember(m);
		
		if(updateMem == null) {
			request.setAttribute("errorMsg", "회원정보 수정에 실패했습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", updateMem);
			session.setAttribute("alertMsg", "회원정보를 수정 성공");

			response.sendRedirect(request.getContextPath()+"/mypage.me");
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
