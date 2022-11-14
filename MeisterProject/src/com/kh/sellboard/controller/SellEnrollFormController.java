package com.kh.sellboard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.Interest;
import com.kh.common.model.vo.Local;
import com.kh.sellboard.model.service.SellBoardService;

/**
 * Servlet implementation class SellEnrollFormController
 */
@WebServlet("/sellEnrollForm.se")
public class SellEnrollFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    /**2
     * @see HttpServlet#HttpServlet()
     */
    public SellEnrollFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Interest> interest = new SellBoardService().selecInterestCategory();
		
		request.setAttribute("interest", interest);
		
		
		ArrayList<Local> local = new SellBoardService().selecLocalCategory();
		
		request.setAttribute("local", local);
		
		request.getRequestDispatcher("views/sell/sellEnrollForm.jsp").forward(request, response);
		
		
	
	
		
		// setAttribute
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
