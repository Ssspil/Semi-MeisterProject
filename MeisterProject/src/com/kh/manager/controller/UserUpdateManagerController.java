package com.kh.manager.controller;

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
 * Servlet implementation class UserUpdateManagerController
 */
@WebServlet("/userupdate.ad")
public class UserUpdateManagerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserUpdateManagerController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		request.setCharacterEncoding("UTF-8");
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String nickName = request.getParameter("userNickName");
		String interest = request.getParameter("userInterest");
		String userName = request.getParameter("userName");
		String gender = request.getParameter("userGender");
		String email = request.getParameter("userEmail");
		String phone = request.getParameter("userPhone");
		String speciality = request.getParameter("userSpeciality");
		String expert = request.getParameter("userExpert");
		
		if(interest.equals("영상")) {
			interest = String.valueOf(10);
		} else if (interest.equals("영화")) {
			interest = String.valueOf(20);
		} else if (interest.equals("게임")) {
			interest = String.valueOf(30);
		} else if (interest.equals("IT")) {
			interest = String.valueOf(40);
		} else if (interest.equals("운동")) {
			interest = String.valueOf(50);
		} else if (interest.equals("요리")) {
			interest = String.valueOf(60);
		}
		
		Member m = null;
		Member newMem = null;
		
		if(expert.equals("Y")) {
			m = new Member(userNo, userId, userPwd, nickName, interest, userName, gender, email, phone, speciality, expert);
			
			newMem = new MemberService().userExUpdateByManager(m);
			
		} else {
			m = new Member(userNo, userId, userPwd, nickName, interest, expert);
			
			newMem = new MemberService().userUpdateByManager(m);
		}
		
		if(newMem == null) {
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		} else {
		
			System.out.println("관리자가 회원을 수정했습니다.");
			
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
