package com.kh.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.common.model.vo.Attachment;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;
import com.kh.sellboard.model.vo.SellBoard;

/**
 * Servlet implementation class MySellListController
 */
@WebServlet("/sellList.se")
public class MySellListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MySellListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		int userNo = loginUser.getUserNo();
		
		ArrayList<SellBoard> s = new MemberService().getMySellBoard(userNo);
		ArrayList<Attachment> at = new ArrayList<Attachment>();		
		
		for(int i = 0; i < s.size(); i++) {
			at.add(new MemberService().selectAttachment(s.get(i).getSellNo(), 2));
		}
		
			
		request.setAttribute("s", s);
		request.setAttribute("at", at);
		
		System.out.println(s);
		System.out.println(at);
		
		request.getRequestDispatcher("views/mypagein/myPageInSellList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
