<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<style>
	#wrap {
/* 		background: black; */
        color: orange;
        width: 1100px;
        height: 800px;
        margin: auto;
       	padding-top: 105px;
	}
	#wrap2 {
		poisiton: 
	}
	#wrap .btn {
		display:block;
		color: orange;
	}
	#enroll-form input {
		display: block;
		width: 100%;
	}
	
	#wrap-title {
		height: 100px;
    	padding: 15px;
    	display: block;
	}
	#wrap-title2 {
		display: flex;
	    align-items: center;
	    justify-content: space-between;
	    width: 60.625rem;
	    height: 100%;
	    margin: auto;
	}
	#file {
		height: 100px;
    	padding: 15px;
    	display: block;
	}
	
	#file2 {
		display: flex;
	    align-items: center;
	    justify-content: space-between;
	    width: 60.625rem;
	    height: 100%;
	    margin: auto;
	    border-top: 1px solid orange;
		border-bottom: 1px solid orange;
	}
	
	#title {
		height: 100px;
    	padding: 15px;
    	display: block;
	}
	#title1 {
		display: flex;
	    align-items: center;
	    justify-content: space-between;
	    width: 60.625rem;
	    height: 100%;
	    margin: auto;
	    border-top: 1px solid orange;
		border-bottom: 1px solid orange;
	}
	.title {
		width: 100%;
		height: 100%;
		position: relative;
		border: 0;
		outline: none;
	}
	
	#content {
		height: 350px;
    	padding: 15px;
    	display: block;
	}
	
	#content2 {
		display: flex;
	    align-items: center;
	    justify-content: space-between;
	    width: 60.625rem;
	    height: 100%;
	    margin: auto;
	    border-top: 1px solid orange;
		border-bottom: 1px solid orange;
	}
	#content3 {
		width: 100%;
		height: 100%;
		resize: none;
		border: 0;
		outline: none;
		
	}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<div id="wrap">
		<form id="enroll-form" action="<%=contextPath %>/insert.bo" method="post" enctype="multipart/form-data" style="height: 700px;">
		<div id="wrap2">
			<div id="wrap-title">
					<div id="wrap-title2" style="font-size:1">
						<font style="font-size: 30px; font-weight: bold;">게시글 글작성</font>
						<button	type="button" class="btn" disabled="disabled" style="font-size: 20px; font-weight: bold;">등록</button>	
					</div>
					<div id="file">
						<div id="file2">
							<input type=file class=file>
						</div>
					</div>
		<br>
					<div id="title">
						<div id="title1">
							<input type="text" class="title" size="30" placeholder="게시글 제목을 입력헤주세요.">
						</div>
					</div>
					<br>
					<div id="content">
						<div id="content2">
							<textarea id="content3" row="10" placeholder="게시글 내용을 입력해주세요."></textarea>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
		
	<%@ include file="../common/footer.jsp" %>
</body>
</html>