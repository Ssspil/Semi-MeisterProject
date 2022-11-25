package com.kh.sellboard.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.common.MyFileRenamePolicy;
import com.kh.common.model.vo.Attachment;
import com.kh.sellboard.model.service.SellBoardService;
import com.kh.sellboard.model.vo.SellBoard;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class SellUpdateController
 */
@WebServlet("/update.se")
public class SellUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SellUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10 * 1024 * 1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/sellBoard_upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// DB
			int sellNo = Integer.parseInt(multiRequest.getParameter("sno"));
			String sellTitle = multiRequest.getParameter("sellTitle");
			String sellContent = multiRequest.getParameter("sellContent");
			int price = Integer.parseInt(multiRequest.getParameter("price"));
			String sellDetail = multiRequest.getParameter("sellDetail");
			String sellRegulation = multiRequest.getParameter("sellRegulation");
			
			int local = Integer.parseInt(multiRequest.getParameter("local"));
			int interest = Integer.parseInt(multiRequest.getParameter("interest"));
			int userNO = Integer.parseInt(multiRequest.getParameter("userNO"));
			
			SellBoard s = new SellBoard();
			
			s.setSellNo(sellNo);
			s.setSellTitle(sellTitle);
			s.setSellContent(sellContent);
			s.setPrice(price);
			s.setSellDetail(sellDetail);
			s.setSellRegulation(sellRegulation);
			
			s.setLocalNo(local);
			s.setInterestNo(interest);
			s.setUserNO(userNO);
			
			// 첨부파일
			
			Attachment at = null;
			
			if(multiRequest.getParameter("originFileNo") != null) {
				
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("upfile"));
				at.setChangeName(multiRequest.getFilesystemName("upfile"));
				at.setFilePath("resources/board_upfiles/");
				
				if(multiRequest.getParameter("originFileNo") != null) {
					at.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));
					
					new File(savePath+multiRequest.getParameter("originFileName")).delete();
				}else {
					at.setRefNo(sellNo);
				}
				
			}
			
			//
			int result = new SellBoardService().updateSellBoard(s, at);
			
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "수정이 완료되었습니다.");
				response.sendRedirect(request.getContextPath()+"detail.se?sno="+sellNo);
			}else {
				request.setAttribute("errorMsg", "수정에 실패하였습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
