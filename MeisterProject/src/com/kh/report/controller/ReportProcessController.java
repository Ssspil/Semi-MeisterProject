package com.kh.report.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.report.model.service.*;

/**
 * Servlet implementation class ReportProcessController
 */
@WebServlet("/processed.do")
public class ReportProcessController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportProcessController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int rpno = Integer.parseInt(request.getParameter("rpno"));
		System.out.printf("%d 번 신고문서 처리완료 \n", rpno);
		
		int complete = new ReportService().reportProcessed(rpno);
		
		if (complete > 0) {
			String responseData = "처리를 완료하였습니다.";
			// 응답데이터에 한글이 있을 경우 대비해서 설정
			response.setContentType("text/html; charset=UTF-8");
			
			response.getWriter().print(responseData);
			
			
		} else {
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
