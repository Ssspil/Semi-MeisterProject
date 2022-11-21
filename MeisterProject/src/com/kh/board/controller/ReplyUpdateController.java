package com.kh.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.Reply;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class ReplyUpdateController
 */
@WebServlet("/update.ro")
public class ReplyUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String content = request.getParameter("content");
		int rno = Integer.parseInt(request.getParameter("rno"));
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		
		Reply r = new Reply();
		r.setReplyContent(content);
		r.setReplyNo(rno);
		
		BoardService object = new BoardService();

		int result = object.updateReply(r);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "성공적으로 댓글을 수정했습니다.");
			response.sendRedirect(request.getContextPath()+"/detail.bo?bno="+boardNo);
		} else {
			request.setAttribute("errorMsg","댓글 수정 실패");
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
