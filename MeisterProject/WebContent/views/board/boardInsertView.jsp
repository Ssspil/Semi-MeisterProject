<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

<style>
	.logo {
		width: 10px;
	}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	
	<div style="padding-top: 120px">
		<div>
			<form action="">
				<div style="display: flex;">
					<h1>게시글 글작성</h1>
					<input type="submit" value="글등록" style="margin-left:850px;">
				</div>
				<div style="background-color: orange; padding: 20px;  display: flex; ">
					<div style="box-sizing: border-box;">
						<img style="margin: 0 auto;" class="logo" src="<%= contextPath %>/resources/image/camera.svg" />
					</div>
				</div>
				<div style="display: flex;">
					<div style="display: flex; ">
						<input type="text" name="title" maxlength="30" placeholder="제목을 입력해주세요.">
					</div>
					<div></div>
					<div>
						<textarea>asd</textarea>
					</div>
				</div>
				
			</form>
		</div>
	</div>
    



	<%@ include file="../common/footer.jsp" %>
</body>
</html>