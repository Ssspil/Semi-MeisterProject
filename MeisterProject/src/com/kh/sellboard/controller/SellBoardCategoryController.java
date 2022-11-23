package com.kh.sellboard.controller;

import java.io.IOException;
import java.util.ArrayList;

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
 * Servlet implementation class SellBoardCategoryController
 */
@WebServlet("/category.se")
public class SellBoardCategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SellBoardCategoryController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		int interest_no = Integer.parseInt(request.getParameter("interest_no"));
		int local_no = Integer.parseInt(request.getParameter("local_no"));
		
		
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
				
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Interest> interest = new SellBoardService().clickInterestCategory(interest_no);
		ArrayList<Local> local = new SellBoardService().clickLocalCategory(local_no);
		ArrayList<SellBoard> list = new SellBoardService().selectSellBoardList(pi,local_no,  interest_no );
	
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.setAttribute("interest", interest);
	    request.setAttribute("local", local);
	    
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
