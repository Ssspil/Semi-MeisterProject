package com.kh.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.board.model.service.BoardService;
import com.kh.common.model.vo.Attachment;
import com.kh.common.model.vo.PageInfo;
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
		//페이징 처리~
		int listCount; 
		int currentPage; 
		int pageLimit; 
		int boardLimit; 
		int maxPage; 
		int startPage;
		int endPage;
		
		listCount = new MemberService().selectListCount();
		
		currentPage = Integer.parseInt(request.getParameter("currentPage") == null ? "1" : request.getParameter("currentPage"));
	
		pageLimit = 10;
		
		boardLimit = 15;

		maxPage = (int)Math.ceil((double)listCount/ boardLimit);
		
		startPage = (currentPage -1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		System.out.println("pageInfo:"+pi.toString());
		
		
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		int userNo = loginUser.getUserNo();
		
		ArrayList<SellBoard> s = new MemberService().getMySellBoard(userNo, (currentPage-1)*boardLimit+1, (currentPage-1)*boardLimit+boardLimit);
		ArrayList<Attachment> at = new ArrayList<Attachment>();		
		
		for(int i = 0; i < s.size(); i++) {
			Attachment atTest = new MemberService().selectAttachment(s.get(i).getSellNo(), 2);
			System.out.println(atTest);
			if(atTest != null) {
				at.add(atTest);				
			}
			else {
				at.add(new Attachment());
			}
		}
		
			
		request.setAttribute("s", s);
		request.setAttribute("at", at);
		request.setAttribute("pi", pi);
		
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
