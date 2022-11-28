<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.board.model.vo.*, java.util.ArrayList,com.kh.common.model.vo.Attachment" %>
   <%
   ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");
	ArrayList<Reply> rlist = (ArrayList<Reply>) request.getAttribute("rlist");
   %>
<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			<table class="center">
				<tr>
					<th style="width:500px;">글내용</th>
					<th style="width:500px;">커뮤니티 게시글 사진</th>
				</tr>
				
				<tr>
					<td name="bno" style="height: 100px;"><%=list.get(0).getBoardContent() %></td>
					<td style="height: 100px;"><%=list.get(0).getTitleImg() %></td>
				</tr>
			
			</table>
			<br> <br>
			<table class="table">
				<thead>
					<tr>
						<th style="width: 100px;">댓글 번호</th>
						<th style="width: 150px;">작성자 아이디</th>
						<th style="width: 100px;">닉네임</th>
						<th style="width: 100px;">작성일</th>
						<th style="width: 200px;">댓글 상세</th>
						<th style="width: 100px;">삭제</th>
					</tr>
				</thead>
				<tbody>
				
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td><button>삭제</button></td>
					</tr>
				
				</tbody>
			</table>
		</div>