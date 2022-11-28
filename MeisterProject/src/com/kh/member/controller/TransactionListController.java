package com.kh.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.common.model.vo.Attachment;
import com.kh.common.model.vo.PageInfo;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;
import com.kh.review.model.vo.Review;
import com.kh.sellboard.model.vo.SellBoard;

/**
 * Servlet implementation class TransactionListController
 */
@WebServlet("/myTransaction.me")
public class TransactionListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TransactionListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		//페이징 처리
		//페이징 처리~
				int listCount; 
				int currentPage; 
				int pageLimit; 
				int boardLimit; 
				int maxPage; 
				int startPage;
				int endPage;
				
				listCount = new MemberService().selectListStatusCount(1);
				
				currentPage = Integer.parseInt(request.getParameter("currentPage") == null ? "1" : request.getParameter("currentPage"));
			
				pageLimit = 10;
				
				boardLimit = 7;
			
				maxPage = 11;

				maxPage = (int)Math.ceil((double)listCount/ boardLimit);
				
				startPage = (currentPage -1) / pageLimit * pageLimit + 1;
				
				endPage = startPage + pageLimit - 1;
				
				if(endPage > maxPage) {
					endPage = maxPage;
				}
				
				int listCount2; 
				int currentPage2; 
				int pageLimit2; 
				int boardLimit2; 
				int maxPage2; 
				int startPage2;
				int endPage2;
				
				listCount2 = new MemberService().selectListStatusCount(2);
				
				currentPage2 = Integer.parseInt(request.getParameter("currentPage") == null ? "1" : request.getParameter("currentPage"));
			
				pageLimit2 = 10;
				
				boardLimit2 = 7;
			
				maxPage2 = 11;

				maxPage2 = (int)Math.ceil((double)listCount2/ boardLimit2);
				
				startPage2 = (currentPage2 -1) / pageLimit2 * pageLimit2 + 1;
				
				endPage2 = startPage2 + pageLimit2 - 1;
				
				if(endPage2 > maxPage2) {
					endPage2 = maxPage2;
				}
				
				int listCount3; 
				int currentPage3; 
				int pageLimit3; 
				int boardLimit3; 
				int maxPage3; 
				int startPage3;
				int endPage3;
				
				listCount3 = new MemberService().selectListStatusCount(3);
				
				currentPage3 = Integer.parseInt(request.getParameter("currentPage") == null ? "1" : request.getParameter("currentPage"));
			
				pageLimit3 = 10;
				
				boardLimit3 = 7;
			
				maxPage3 = 11;

				maxPage3 = (int)Math.ceil((double)listCount3/ boardLimit3);
				
				startPage3 = (currentPage3 -1) / pageLimit3 * pageLimit3 + 1;
				
				endPage3 = startPage3 + pageLimit3 - 1;
				
				if(endPage3 > maxPage3) {
					endPage3 = maxPage3;
				}
				
				PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
				PageInfo pi2 = new PageInfo(listCount2, currentPage2, pageLimit2, boardLimit2, maxPage2, startPage2, endPage2);
				PageInfo pi3 = new PageInfo(listCount3, currentPage3, pageLimit3, boardLimit3, maxPage3, startPage3, endPage3);
				request.setAttribute("pi", pi);
				request.setAttribute("pi2", pi2);
				request.setAttribute("pi3", pi3);
				
				Member loginUser = (Member)session.getAttribute("loginUser");
				
				int userNo = loginUser.getUserNo();
				ArrayList<SellBoard> s = new ArrayList<>();
				ArrayList<Integer> status = new ArrayList<>();
				ArrayList<Integer> trans = new MemberService().getTransaction(userNo);
				ArrayList<Integer> reviewNo = new ArrayList<>();
				ArrayList<Review> review = new ArrayList<>();
				
				for(int i = 0; i < trans.size(); i+=3) {
					s.addAll(new MemberService().getSellBoard(trans.get(i)));
					reviewNo.add(trans.get(i+1));
					status.add(trans.get(i+2));
				}
				
				System.out.println(trans);
				ArrayList<Attachment> at = new ArrayList<Attachment>();
				
				for(int i = 0; i < s.size(); i++) {
					Attachment atTest = new MemberService().selectAttachment(s.get(i).getSellNo(), 2);
					if(atTest != null) {
						at.add(atTest);				
					}
					else {
						at.add(new Attachment());
					}
				}
				
				for(int i = 0; i < reviewNo.size(); i++) {
					if(reviewNo.get(i) != 0) {
						review.add(new MemberService().getReview(reviewNo.get(i)));
					}
					else {
						review.add(new Review());
					}
				}
				
				request.setAttribute("s", s);
				request.setAttribute("at", at);
				request.setAttribute("status", status);
				request.setAttribute("review", reviewNo);

				System.out.println(review);
				
		if(session.getAttribute("loginUser") == null) { // 로그인 안한 상태
			session.setAttribute("alertMsg", "로그인 후 이용가능한 서비스 입니다.");
			response.sendRedirect(request.getContextPath());
		} else { // 로그인 한 상태
			request.getRequestDispatcher("views/member/myTransactionPage.jsp").forward(request, response);
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
