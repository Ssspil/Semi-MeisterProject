package com.kh.manager.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.manager.notice.model.service.NoticeService;
import com.kh.manager.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeInsetController
 */
@WebServlet("/insert.ad")
public class NoticeInsetController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeInsetController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    request.setCharacterEncoding("UTF-8");

        String noticeTitle = request.getParameter("noticeTitle");
        String noticeContent = request.getParameter("noticeContent");

        
        Notice n = new Notice();
        
        n.setNoticeTitle(noticeTitle);
        n.setNoticeContent(noticeContent);
        
        int result = new NoticeService().insertNotice(n);
        
        if (result > 0) {   // 성공시 =>  리 다이렉트.
            request.getSession().setAttribute("alertMsg", "성공적으로 공지사항이 등록되었습니다.");
            response.sendRedirect(request.getContextPath()+"/notice.ad"); 
        } else {    // 실패시 -> 에러페이지 보여지도록
            request.setAttribute("errorMsg", "공지사항 등록 실패");
            request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
        }
        
        System.out.println("공지사항 작성 완료");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
