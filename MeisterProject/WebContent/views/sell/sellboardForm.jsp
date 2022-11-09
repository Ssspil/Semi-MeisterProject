<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매게시판 메인</title>
<style>
	div{
		/*border: 1px solid chartreuse;*/
		box-sizing: border-box;
	}
	.outer{
		width: 1200px;
        height: 600px;
		margin:150px 0px 0px 50px;
	}
	.category{
		width: 10%;
        height: 350px;
		float:left;
	}
	.category2{
		width: 10%;
        height:350px;
		margin-top: 40px;
		float:left;
	}
	.thumbnail{
		width:80%;
		height: 650px;
		float:left;
		/*border: 1px solid chartreuse;*/
	}
	
	/*맨 위 마켓*/
	h3{
		border-bottom: 5px solid rgb(255, 212, 0);
	    padding-bottom: 16px;
	    margin-bottom: 8px;
		font-family: 'Nanum Gothic';
	}

	/*카테고리 메뉴바*/
	#menu_interest, #menu_local{
		/*border: 1px solid blue;*/
		list-style-type: none; /*ui리스트 불릿기호 사라짐*/
		margin-left: 2px; /*ul요소는 기본적으로 위,아래 margin이 존재 
					ul요소에 padding도 존재함
					모든 요소가 왼쪽에 달라 붙을 것*/
		height: 100%;
		padding: 2px;
		font-family: 'Nanum Gothic';
	}
	

	#menu_interest a, #menu_local a{ 
		/*  border: 1px solid darkorange;*/
		text-decoration: none;
		color:rgb(44, 77, 167);
		font-size: 15px;
		font-weight: 700;
		width: 100%;
		height: 100%;
		/*a태그는 인라인요소이기 때문에 width, height속성이 적용되지 않아서 블럭요소로 변경해야 한다.*/
		
		display: block; 
		width: 90px;
		height: 35px;
		line-height: 35px;
	}
	#menu_interest> li {
		/*border:1px solid brown;*/
	}
	#menu_interest a:hover{
		font-size: 20px;
		color: rgb(248, 162, 3);
	}
	#menu_local a:hover{
		font-size: 18px;
		background-color: rgba(247, 123, 14, 0.77);
	}

	#menu_interest{
		
		position: relative;
		text-align: center;
	}
	#menu_local{
		text-align: center;
	}
	
	ul[class = menu_local]{
		list-style-type: none;/*불릿기호 없앰*/
		display: none;/*요소들이 존재는 하지만 호버 전에는 보이지 않게 감춰둠*/
	}

	/*부 메뉴 숨겨놓기*/
	#menu_interest #menu_local{
		display: none;
		position: absolute;
	}

	/*호버시 부메뉴 표시*/
	#menu_interest li:hover > ul{
		display:block;
	}
	

	

	/*썸네일 관련*/
	.thumbnail{
		line-height: 100px;
	}	
	.thumbnail a{
		text-decoration: none;
	}
	#box1>div{
		float: left;
		width: 300px;
		height: 300px;
		font-size: 20px;
		line-height: 100px;
		text-align: center;
	}
	#box2>div{
		float: left;
		width: 300px;
		height: 300px;
		font-size: 20px;
		line-height: 100px;
		text-align: center;
	}

	/*글등록 버튼*/
	#enroll{
		width: 100px;
		height: 45px;
		font-size: 15px;
		font-weight: 900;
		background-color: white;
		color: orange;
		outline-color: rgb(248, 162, 3);
		border: solid;
		border-radius: 12px;
		font-family: 'Nanum Gothic';
		margin-left:850px;

	}#enroll:hover{
		background-color: orange;
		color:white;
	}

	
	
	



	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	
<form id="sellboard-form" action="<%=contextPath %>/market.se" method="post">
	<div class="outer" >
		
		<h3>마켓</h3>
		<div class="category">
			<ul id="menu_interest">
				<li><a href="">전체</a></li>
				
				<li>
					<a href="">영상</a>
					<ul class="menu_local">
						<li><a href="">서울</a></li>
						<li><a href="">인천</a></li>			
					</ul>
				</li>
				
				<li>
					<a href="">영화</a>
					<ul class="menu_local">		
						<li><a href="">부산</a></li>			
						<li><a href="">울산</a></li>	
					</ul>		
				<li>
					<a href="">게임</a>
					<ul class="menu_local">			
						<li><a href="">대전</a></li>			
						<li><a href="">광주</a></li>			
					</ul>
				</li>
				
				<li>
					<a href="">IT</a>
					<ul class="menu_local">		
						<li><a href="">경기</a></li>			
						<li><a href="">충북/충남</a></li>			
					</ul>
				</li>
				
				<li>
					<a href="">운동</a>
					<ul class="menu_local">		
						<li><a href="">전북/전남</a></li>			
						<li><a href="">경북/경남</a></li>			
					</ul>
				</li>
				
				<li>
					<a href="">요리</a>
					<ul class="menu_local">
						<li><a href="">제주</a></li>
					</ul>
				</li>
			</ul>
		</div>
		<div class="category2">
			<ul id="menu_local">
				<li><a href="">서울</a></li>
				<li><a href="">인천</a></li>
				<li><a href="">부산</a></li>
				<li><a href="">울산</a></li>
				<li><a href="">대전</a></li>
				<li><a href="">광주</a></li>
				<li><a href="">경기</a></li>
				<li><a href="">충북/충남</a></li>
				<li><a href="">전북/전남</a></li>
				<li><a href="">경북/경남</a></li>
				<li><a href="">제주</a></li>
			</ul>
		</div>
	<br>
		<div><button type="submit" id="enroll">글 등록</button></div>
	<br>
		<div class="thumbnail">
			<div div id="box1">
				<div class="thumb1" src="" ><a href="">썸네일1</a></div> 
				<div class="thumb1" src="" ><a href="">썸네일2</a></div>	
				<div class="thumb1" src="" ><a href="">썸네일3</a></div>
			</div>
			<div id="box2">
				<div class="thumb1" src="" ><a href="">썸네일4</a></div>
				<div class="thumb1" src="" ><a href="">썸네일5</a></div>
				<div class="thumb1" src="" ><a href="">썸네일6</a></div>
			</div>
			
		</div>
	</div>
</form>

<script>
	// $(document).on('mouseover', '.category li', function () {
	// 	$('.menu_local').slideDown(1000);
	// 	});

	// 	$(document).on('mouseover', 'div', function () {
	// 		if (!$(this).hasClass('category')) {
	// 			$('.menu_local').slideUp(1000);
	// 	}
	// });



</script>

	<%@ include file="../common/footer.jsp" %>


</body>
</html>