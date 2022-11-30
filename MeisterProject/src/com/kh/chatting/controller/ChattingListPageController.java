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
		ArrayList<Chatting> list = new ArrayList<Chatting>();
		
		ArrayList<Integer> receiverList = new ChattingService().selectAllReceiver();
		ArrayList<Integer> senderList = new ChattingService().selectAllSender();
		ArrayList<Integer> sellList = new ChattingService().selectAllSellNo();
		ArrayList<String> sellTitleList = new ArrayList<String>();
		
		for(int i = 0; i < senderList.size(); i++) {
			list.add(new ChattingService().selectChatList(receiverList.get(i), senderList.get(i), sellList.get(i)));			
		}
		
		System.out.println(list);
		System.out.println(list.size());
		for (int i = 0; i < list.size()-1; i++) {
            for (int j = 0; j < list.size()-1; j++) {
                if (i == j) {
                } else if (list.get(j).getChatContent().equals(list.get(i).getChatContent())) {
                    list.remove(j);
                }
            }
        }
		System.out.println(list);
		System.out.println(list.size());
		for (int i = 0; i < list.size(); i++) {
            for (int j = 0; j < list.size(); j++) {
                if (i == j) {
                } else if (list.get(j).getChatContent().equals(list.get(i).getChatContent())) {
                    list.remove(j);
                }
            }
        }
		
		for(int i = 0; i < list.size(); i++) {
			sellTitleList.add(new ChattingService().selectAllSellTitle(list.get(i).getSellNo()));
		}
		
		String[] nickNameList = null;
		String receiverName = "";

		nickNameList = new String[list.size()];
		for(int i=0; i < list.size(); i++) {
			receiverName = new MemberService().selectNickName(list.get(i).getReceiver());
			if(nickName.equals(receiverName)) {
				receiverName = new MemberService().selectNickName(list.get(i).getSender());
				nickNameList[i] = receiverName;
			}
			else {
				nickNameList[i] = receiverName;
			}
		}
		System.out.println(sellTitleList);
		System.out.println(list);
		request.setAttribute("userNo", userNo);
		request.setAttribute("list", list);
		request.setAttribute("nickNameList", nickNameList);
		request.setAttribute("sellTitle", sellTitleList);
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
