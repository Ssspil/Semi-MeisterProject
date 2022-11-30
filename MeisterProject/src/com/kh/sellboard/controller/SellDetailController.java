package com.kh.sellboard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.common.model.vo.Attachment;
import com.kh.member.model.vo.Member;
import com.kh.review.model.service.ReviewService;
import com.kh.review.model.vo.Review;
import com.kh.sellboard.model.service.SellBoardService;
import com.kh.sellboard.model.vo.SellBoard;

/**
 * Servlet implementation class SellDetailController
 */
@WebServlet("/detail.se")
public class SellDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SellDetailController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 로그인이 된 상태가 아니면 실행 안되게 하는 것.
	    if( request.getSession().getAttribute("loginUser") == null) {
	    	HttpSession session = request.getSession();
	    	session.setAttribute("errorMsg", "로그인 후 이용하실 수 있습니다.");
	        request.getRequestDispatcher("views/member/loginForm.jsp").forward(request, response);
	        
	        return;
	    }
		
	    
	    request.setCharacterEncoding("UTF-8");

		int sellNo = Integer.parseInt(request.getParameter("sno"));
		
		
		ArrayList<Review> getAllReview = new SellBoardService().selectAllReview(sellNo);
		System.out.println(getAllReview.get(0).getAvg());
		

		 

		
		SellBoardService sService = new SellBoardService();
		
		int result = sService.increaseCount(sellNo); // 조회수 증가
		
		
		if(result > 0) { // 유효한 게시글일때 => 게시글, 첨부파일 조회 => 상세조회 페이지
			
			SellBoard s = sService.selectSellBoard(sellNo); // 게시글 조회
			Attachment at = sService.selectAttachment(sellNo); // 첨부파일 조회(Attachment)

			
			request.setAttribute("s", s);
			request.setAttribute("at", at);
			request.setAttribute("sno", sellNo);
			request.setAttribute("getAllReview", getAllReview);
			request.getRequestDispatcher("views/sell/sellDetailView.jsp").forward(request, response);
			
		}else {
			request.setAttribute("errorMsg", "판매 상세조회 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp");
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
