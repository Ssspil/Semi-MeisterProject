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
import com.kh.common.model.vo.Attachment;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class AskToSellerPageController
 */
@WebServlet("/askToSeller.ch")
public class AskToSellerPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AskToSellerPageController() {
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
		
		request.setAttribute("userNo", userNo);
		request.setAttribute("nickname", nickName);
		
		int sender = 0;
		if(request.getParameter("sender") == null) {
			sender = userNo;
		}
		else {
			sender = Integer.parseInt(request.getParameter("sender"));
		}

		int sellNo = 0;
		int receiver = 0;
		
		if(request.getParameter("receiver") == null){
			receiver = (Integer) (session.getAttribute("receiver"));
		}
		else {
			receiver = Integer.parseInt(request.getParameter("receiver"));
		}
		if(request.getParameter("sellNo") == null){
			sellNo = (Integer) (session.getAttribute("sellNo"));
		}
		else {
			sellNo = Integer.parseInt(request.getParameter("sellNo"));
		}
		System.out.println("sender : "+sender);
		System.out.println("receiver : "+receiver);
		
		ArrayList<Chatting> list = new ChattingService().selectChatDetail(receiver, sender, sellNo);
		ArrayList<String> dateList = new ChattingService().selectChatDate(receiver, sender, sellNo);
		
		String[] nickNameList = new String[0];
		String senderName = "";
		if(!list.isEmpty()) {
			nickNameList = new String[list.size()];
			for(int i=0; i < list.size(); i++) {
				senderName = new MemberService().selectNickName(list.get(i).getSender());
				nickNameList[i] = senderName;
			}					
		}
		if(userNo == receiver) {
			senderName = new MemberService().selectNickName(sender);
		}
		else {
			senderName = new MemberService().selectNickName(receiver);
		}
		request.setAttribute("oppNick", senderName);
	
		
		Attachment profileOpp = new ChattingService().getProfile(receiver);

		request.setAttribute("list", list);
		request.setAttribute("nickNameList", nickNameList);
		request.setAttribute("profileOpp", profileOpp);
		request.setAttribute("dateList", dateList);
		request.setAttribute("sellNo", sellNo);
		request.setAttribute("userNo", userNo);
		request.setAttribute("receiver", receiver);
		request.setAttribute("sender", sender);
		//RequestDispatcher view = request.getRequestDispatcher("views/chatting/sellerNoteListPage.jsp");

		RequestDispatcher view = request.getRequestDispatcher("views/chatting/chattingPage.jsp");
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
