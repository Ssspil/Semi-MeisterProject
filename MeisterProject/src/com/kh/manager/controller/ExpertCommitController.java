package com.kh.manager.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class ExpertCommitController
 */
@WebServlet("/exCommit.do")
public class ExpertCommitController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExpertCommitController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		int subNo = Integer.parseInt(request.getParameter("subNo"));
		
		System.out.println("유저번호 : " + userNo);
		System.out.println("신청번호 : " + subNo);
		
		Member ExMem = new MemberService().exportData(subNo);
		System.out.println("SUBMIT 에서 가져왔음 " + ExMem);
		
		int result = new MemberService().expertCommit(ExMem);
		
		if(result > 0) {
			response.setContentType("application/json; charset=UTF-8");
			
			// GSON : Google JSON
			Gson gson = new Gson();
			gson.toJson("성공적으로 마이스터 처리가 되었습니다.", response.getWriter());
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
