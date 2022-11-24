package com.kh.manager.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.dao.BoardDao;
import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Board;
import com.kh.sellboard.model.service.SellBoardService;
import com.kh.sellboard.model.vo.SellBoard;

/**
 * Servlet implementation class MainPageLoadController
 */
@WebServlet("/mainLoad.do")
public class MainPageLoadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainPageLoadController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Board> list = new BoardService().selectAllList();
		ArrayList<SellBoard> sellList = new SellBoardService().selectAllList();
		
		
		System.out.println("index.jsp 와서 바로 main.jsp로 포워딩");
		
		request.setAttribute("list", list);
		request.setAttribute("sellList",sellList);
		
		request.getRequestDispatcher("views/common/main.jsp").forward(request, response);
		
			
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
