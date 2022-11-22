package com.kh.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.Reply;
import com.kh.common.model.vo.PageInfo;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MycommunityController
 */
@WebServlet("/Mycommunity.bo")
public class MycommunityController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MycommunityController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int listCount; 
		int currentPage; 
		int pageLimit; 
		int boardLimit; 
		int maxPage; 
		int startPage;
		int endPage;
		
		listCount = new BoardService().selectListCount2(1);
		
		currentPage = Integer.parseInt(request.getParameter("currentPage") == null ? "1" : request.getParameter("currentPage"));
	
		pageLimit = 10;
		
		boardLimit = 6;
	
		maxPage = 11;

		maxPage = (int)Math.ceil((double)listCount/ boardLimit);
		
		startPage = (currentPage -1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		
		ArrayList<Board> list = new BoardService().myCommunity(userNo);
		request.setAttribute("list",list);
		request.setAttribute("pi", pi);
		
		
		
		ArrayList<Reply> list2 = new BoardService().myReply(userNo);
		request.setAttribute("list2",list2);
		
	
		
	
		
		
		
		
		
		
		request.getRequestDispatcher("views/mypagein/myPageInMycommunity.jsp").forward(request, response);

		
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
