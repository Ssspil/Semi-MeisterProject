<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.board.model.vo.*, com.kh.common.model.vo.Attachment" %>
<%
	Board b = (Board) request.getAttribute("b");

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
		
	
		
	}
	#date {
		
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
		margin-bottom: 10rem;
		position: relative;
    	width: 100%;
	}
	#area {
		display: flex;
		align-items: flex-start;
		position: relative;
		margin: 1.25rem 0;
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
		width: 100%;
		height: 50px;
		padding: 0;
		border: 0;
		outline: none;
		font-size: 1rem;
		color: black;
	}
</style>
</head>
<body>
	

	<div id="web-header"></div>
	<div id="web-body">
		
		<div class="container">
			<h1>제목</h1>
			<br>
			<br>
			<div id="title">
			<img src="" id="img"> 
			<span  id="nickname">sssssssssssssssssss</span>
			<span id="date">20132399</span>
			<button class="btn">수정</button>
			<button class="btn">삭제</button>
			</div>
		</div>
		<hr class="sen">
		<div class="outer3">	
			<div id="content">
				<textarea name="" id="" cols="30" rows="10" style="resize: none; width: 100%; height: 100%;"></textarea>
			</div>
			<p>d 4 a 7</p>
		</div>	
		<div id="footer1">
			<div id="area">
				<div id="area1">
					<textarea class="area">assssss</textarea>
				</div>
				<div></div>
			</div>
			<ul>
				<li></li>
			</ul>
		</div>
	</div>
			
	
	
	
</body>
</html>