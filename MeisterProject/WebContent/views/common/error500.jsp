<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>500 에러페이지</title>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<br><br><br><br><br><br><br>
	<div class="outer" align="center" style="width : 80%; height : 600px; margin : auto;" >
		<img alt="404" src="<%= contextPath %>/resources/image/500.jpeg" width="500"  height="500">
		<br><br>
		<div>
		오류가 떳습니다!!!
		</div>
		<br>
		<div>
			<a href="<%= contextPath %>" class="btn btn-secondary"> 메인으로 </a>
		</div>
	</div>
	
	
	<%@ include file="./footer.jsp" %>
</body>
</html>