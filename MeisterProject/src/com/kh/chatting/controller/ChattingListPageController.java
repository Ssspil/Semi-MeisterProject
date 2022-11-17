package com.kh.chatting.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.chatting.model.service.ChattingService;
import com.kh.chatting.model.vo.Chatting;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class ChattingListPageController
 */
@WebServlet("/chatList.ch")
public class ChattingListPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChattingListPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");

		String nickName = loginUser.getNickName();
		int userNo = loginUser.getUserNo();
		request.setAttribute("nickname", nickName);
		request.setAttribute("sender", userNo);
		
		ArrayList<Chatting> list = new ChattingService().selectNoteList(userNo);
		String[] nickNameList = null;
		String receiverName = "";
		
		for(int i=0; i < list.size()-1; i++) {	
			if(list.get(i).getReceiver() == list.get(i+1).getReceiver()) {
				list.remove(i);
			}
		}	
		System.out.println(list);
		nickNameList = new String[list.size()];
		for(int i=0; i < list.size(); i++) {
			receiverName = new MemberService().selectNickName(list.get(i).getReceiver());
			nickNameList[i] = receiverName;
		}
		
		request.setAttribute("list", list);
		request.setAttribute("nickNameList", nickNameList);
		//RequestDispatcher view = request.getRequestDispatcher("views/chatting/sellerNoteListPage.jsp");

		RequestDispatcher view = request.getRequestDispatcher("views/chatting/chattingListPage.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
