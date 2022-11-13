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
 * Servlet implementation class MemberUpdateController
 */
@WebServlet("/update.me")
public class MemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateController() {
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

			String savePath = request.getSession().getServletContext().getRealPath("/resources/profile_upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			int userNo = Integer.parseInt(multiRequest.getParameter("userNo"));
			String userId = multiRequest.getParameter("userId");
			String nickName = multiRequest.getParameter("nickName");
			String interest = multiRequest.getParameter("interests");
			String userName = multiRequest.getParameter("userName");
			String phone = null;
			String email = null;
			String emailBack = multiRequest.getParameter("emailBack");
			
			if(multiRequest.getParameter("phoneMid") != null || multiRequest.getParameter("phoneLast") != null) {			
				phone = ("010".concat(multiRequest.getParameter("phoneMid"))).concat(multiRequest.getParameter("phoneLast"));
			}
			
			if(multiRequest.getParameter("emailFront") != null || (multiRequest.getParameter("emailBack") != null)){
				if(emailBack.equals("other")) {
					emailBack = multiRequest.getParameter("emailBackOther");
				}
				System.out.println(emailBack);
				email = ((multiRequest.getParameter("emailFront")).concat("@")).concat(emailBack);
			}
			
			Member m  = new Member(userId, nickName, interest, userName, email, phone);
			
			Attachment at = null;
			
			if(multiRequest.getOriginalFileName("profileImg") != null) {	
				at = new Attachment();
				at.setRefBNo(userNo);
				at.setOriginName(multiRequest.getOriginalFileName("profileImg"));
				at.setChangeName(multiRequest.getFilesystemName("profileImg"));
				at.setFilePath("resources/profile_upfiles/");
			}

			Member updateMem = new MemberService().updateMember(m, at);
			
			if(updateMem == null) {
				request.setAttribute("errorMsg", "회원정보 수정에 실패했습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("loginUser", updateMem);
				session.setAttribute("alertMsg", "회원정보를 수정 성공");
				
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
