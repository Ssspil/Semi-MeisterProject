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
import com.kh.common.model.vo.Attachment;

/**
 * Servlet implementation class boardListModalController
 */
@WebServlet("/boardModal.ad")
public class boardListModalController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public boardListModalController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		String type = request.getParameter("type") == null ? "" : request.getParameter("type");
		
		
		if("".equals(type)) {
			ArrayList<Board> list = new BoardService().modalList();
			request.setAttribute("list", list);
			System.out.println(list);
			
			ArrayList<Reply> rlist = new BoardService().replyList(boardNo);
			request.setAttribute("rlist", rlist);
			
			request.getRequestDispatcher("views/manager/boardManagerModal.jsp").forward(request, response);
		} else {
			ArrayList<Reply> rlist = new BoardService().replyList(boardNo);
			//request.setAttribute("rlist", rlist);
			
			System.out.println(rlist);
			Gson gson = new Gson();
			response.getWriter().print(gson.toJson(rlist));
		}
			
			
			
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
