<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매게시판 메인</title>
<style>
	.outer{
		margin:150px 0px 0px 50px;
	}
	div>ul {
		list-style-type: none;
		margin:0px 0px 0px 50px;
		padding-bottom: 16px;
	}
	div>ul>li {
		
	}
	h3{
		border-bottom: 5px solid rgb(255, 212, 0);
	    padding-bottom: 16px;
	    margin-bottom: 8px;
	}
	




</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	

	<div class="outer" >
		
		<h3>마켓</h3>
		<ul id="menu_interest">
			<li style="font-size: larger;" ><a href=""></a>전체</li>
			
			<li><a href=""></a>영상</li>
			
			<li><a href=""></a>영화</li>
			
			<li><a href=""></a>게임</li>
			
			<li><a href=""></a>IT</li>
			
			<li><a href=""></a>운동</li>
			
			<li><a href=""></a>요리</li>
		</ul>
		<ul id="menu_local">
			<li><a href=""></a>서울</li>
			
			<li><a href=""></a>인천</li>
			
			<li><a href=""></a>부산</li>
			
			<li><a href=""></a>울산</li>
			
			<li><a href=""></a>대전</li>
			
			<li><a href=""></a>광주</li>
			
			<li><a href=""></a>경기</li>
			
			<li><a href=""></a>충북/충남</li>
			
			<li><a href=""></a>전북/전남</li>
			
			<li><a href=""></a>경북/경남</li>
			
			<li><a href=""></a>제주</li>
		</ul>

	
	
	</div>







	<%@ include file="../common/footer.jsp" %>


</body>
</html>