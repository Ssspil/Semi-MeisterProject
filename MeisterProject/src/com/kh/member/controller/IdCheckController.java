package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;

/**
 * Servlet implementation class IdCheckController
 */
@WebServlet("/check.me")
public class IdCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdCheckController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String checkData = request.getParameter("checkData"); 
		String type = request.getParameter("type"); // "nickname", "id"
		 
		
		int count = 0;
		
		// if문 실행 아이디 체크
		if("id".equals(type)) { count = new MemberService().idCheck(checkData); }
		// if문 닉네임 같을때 실행
		else if("nickname".equals(type)){ count = new MemberService().nicknameCheck(checkData);}
		 
		
		
		if (count > 0) { // 중복된 아이디가 존재한다. => 사용불가.
			response.getWriter().print("NNNNN");
		} else { // 존재하는 아이디가 없을경우 => 사용가능.
			response.getWriter().print("NNNNY");
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
