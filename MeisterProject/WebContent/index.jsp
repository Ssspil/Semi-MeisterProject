<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<style>
.outer{
	margin-top : 100px;
	width : 100%;
	height : 800px;
	background-color:pink;	
}
.outer .slider-area{
	margin-left : auto;
	margin-right : auto;
	width : 80%;
	height : 500px;
	background-color:grey;
	
}
</style>


</head>
<body>
	<%@ include file="/views/common/header.jsp" %>
	<div class="outer">
		<br>
		<div class="slider-area">
			슬라이드 공간
		</div>
		
	</div>

	

	
		
	

	



	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>