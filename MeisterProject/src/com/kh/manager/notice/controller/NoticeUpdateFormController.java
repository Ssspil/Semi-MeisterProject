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
 * Servlet implementation class NoticeUpdateFormController
 */
@WebServlet("/updateForm.ad")
public class NoticeUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		NoticeService nService = new NoticeService();
		
		int NoticeNo = Integer.parseInt(request.getParameter("nno"));
				
		Notice n = nService.selectNotice(NoticeNo); 
				
		request.setAttribute("n", n);
		request.getRequestDispatcher("views/manager/noticeUpdateForm.jsp").forward(request, response);
	
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
