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
		
		
		// console에 이동글 출력
		System.out.println("마켓으로 이동");
		
	    // 판매게시판 전체 리스트 조회 한 후 조회결과를 담아서 응답페이지로 포워딩.
//	    ArrayList<SellBoard> list = new SellBoardService().selectSellBoardList();
	    ArrayList<Interest> interest = new SellBoardService().selecInterestCategory();
	    ArrayList<Local> local = new SellBoardService().selecLocalCategory();
	    
	    
	    
//	    request.setAttribute("list", list);
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
