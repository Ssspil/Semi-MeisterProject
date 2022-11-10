<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<style>

</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>

		<form action="<%=contextPath %>/insert.bo" id="enroll-form" method="post" enctype="multipart/form-data">
			<div id="header">
		       <div id="header2"></div>
		        <h1>게시글 작성</h1>
		        <button type="button" id="made">등록</button>
		        <div id="line"></div>
		        <div id="file">
		            <p id="icon"><i class="bi bi-camera">+ <span id="font">게시글수정.jsp</span></i></p>
		        </div>
		        <br>
		        <input type="text" placeholder="게시글 제목을 입력해주세요" size="60">
		        <br><br><hr>
		
		        <textarea  cols="94"rows="17" placeholder="게시글 내용을 입력해주세요" style="resize:none;">
		        </textarea>
    			</div>
			
		</form>
		
	<%@ include file="../common/footer.jsp" %>
</body>
</html>