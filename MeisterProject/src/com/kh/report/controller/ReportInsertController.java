package com.kh.report.controller;

import java.io.File;
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
import com.kh.report.model.service.ReportService;
import com.kh.report.model.vo.Report;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ReportInsertController
 */
@WebServlet("/insert.re")
public class ReportInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportInsertController() {
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
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/report_upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String reportTitle = multiRequest.getParameter("reportTitle");
			String reportContent = multiRequest.getParameter("reportContent");
			String reason = multiRequest.getParameter("reason");
			int userNo = Integer.parseInt( multiRequest.getParameter("userNo"));	// 신고하는 사람 유저번호
			
			
			// 닉네임에서 유저번호를 찾기위한 기능
			String findNick = multiRequest.getParameter("nickname");
			int reportedUserNo = new MemberService().userNoFromNickname(findNick);
			
			
			Report re = new Report();
			re.setReportTitle(reportTitle);
			re.setReportContent(reportContent);
			re.setReason(reason);
			re.setReportUserNo(userNo);
			re.setReportedUserNo(reportedUserNo);
			
			Attachment at = null;
			
			if(multiRequest.getOriginalFileName("reportFile") != null ) {
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("reportFile"));	// 원본명
				at.setChangeName(multiRequest.getFilesystemName("reportFile"));		// 수정명 (실제서버에 업로드 되어있는 파일명
				at.setFilePath("resources/report_upfiles/");
			}
			
			int result = new ReportService().insertReport(re, at);
			
			if( result > 0 ) {	// 성공 시 홈으로 
				HttpSession session = request.getSession();
				session.setAttribute("alertMsg", "신고가 정상적으로 접수되었습니다.");
				
				response.sendRedirect(request.getContextPath()+"/"); 
			} else {	// 실패 시 > 첨부파일 있었을 경우 이미 업로드된 첨부파일을 서버에 보관할 이유가 없다 -> 삭제
				if(at != null) {
					//	삭제시키고자 하는 파일 객체 생성 > delete메소드 호출
					new File(savePath+at.getChangeName()).delete();
					request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
				}
				
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
