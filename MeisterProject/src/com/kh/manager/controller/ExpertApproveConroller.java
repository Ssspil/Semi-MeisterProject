package com.kh.manager.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.Attachment;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class ExpertApproveConroller
 */
@WebServlet("/expert.ad")
public class ExpertApproveConroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExpertApproveConroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
	    // 관리자가 아니면 실행 안되게 하는 것.
	    if( !(request.getSession().getAttribute("loginUser") != null && 
	            ((Member)request.getSession().getAttribute("loginUser")).getUserId().equals("admin@admin.com"))) {
	        request.setAttribute("errorMsg", "관리자 권한이 없습니다.");
	        request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
	        
	        return;
	    }
	    
	    ArrayList<Member> submitList = new MemberService().submlitListAllSelect();
	    ArrayList<Attachment> atArr = new MemberService().selectAllList();
	    

	    	
	    System.out.println(submitList);
	    System.out.println(atArr);
	    	
	    
	    System.out.println("전문가 승인 관리 페이지로 이동");
	    
	    if(submitList != null) {
		    request.setAttribute("submitList", submitList);
		    request.setAttribute("atArr", atArr);
		    request.getRequestDispatcher("views/manager/expertApprove.jsp").forward(request, response);
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
