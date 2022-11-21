package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.common.MyFileRenamePolicy;
import com.kh.common.model.vo.Attachment;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ExpertSubmitController
 */
@WebServlet("/expertSubmit.me")
public class ExpertSubmitController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExpertSubmitController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10;
	
			String savePath = request.getSession().getServletContext().getRealPath("/resources/expert_upfiles/");
				
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
	
			int userNo = Integer.parseInt(multiRequest.getParameter("userNo"));
			String userId = multiRequest.getParameter("userId");
			String userName = multiRequest.getParameter("userName");
			String gender = multiRequest.getParameter("gender");
			String phone = ("010".concat(multiRequest.getParameter("phoneMid"))).concat(multiRequest.getParameter("phoneLast"));
			String email = ((multiRequest.getParameter("emailFront")).concat("@")).concat(multiRequest.getParameter("emailBack"));
			String speciality = multiRequest.getParameter("speciality");
			System.out.println(userNo);
			System.out.println(multiRequest.getOriginalFileName("expertFile"));
			Attachment at = null;
			
			if(multiRequest.getOriginalFileName("expertFile") != null) {	
				at = new Attachment();
				at.setRefNo(userNo);
				at.setOriginName(multiRequest.getOriginalFileName("expertFile"));
				at.setChangeName(multiRequest.getFilesystemName("expertFile"));
				at.setFilePath("resources/expert_upfiles/");
			}
			
			Member m = new Member(userId, userName, gender, email, phone, speciality, "Y");
	
			Member result = new MemberService().expertSubmit(m, at);
			
			if(result == null) {
				request.setAttribute("errorMsg", "회원정보 수정에 실패했습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("loginUser", result);
				session.setAttribute("alertMsg", "제출");
	
				response.sendRedirect(request.getContextPath()+"/mypage.me");
			}
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
