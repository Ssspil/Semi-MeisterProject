package com.kh.review.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.vo.Member;
import com.kh.review.model.service.ReviewService;
import com.kh.review.model.vo.Review;

/**
 * Servlet implementation class ReviewSelectController
 */
@WebServlet("/reviewUpdate.rv")
public class ReviewUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		int userNo = loginUser.getUserNo();
		int sellNo = Integer.parseInt(request.getParameter("sellNo"));
		String reviewContent = request.getParameter("reviewText");
		Double reviewScore = Double.parseDouble(request.getParameter("score")) * 0.5;

		int reviewNo = new ReviewService().getReviewNo(userNo, sellNo);
		
		int result = new ReviewService().updateReview(reviewNo, reviewContent, reviewScore);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "리뷰 수정 성공");
			response.sendRedirect(request.getContextPath()+"/mypage.me");
		} 
		else {
			session.setAttribute("errorMsg", "리뷰 수정 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
