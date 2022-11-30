package com.kh.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.BoardService;

/**
 * Servlet implementation class ReplyListDeleteController
 */
@WebServlet("/deleteList.ro")
public class ReplyListDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyListDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int boardNo = Integer.parseInt(request.getParameter("bno"));
		int replyNo = Integer.parseInt(request.getParameter("rno"));
		
		int result = new BoardService().deleteReplylist(replyNo);
		
		if (result > 0) {
			request.getSession().setAttribute("alertMsg", "성공적으로 댓글을 삭제했습니다.");
			response.sendRedirect(request.getContextPath()+"/board.ad");
		} else {
			request.setAttribute("errorMsg","이미 삭제된 댓글입니다.");
			request.setAttribute("location","board.ad");
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
