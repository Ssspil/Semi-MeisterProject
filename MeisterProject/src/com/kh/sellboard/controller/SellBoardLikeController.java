package com.kh.sellboard.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.kh.member.model.vo.Member;
import com.kh.sellboard.model.service.SellBoardService;

/**
 * Servlet implementation class SellBoardLikeController
 */
@WebServlet("/sellBoardLike.se")
public class SellBoardLikeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SellBoardLikeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = null; // 문자를 출력하는 타입에 변수 out 선언 null값으로
		int result = 0; // int타입 result 변수 선언 0
		int recommend = 0; // int타입 recommend 변수 선언 0
		
		int sellNo = Integer.parseInt(request.getParameter("sellNo")); // sellNo 데이터를 받아와 int 타입 sellNo에 변수 선언 // getParameter로 가져온 String sellNo값을 인티져로 변환한뒤 int타입 sellNo변수선언
		int userNo = ((Member) request.getSession().getAttribute("loginUser")).getUserNo();
		String type = request.getParameter("type");
		out = response.getWriter();
		
		if (type.equals("I")) {
			int count = SellBoardService.selectRecommend(sellNo, userNo);
			
			if (count == 0) {
				result = SellBoardService.insertRecommend(sellNo, userNo);
			} else {
				result = 2;
			}
		} else if (type.equals("D")) {
			int count = SellBoardService.selectRecommend(sellNo, userNo);
			if (count == 0) {
				result = -2;
			} else {
				result = SellBoardService.deleteRecommend(sellNo, userNo);
			}
		}
		recommend = SellBoardService.countRecommend(sellNo);
		
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
