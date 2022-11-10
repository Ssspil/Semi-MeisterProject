<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

<style>
	#header {
		padding:110px 0 0 0;
		margin: 0 auto;
	}
	
	#header2 {
		width: 100%;
   		padding-right: 10px;
    	padding-left: 10px;
    	margin-right: auto;
    	margin-left: auto;
	}
	
	#title {
		height: 5rem;
		padding: 16px 16px;
	
	}
	
	.title {
		display: flex;
	    align-items: center;
	    justify-content: space-between;
	    width: 60.625rem;
	    height: 100%;
	    margin: auto;
	}
	
	.qwe {
		height: 5rem;
		padding: 16px 16px;
		justify-content: space-between;
/* 		display: flex; */
/* 		align-items: center; */
/* 		justify-content: center; */
/* 	    height: 4rem; */
/* 	    padding: 1rem 1.25rem; */
/* 	    background-color: #fafafa; */
/* 	    margin: 0 -1rem; */
/* 	    border-top: 1px solid #f4f4f4; */
/* 	    border-bottom: 1px solid #f4f4f4; */
	}
	
	.qwr {
		display: flex;
	    align-items: center;
	    justify-content: space-between;
	    width: 60.625rem;
	    height: 100%;
	    
/* 		display: flex; */
/*     	margin: auto; */
/*     	width: 900px; */
/*     	justify-content: space-between; */
	}
	
	
	.logo {
		width: 2rem;
    	height: 2rem;
    	
    	
    	
	}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	
	<div id="header">
		<div id="header2">
			<div id="title">
				<div class="title">
					<span>게시글 글작성</span>
					<input type="submit" value="글등록">
				</div>
				
			</div>
			<div class="qwe">
				<div class="qwr">
					<img class="logo" src="<%= contextPath %>/resources/image/camera.svg" />
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
		</div>
	</div>
    



	<%@ include file="../common/footer.jsp" %>
</body>
</html>