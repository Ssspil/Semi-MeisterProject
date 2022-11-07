<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매게시판 메인</title>
<style>
	div{
		border: 1px solid chartreuse;
		box-sizing: border-box;
	}
	div>ul {
		list-style-type: none;
		display: inline;
		padding:150px;
		width:300px;
		margin: 100px;
	}




</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	

	<div class="outer" >
		<br>
		<h3>마켓</h3>
		<ul id="menu_interest">
			<li style="font-size: larger;" ><a href=""></a>전체</li>
			<br>
			<li><a href=""></a>영상</li>
			<br>
			<li><a href=""></a>영화</li>
			<br>
			<li><a href=""></a>게임</li>
			<br>
			<li><a href=""></a>IT</li>
			<br>
			<li><a href=""></a>운동</li>
			<br>
			<li><a href=""></a>요리</li>
		</ul>
		<ul id="menu_local">
			<li><a href=""></a>서울</li>
			<br>
			<li><a href=""></a>인천</li>
			<br>
			<li><a href=""></a>부산</li>
			<br>
			<li><a href=""></a>울산</li>
			<br>
			<li><a href=""></a>대전</li>
			<br>
			<li><a href=""></a>광주</li>
			<br>
			<li><a href=""></a>경기</li>
			<br>
			<li><a href=""></a>충북/충남</li>
			<br>
			<li><a href=""></a>전북/전남</li>
			<br>
			<li><a href=""></a>경북/경남</li>
			<br>
			<li><a href=""></a>제주</li>
		</ul>

	
	
	</div>







	<%@ include file="../common/footer.jsp" %>


</body>
</html>