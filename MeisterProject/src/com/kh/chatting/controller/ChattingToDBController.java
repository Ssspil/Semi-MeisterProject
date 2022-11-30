package com.kh.chatting.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.chatting.model.service.ChattingService;

/**
 * Servlet implementation class ChattingToDBController
 */
@WebServlet("/chatting.me")
public class ChattingToDBController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChattingToDBController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String chatData = request.getParameter("chatData");
		HttpSession session = request.getSession();
		int result = new ChattingService().insertChatting(chatData);
		int receiver = Integer.parseInt(request.getParameter("receiver"));
		int sellNo = Integer.parseInt(request.getParameter("sellNo"));
		
		if(result == 0) {
			request.setAttribute("errorMsg", "채팅 입력 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		} else {
			session.setAttribute("receiver", receiver);
			session.setAttribute("sellNo", sellNo);
			response.sendRedirect(request.getContextPath()+"/askToSeller.ch");
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
