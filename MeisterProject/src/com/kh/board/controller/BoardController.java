package com.kh.board.controller;

import java.io.IOException;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.BoardService;
import com.kh.common.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.common.model.vo.PageInfo;

/**
 * Servlet implementation class BoardController
 */
@WebServlet("/boardlist.bo")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardController() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		//페이징처리 시작
		int listCount; 
		int currentPage; 
		int pageLimit; 
		int boardLimit; 
		int maxPage; 
		int startPage;
		int endPage;
		
		String keyword1 = request.getParameter("searchKeyword") == null ? "" : request.getParameter("searchKeyword");
		String keyword2 = request.getParameter("searchKeyword") == null ? "" : request.getParameter("searchKeyword");
		String type =  request.getParameter("searchType") ==  null ? "" : request.getParameter("searchType");
		
		if("1".equals(type)) keyword2 ="";
		else if("2".equals(type)) keyword1 ="";
		else {
			keyword1 = "";
			keyword2 = "";
		}
		
		System.out.println(request.getParameter("searchKeyword"));
		
		listCount = new BoardService().selectListCount(1, keyword1);
		
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
		
		listCount = new BoardService().selectListCount(2, keyword2);
		
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
		
		PageInfo pi2 = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Board> list = new BoardService().selectList(1, keyword1);//new BoardService().selectList("1");
		request.setAttribute("list",list);
		request.setAttribute("pi", pi);
		ArrayList<Board> list2 = new BoardService().selectList(2, keyword2); //ArrayList<Board> list2 = new BoardService().selectList(2);
		request.setAttribute("list2",list2);
		
		request.setAttribute("pi2", pi2);
		
		if(!"".equals(type)) {
			request.setAttribute("searchType",type);
		}
		
		
		ArrayList<Board> hotList = new BoardService().getHotBoard();
		request.setAttribute("hotList",hotList);
		request.getRequestDispatcher("views/board/boardMainPage.jsp").forward(request, response);
		
	
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
