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
 * Servlet implementation class MemberInsertController
 */
@WebServlet("/insert.me")
public class MemberInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		// 2) 요청시 전달값을 뽑아서 변수 및 객체에 기록하기.
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String nickName = request.getParameter("nickName");
		String interestsArr = request.getParameter("interest");
		
		
		String interest = interestsArr != null ? String.join(", ", interestsArr) : "";
		
		Member m = new Member(userId, userPwd, nickName, interest);
		
		int result = new MemberService().insertMember(m);
		
		if(result > 0) { // 성공.
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "회원가입에 성공했습니다.");
			
			response.sendRedirect(request.getContextPath());
		} else { // 실패 => 에러페이지
			request.setAttribute("errorMsg", "회원가입에 실패했습니다.");
			
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
