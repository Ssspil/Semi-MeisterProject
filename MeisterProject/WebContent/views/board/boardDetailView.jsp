<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.board.model.vo.*, com.kh.common.model.vo.Attachment" %>
<%
	Board b = (Board) request.getAttribute("b");
	// 게시글번호, 제목, 내용, 작성자 닉네임, 작성일

	Attachment at = (Attachment) request.getAttribute("at");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {
		margin: auto;
	}
	#web-header {
		box-sizing: border-box;
		width: 1000px;
	    height: 20%;
		margin: auto;
		position: relative;
		border: 1px solid red;
		
	}
	#web-body {
		box-sizing: border-box;
		
		width: 750px;
		margin: 0 auto;
		border: 1px solid green;
    }
	.container {
		width: 100%;
		height: 30%;
		box-sizing: border-box;
		display: block;
		margin: 0 auto;
		
	}
	.outer3 {
		box-sizing: border-box;
		border: 1px solid darkblue;
		height: 50%;
	}
	.outer4 {
		margin: 0 auto;
		padding-top: 1.25rem;
		display: block;
		border: 1px solid black;
	}
	#img{
		box-sizing: border-box;
		float: left;
		width: 150px;
		height: 100px;
	}
	#btn{
		float: right;
	}
	#nickname{
		left: 10%;
	
		
	}
	#date {
		right: 100px;
	}
	#title{
		box-sizing: border-box;
		height: 20%;
		
	}
	#content{
		box-sizing: border-box;
		border: 1px solid black;
		width: 100%;
		height: 60%;
		margin: auto;
		

	}
	#footer1{
		box-sizing: border-box;
		border: 1px solid indianred;
		width: 100%;
		height: 50%;
	}
	.btn {
		float: right;
	}
	#footer1 {
		text-align: center;
		
		position: relative;
    	width: 100%;
	}
	#area {
		
		align-items: flex-start;
		position: relative;
		margin: 20px 0;
		padding: 1.0625rem 0.875rem;
		border-radius: 8px;
		border: 0.0625rem solid white;
		background-color: orange;
		
	}
	#area1 {
		width: 100%;
    	position: relative;
		
	}
	.area {
		resize:none;
		width: 640px;
		height: 40px;
		padding: 10px;
		border: 0;
		outline: none;
		font-size: 1rem;
		color: black;
		font-weight: bold;

	}

	<!---->
	#reply {
		display: block;
		list-style-type: disc;
		margin-block-start: 1em;
		margin-block-end: 1em;
		margin-inline-start: 0px;
		margin-inline-end: 0px;
		padding-inline-start: 40px;
		width: 100%;
		margin-bottom: 0;
		padding: 0;
		margin-top: 0;
	}
	#pointer {
		cursor: pointer;
		float: right;
		position: relative;
		top: -30px;
	}
	
</style>
</head>
<body>
	

	<div id="web-header"></div>
	<div id="web-body">
		
		<div class="container">
			<%= b.getBoardTitle() %>
			<br>
			<br>
			<div id="title">
			<img src="" id="img"> 
			<span  id="nickname"><%=b.getNICKNAME %></span>
			<br><br><br>
			<span id="date">20132399</span>
			<button class="btn">수정</button>
			<button class="btn">삭제</button>
			</div>
		</div>
		<hr class="sen">
		<div class="outer3">	
			<div id="content">
				<textarea name="" id="" cols="30" rows="10" style="resize: none; width: 100%; height: 100%;"><%= b.getBoardContent() %>
					<% if(at == null) { %>
						<!-- 첨부파일이 없는경우 -->
						첨부파일이 없습니다.
					<% } else { %>
						<!-- 첨부파일이 있는경우 -->
						<!-- 브라우저에서 http://localhost:8001/jsp/resources/board_upfiles/xxx.jpg -->
						<a href="<%=contextPath %>/<%= at.getFilePath() + at.getChangeName() %>" 
						download="<%= at.getOriginName() %>">
							<%= at.getOriginName() %>
						</a> 
					<% } %>
				</textarea>
				
			</div>
			<p>이 부분은 좋아</p>
		</div>	
		<div id="footer1">
			<div id="area">
				<div id="area1">
					<textarea class="area"></textarea>
				</div>
				
				<div id="pointer">등록</div>
				
			</div>
			<ul id="reply">
				<li></li>
			</ul>
		</div>
	</div>
			
	
	
	
</body>
</html>