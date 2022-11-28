<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--  google font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet">
</head>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
   
   <style>
.header {
	box-sizing: border-box;
	height: 130px;
}

#main {
	height: 100%;
}

#titleName {
	font-size: 30px;
	position: relative;
	top: 10px;
	left: 36px;
}

#body1 {
	box-sizing: border-box;
	border-bottom: 3px solid black;
	height: 70px;
	margin: auto;
	width: 60%;
}

#contenthead {
	box-sizing: border-box;
	height: 60px;
}

.name1Body {
	box-sizing: border-box;
	border: 0;
	border-radius: 10px;
	height: 210px;
	width: 60%;
	margin: auto;
	padding: 15px;
	margin-bottom: 30px;
	box-shadow: 6px 6px 6px 6px gray;
}

#name1Body:hover {
	background-color: rgb(250, 247, 247);
}

#name2Body:hover {
	background-color: rgb(250, 247, 247);
}

#name2Body {
	box-sizing: border-box;
	border: 3px solid orange;
	border-radius: 30px;
	height: 210px;
	width: 60%;
	margin: auto;
	padding: 15px;
}

#title {
	float: left;
}

#titlepost {
	float: left;
}

#titlepost1 {
	float: left;
	position: relative;
	left: 100px;
	width: 470px;
	display: -webkit-inline-box;
	overflow: hidden;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 1;
}

#body {
	float: left;
}

#bodypost {
	float: left;
}

#bodypost1 {
	float: left;
	position: relative;
	left: 152px;
	width: 470px;
	display: -webkit-inline-box;
	overflow: hidden;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 2;
}

#footer {
	float: left;
	width: 820px;
	position: relative;
	top: -15px;
}

#footerpost {
	float: left;
}

#footerpost1 {
	float: left;
	position: relative;
	left: 100px;
}

#footerpost2 {
	float: right;
}

#page {
	box-sizing: border-box;
	border-bottom: 2px solid black;
	border-top: 2px solid black;
	width: 60%;
	margin: auto;
	height: 50px;
}

.star {
	position: relative;
	font-size: 1rem;
	color: #ddd;
}

.star input {
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	opacity: 0;
	cursor: pointer;
}

.star span {
	width: 0;
	position: absolute;
	left: 0;
	color: yellow;
	overflow: hidden;
	pointer-events: none;
}

.btn {
	position: absolute;
	right: 330px;
}

.btn1 {
	background-color: white;
	width: 60px;
	height: 45px;
	color: gray;
	outline-color: rgb(248, 162, 3);
	border: solid;
	border-radius: 12px;
}

.btn1:hover {
	border: 0;
	outline: none;
	background-color: lightgray;
	color: white;
}

.name1Body:hover {
	border-color: orange;
}
</style>
</head>
<body>

<%@include file="../common/header.jsp" %>
  <div class="header"></div>
    <div id=main>
   

        <div id="body1">
          <span id="titleName">내가 쓴 리뷰</span>

        </div>
        <div id="contenthead"></div>
        
        <div id="nameBody_1">
        <div class="name1Body">
			
			<div id="title"> 
                <div id="titlepost" style="font-weight:bold;">판매 게시글 제목</div> 
                <div id="titlepost1">게시글 제목이 들어가야합니다</div>
                <div class="btn">
                	<button class="btn1">수정</button>
                	<button class="btn1">삭제</button>
                </div>
            </div>
            <br><br>
            <div id="body">
                <div id="bodypost" style="font-weight:bold;">리뷰 내용</div>
                <div id="bodypost1">리뷰내용 들어가야합니다</div>
            </div>
            <br><br><br><br><br>
            <div id="footer">
                <div id="footerpost" style="font-weight:bold;">판매글 작성 날짜</div>
                <div id="footerpost1">날짜 들어가합니다</div>
				<div id="footerpost2">
					<span class="star"> ★★★★★ <span>★★★★★</span> 
					<input type="range" oninput="drawStar(event)" value="1" step="1" min="0"max="10">
					</span>
				</div>
			</div>
       		<br>
        </div>
	   </div>
	   <br><br>
	           <div id="nameBody_1">
        <div class="name1Body">
			
			<div id="title"> 
                <div id="titlepost" style="font-weight:bold;">판매 게시글 제목</div> 
                <div id="titlepost1">게시글 제목이 들어가야합니다</div>
                <div class="btn">
                	<button class="btn1">수정</button>
                	<button class="btn1">삭제</button>
                </div>
            </div>
            <br><br>
            <div id="body">
                <div id="bodypost" style="font-weight:bold;">리뷰 내용</div>
                <div id="bodypost1">리뷰내용 들어가야합니다</div>
            </div>
            <br><br><br><br><br>
            <div id="footer">
                <div id="footerpost" style="font-weight:bold;">판매글 작성 날짜</div>
                <div id="footerpost1">날짜 들어가합니다</div>
				<div id="footerpost2">
					<span class="star"> ★★★★★ <span>★★★★★</span> 
					<input type="range" oninput="drawStar(event)" value="1" step="1" min="0"max="10">
					</span>
				</div>
			</div>
       		<br>
        </div>
	   </div>
	   <div id="page">
<!-- 	   페이징 처리 -->
	   </div>

</div>

<%@ include file="../common/footer.jsp"%>


	<script>
		 var drawStar = (event) => {
			 console.log(event.target.value)
			  document.querySelector(".star span").style.width = event.target.value * 10 +"%"; // `${target.value * 10}%`jsp안에선 사용불가.
			}
    </script>
</body>
</html>