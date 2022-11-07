package com.kh.manager.Controller;

import com.kh.member.model.vo.Member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ManagerController
 */
@WebServlet("/manager.ad")
public class ManagerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    // 관리자가 아니면 실행 안되게 하는 것.
	    if( !(request.getSession().getAttribute("loginUser") != null && 
	            ((Member)request.getSession().getAttribute("loginUser")).getUserId().equals("admin"))) {
	        request.setAttribute("errorMsg", "관리자 권한이 없습니다.");
	        request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
	        
	        return;
	    }
	    

	    
	    if(request.getSession().getAttribute("loginUser") != null && 
	            ((Member)request.getSession().getAttribute("loginUser")).getUserId().equals("admin")) {   
	    	
	    	request.getRequestDispatcher("views/manager/managerPage.jsp").forward(request, response);
	    	
	    } else {   
	        request.setAttribute("errorMsg", "관리자 권한이 없습니다.");
	        request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);

	    }
	    
	    System.out.println("관리자 페이지로 이동");
	}
	    
	   
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
