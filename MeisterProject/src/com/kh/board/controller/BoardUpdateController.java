package com.kh.board.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.board.model.service.BoardService;

import com.kh.board.model.vo.Board;
import com.kh.common.MyFileRenamePolicy;
import com.kh.common.model.vo.Attachment;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class BoardUpdateController
 */
@WebServlet("/update.bo")
public class BoardUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request));
	
		int maxSize = 10 * 1024 * 1024;
		
		String savePath =  request.getSession().getServletContext().getRealPath("/resources/board_upfiles/");
		
		MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
		
		int boardNo = Integer.parseInt(multiRequest.getParameter("bno"));
		String boardTitle = multiRequest.getParameter("title");
		String boardContent = multiRequest.getParameter("content");
		
		Board b = new Board();
		b.setBoardNo(boardNo);
		b.setBoardTitle(boardTitle);
		b.setBoardContent(boardContent);
		
		Attachment at = null;
		
		if(multiRequest.getOriginalFileName("upfile") != null) {
			
			at = new Attachment();
			at.setOriginName(multiRequest.getOriginalFileName("upfile"));
			at.setChangeName(multiRequest.getFilesystemName("upfile"));
			at.setFilePath("resources/board_upfiles/");
			
			if(multiRequest.getParameter("originFileNo") != null) {
				at.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));
				
				new File(savePath+multiRequest.getParameter("originFileName")).delete();
			} else {
				// 기존에 파일이 없는 경우
				// => insert Attachment
				// ref_bno + 현재 게시물 번호
				at.setRefNo(boardNo);
			}
		}
		
		int result = new BoardService().updateBoard(b, at);
		
		if(result > 0) { // 수정성공 => 상세조회페이지
			request.getSession().setAttribute("alertMsg", "성공적으로 수정되었습니다.");
			response.sendRedirect(request.getContextPath()+"/detail.bo?bno="+boardNo);
		} else { // 수정실패 => errorPage
			request.setAttribute("errorMsg", "게시글 수정에 실패했습니다");
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
