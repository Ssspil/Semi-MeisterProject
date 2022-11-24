<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 거래 내역</title>
<!-- 여기는 진행중인 거래페이지입니다 -->
<!--  google font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet">
</head>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
   
   <style>
   .header{
    box-sizing: border-box;
    height: 130px;
}
#main{

height:100%;

}
#titlename{
    position: relative;
    left: 295px;
    height: 80px;
}
#body1{
    box-sizing: border-box;
    border-top: 2px solid orange;
    border-bottom: 2px solid orange;
    height: 70px;
    margin: auto;
    width: 60%;
}

#contenthead{
    box-sizing: border-box;
    height: 60px;
}
.name1Body{
    box-sizing: border-box;
    border: 3px solid black;
    height:271px;
    width: 60%;
    margin: auto;
    padding: 15px;
    margin-bottom:30px;
    border-radius: 15px;
}
#name1Body:hover{
background-color:rgb(250, 247, 247);     
}

.statusBtn{
    box-sizing: border-box;
    height: 66px;
    width: 294px;
    float: left;
    background-color: white;
    border: 3px solid black;
    border-radius: 15px;
    font-size: 17px;
    font-family: 'Nanum Gothic', sans-serif;
    font-weight: bold; 
}
.statusBtn:hover{
    background-color:rgb(255, 200, 98);
    color: white;
}

#title{
float: left;
font-family: 'Nanum Gothic', sans-serif;
}
#img{
    width: 200px;
    height:170px;
    float: left;
    margin-right: 30px;
}
#title1{
margin-left:60px;
font-weight: bold;
font-family: 'Nanum Gothic', sans-serif;
}
#title2{
position: relative;
font-weight: bold;
left: 240px;
font-family: 'Nanum Gothic', sans-serif;
}
#price{
    float: right;
    margin-right: 30px;
    font-weight: bold;
    position: relative;
    top:15px;
    font-family: 'Nanum Gothic', sans-serif;
}
#btn1,#btn2,#btn3{
    float: right;
    margin-right: 30px;
    position: relative;
    top:35px;
    background-color: orange;
    border: 1px solid orange;
    border-radius: 5px;
    width: 90px;
    height: 30px;
    font-family: 'Nanum Gothic', sans-serif;
}
#content{
    width: 450px;
    height: 47px;
    overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-inline-box;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 2;
	 font-family: 'Nanum Gothic', sans-serif;
     position: relative;
     top:12px;
}
#category{
    color:lightgray;
    font-family: 'Nanum Gothic', sans-serif;
}
#page{
box-sizing: border-box;
border-bottom: 2px solid black;
border-top: 2px solid black;
width: 60%;
margin: auto;
height: 50px;
}

</style>
</head>
<body>

<%@include file="../common/header.jsp" %>
  <div class="header"></div>
    <div id=main>
    <h1 id="titlename">나의 거래 내역</h1>

        <div id="body1">
            <div>
            <button class="statusBtn" id="current">진행중인 거래</button>
        </div>
        <div>
            <button class="statusBtn" id="done">완료된 거래</button>
        </div>
        <div>
            <button class="statusBtn" id="cancle">취소된 거래</button>
        </div>

        </div>
        <div id="contenthead"></div>
        
        <div id="nameBody_1">
       
					
				
						
        <div class="name1Body">
            <div id="title">
                <span id="title1">거래 상태</span>
                <span id="title2">재능 판매글 제목</span>
            </div>
            <br><br>
			<img src="resources/image/peng.jpg" id="img">
            <span id="category">카테고리</span>
            <br>
			<span id="content">판매글 판매글판매글 내용판매글 내용판매글 내용판매글 내용 내용판매글 내용판매글 내용판매글 내용판매글 내용판매글 내용판매글 내용판매글 내용내용</span>
            <br><br>
            <span id="price">300.000원</span>
            <br>
            <button id="btn1" >구매취소</button>
            <button id="btn2" >판매자문의</button>
            <button id="btn3" >작업완료</button>
        </div>
     
	   
	   </div>
	   
	   <div id="page">
	   
	   </div>

       
         


</div>


		<script>
		$(document).ready(function(){
			$(".statusBtn").on('click', function(e){
				if(e.target.id == 'current'){
					$("#current").css("background-color", "orange");
					$("#done").css("background-color", "gray");
					$("#cancel").css("background-color", "gray");
				}
				else if(e.target.id == 'done'){
					$("#current").css("background-color", "gray");
					$("#done").css("background-color", "orange");
					$("#cancel").css("background-color", "gray");
				}
				else{
					$("#current").css("background-color", "gray");
					$("#done").css("background-color", "gray");
					$("#cancel").css("background-color", "orange");
				}
			});
		});
	</script>
	<%@include file="../common/footer.jsp" %>
</body>
</html>