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
		
		//페이징처리 시작
		int listCount; //현재 총게시글 갯수
		int currentPage; //현재 페이지
		int pageLimit; //페이지 하단에 보여질 페이징바의 페이지 최대갯수
		int boardLimit; //페이지에 보여질 게시글의 최대갯수
		int maxPage; //가장 마지막 페이지가 몇번째 페이지인지(총 페이지 수)
		int startPage; //페이지 하단에 보여질 페이징바의 갯수
		int endPage;//페이지 하단에 보여질 페이징바의 끝수
		
		
		listCount = new BoardService().selectListCount(1);
		
		currentPage = Integer.parseInt(request.getParameter("currentPage") == null ? "1" : request.getParameter("currentPage"));
	
		pageLimit = 10;
		
		boardLimit = 5;
	
		maxPage = 11;

		maxPage = (int)Math.ceil((double)listCount/ boardLimit);
		
		startPage = (currentPage -1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		listCount = new BoardService().selectListCount(2);
		
		currentPage = Integer.parseInt(request.getParameter("currentPage") == null ? "1" : request.getParameter("currentPage"));
	
		pageLimit = 10;
		
		boardLimit = 5;
	
		maxPage = 11;

		maxPage = (int)Math.ceil((double)listCount/ boardLimit);
		
		startPage = (currentPage -1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi2 = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Board> list = new BoardService().selectList(1);//new BoardService().selectList("1");
		request.setAttribute("list",list);
		request.setAttribute("pi", pi);
		
		ArrayList<Board> list2 = new BoardService().selectList(2); //ArrayList<Board> list2 = new BoardService().selectList(2);
		request.setAttribute("list2",list2);
		request.setAttribute("pi2", pi2);
		
		
		
		
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
