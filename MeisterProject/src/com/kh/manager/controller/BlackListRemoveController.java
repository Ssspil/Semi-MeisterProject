package com.kh.manager.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class BlackListRemoveController
 */
@WebServlet("/blackremove.ad")
public class BlackListRemoveController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlackListRemoveController() {
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
		
		// input 벨뷰로 해서값을 가져오고 키값은 name이라고 보면 된다.
		String[] userArr = request.getParameterValues("user");
		
		ArrayList<Member> blacklist = new ArrayList<>();
		
		for(String s : userArr) {
			int userNo  = Integer.parseInt(s);
			
			Member delMem = new MemberService().deleteblacklist(userNo);
			
			blacklist.add(delMem);
		}
		
		if(blacklist == null) {
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		} else {
			System.out.printf("관리자가 블랙회원을 삭제하였습니다. \n");
			
			response.sendRedirect(request.getContextPath()+"/blacklist.ad");
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
