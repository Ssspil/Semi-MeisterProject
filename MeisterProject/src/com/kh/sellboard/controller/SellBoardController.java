package com.kh.sellboard.controller;

import java.io.IOException;


import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.Interest;
import com.kh.common.model.vo.Local;
import com.kh.common.model.vo.PageInfo;
import com.kh.sellboard.model.service.SellBoardService;
import com.kh.sellboard.model.vo.SellBoard;



/**
 * Servlet implementation class SellBoardController
 */
@WebServlet("/market.se")
public class SellBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SellBoardController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 페이징 처리
		int listCount;
		int currentPage;
		int pageLimit;
		int boardLimit;
		
		int maxPage;
		int startPage;
		int endPage;
		
		listCount = new SellBoardService().selectSellBoardListCount();
		
		currentPage = Integer.parseInt(request.getParameter("currentPage") == null? "1" : request.getParameter("currentPage"));
		pageLimit = 10;
		boardLimit = 6;
		maxPage = (int) Math.ceil((double)(listCount/boardLimit));
		startPage = (currentPage-1) / pageLimit * pageLimit +1;
		endPage = startPage + pageLimit -1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		// 페이징 객체
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		// console에 이동글 출력
		System.out.println("마켓으로 이동");
		
	    // 판매게시판 전체 리스트 조회 한 후 조회결과를 담아서 응답페이지로 포워딩.
	    ArrayList<SellBoard> list = new SellBoardService().selectSellBoardList(pi);
	    ArrayList<Interest> interest = new SellBoardService().selectInterestCategory();
	    ArrayList<Local> local = new SellBoardService().selectLocalCategory();
	    
	    
	    
	    request.setAttribute("list", list);
	    request.setAttribute("interest", interest);
	    request.setAttribute("local", local);
	    request.setAttribute("pi", pi);
		
	    request.getRequestDispatcher("views/sell/sellBoard.jsp").forward(request, response);
		

	    

	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
