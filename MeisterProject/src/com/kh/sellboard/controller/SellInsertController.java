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
 * Servlet implementation class SellInsertController
 */
@WebServlet("/insert.se")
public class SellInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SellInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			System.out.println("글등록");
			
			int maxSize = 1024 * 1024 * 10;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/sellBoard_upfiles/");
			
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
				
			
			// DB에 저장
		    String sellTitle = multiRequest.getParameter("sellTitle");
		    String sellContent = multiRequest.getParameter("sellContent");
		    int price = Integer.parseInt (multiRequest.getParameter("price"));
		    
		    int local = Integer.parseInt (multiRequest.getParameter("local"));
		    int interest  = Integer.parseInt (multiRequest.getParameter("interest"));
		    int userNO = Integer.parseInt(multiRequest.getParameter("userNO"));
		    
		    
		    
			SellBoard s = new SellBoard();
				
			s.setSellTitle(sellTitle);
			s.setSellContent(sellContent);
			s.setPrice(price);
			
			s.setLocalNo(local);
			s.setInterestNo(interest);
			s.setUserNO(userNO);
			
			
			
			Attachment at = null;
			
			if(multiRequest.getOriginalFileName("upfile") != null) {
		           
		           at = new Attachment();
		           at.setOriginName(multiRequest.getOriginalFileName("upfile")); // 원본파일명
		           at.setChangeName(multiRequest.getFilesystemName("upfile")); // 수정명(실제 서버에 업로드 되어있는 파일명)
		           at.setFilePath("resources/sellBoard_upfiles/");
		           
		       }
			// 서비스 요청
			int result = new SellBoardService().insertSellBoard(s, at);
			
			if(result > 0) {
				request.getSession().setAttribute("alrtMsg", "글 등록 성공!");
				response.sendRedirect(request.getContextPath()+"/market.se?currentPage=1");
				
			} else {
				
				 if(at != null) { 
					 
					 new File(savePath+at.getChangeName()).delete(); 
				}
				 			
				request.setAttribute("errorMsg", "글 등록 실패!");
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
