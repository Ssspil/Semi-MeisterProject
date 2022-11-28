<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.board.model.vo.*, java.util.ArrayList,com.kh.common.model.vo.Attachment" %>
<%
	String contextPath = request.getContextPath();

	ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");

	ArrayList<Reply> rlist = (ArrayList<Reply>) request.getAttribute("rlist");
%>
   
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="author" content="JSP" />
<title>관리자 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />

<!--  jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- css -->
<link href="<%= contextPath %>/resources/css/manager.css" rel="stylesheet" type="text/css"  />
<body>


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
				<tbody class="comments-list">
					
				</tbody>
			</table>
		</div>
		
		<script>
		$(function() {
			
			$.ajax({
				url : "boardModal.ad",
				data : {bno : ${b.boardNo}},
				success : (list) => {
					let htmls="";
					for(let i of list)
					let htmls="";
						htmls += '<tr>' 
						htmls += 	'<td>'+i.replyNo+'</td>';
						htmls +=	'<td>'+i.userId+'</td>';	
						htmls += 	'<td>'+i.mbNic+'</td>';
						htmls += 	'<td>'+i.replyDate+'</td>';
						htmls += 	'<td>'+i.replyContent+'</td>';
						htmls += '</tr>';
		}),
			 $(".comments-list").html(htmls);
		},
			error : function() {
				console.log("댓글리스트조회용 ajax통신 실패~");
			}
		});
		</script>
		<script>
		$(function() {

 			$(".btn").click(function() {
 				$(".modal").fadeIn();
 			});

 			$(".modal_content").click(function() {
 				$(".modal").fadeOut();
 			});
		});
	</script>
</body>
</html>