package com.kh.sellboard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.Attachment;
import com.kh.sellboard.model.service.SellBoardService;
import com.kh.sellboard.model.vo.SellBoard;

/**
 * Servlet implementation class PaymentController
 */
@WebServlet("/payment.se")
public class PaymentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int sellNo = Integer.parseInt(request.getParameter("sno"));
		
		SellBoardService sService = new SellBoardService();
		
		
		SellBoard pm = sService.selectSellBoard(sellNo); // 게시글 조회
		Attachment at = sService.selectAttachment(sellNo); // 첨부파일 조회(Attachment)
		
		
		request.setAttribute("pm", pm);
		request.setAttribute("at", at);
		request.setAttribute("sno", sellNo);
		
		request.getRequestDispatcher("views/sell/payment.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
