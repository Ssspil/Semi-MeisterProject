package com.kh.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

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
		request.setCharacterEncoding("UTF-8");
		
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		
		String type = request.getParameter("type") == null ? "" : request.getParameter("type");
		
		
		
		if("".equals(type)) {
	
			Attachment at = new BoardService().selectAttachment(boardNo);
			request.setAttribute("at", at);
			
			ArrayList<Reply> rlist = new BoardService().replyList(boardNo);
			request.setAttribute("rlist", rlist);
			
			response.setContentType("application/json; charset=UTF-8");
			Gson gson = new Gson();
			response.getWriter().print(gson.toJson(rlist));
			
			//request.getRequestDispatcher("views/manager/boardManagerModal.jsp").forward(request, response);
		} else {

			Attachment at = new BoardService().selectAttachment(boardNo);
			
			ArrayList<Reply> rlist = new BoardService().replyList(boardNo);
			
			response.setContentType("application/json; charset=UTF-8");
			
			HashMap<String, Object> b = new HashMap<>();
			
			Board bs = new BoardService().selectBoard(boardNo);
			
			b.put("at", at);
			b.put("rlist", rlist);
			b.put("bs", bs);
			
			Gson gson = new Gson();
			response.getWriter().print(gson.toJson(b));
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
