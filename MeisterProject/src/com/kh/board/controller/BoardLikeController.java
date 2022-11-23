package com.kh.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.kh.board.model.service.BoardService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class BoardLikeController
 */
@WebServlet("/boardLike.bo")
public class BoardLikeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private BoardService boardService = new BoardService();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardLikeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = null;
		int result = 0;
		int recommend = 0; 
		
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		int userNo = ((Member) request.getSession().getAttribute("loginUser")).getUserNo();
		String type = request.getParameter("type");
		out = response.getWriter();
		
		if (type.equals("I")) {
			int count = boardService.selectRecommend(boardNo, userNo);
			System.out.println(count);
			
			if (count == 0) {
				result = boardService.insertRecommend(boardNo, userNo);
			} else {
				result = 2;
			}
		} else if (type.equals("D")) {
			int count = boardService.selectRecommend(boardNo, userNo);
			if (count == 0) {
				result = -2;
			} else {
				result = boardService.deleteRecommend(boardNo, userNo);
			}
		}
		recommend = boardService.countRecommend(boardNo);
		
		response.setContentType("application/json; charset=UTF-8");
		
		JsonObject json = new JsonObject();
		
		json.addProperty("result", result);
		json.addProperty("recommend", recommend);
		Gson gson = new Gson();
		out.print(gson.toJson(json));
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
