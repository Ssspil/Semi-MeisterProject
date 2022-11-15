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
	
	#web-body {
		box-sizing: border-box;
		padding-top: 100px;
		width: 750px;
		margin: 0 auto;
		border: 1px solid green;
    }
	.container {
        display: flex;
        flex-direction: column;
        background-color: #fff;
        margin-top: 2rem
		
	}
	.outer3 {
		box-sizing: border-box;
		border: 1px solid blue;
		height: auto;
		display: flex;
   	 	flex-direction: column;
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
	#nickname{
		left: 10%;
	
		
	}
	#date {
		right: 100px;
	}
	#title{
		display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 1.5rem;
		
	}
	#content{
		box-sizing: border-box;
		border: 1px solid yellow;
		width: 100%;
		height: 250px;
		

	}
	#footer1{
		box-sizing: border-box;
		border: 1px solid indianred;
		width: 100%;
		height: 50%;
	}
	.btn {
		margin-right: 10px;
		margin-top: 15px;
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
	<%@ include file="../common/header.jsp" %>

	<div id="web-body">
		<div class="container">
			<div><p><h1>asdasdasdasda</h1></p></div>
			<div>
                <div class="title">
                    <a href="resources/resources/image/animal2.gif"></a>
                    <div>
                        <button>수정</button>
                    </div>
                </div>
            </div>
			
		</div>
        <br>
		<hr>

		<div class="outer3">	
			<div id="content">
				<p>
					<span>aaaaaaaaaaaaaaaaaaa</span>
				</p>
			</div>
			<div>여긴 썸네일</div> <!--썸네일-->
			<div>
				<p>이 부분은 좋아요 댓글</p>
			</div>	
		</div>	
		<hr>
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
			
	<%@ include file="../common/footer.jsp" %>
	
	
</body>
</html>