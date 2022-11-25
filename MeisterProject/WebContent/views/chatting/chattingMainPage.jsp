<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 문의 하기</title>
<script>
.outer {
    width: 60%;
    margin: auto;
    margin-top: 100px;
    margin-bottom: 150px;
    height: 1000px;
}
#good{
    height: 50px;
}
#line{
    border: 3px solid lightgray;
    background-color: lightgray;  
}
#head{
box-sizing: border-box;
border: 3px solid black;
border-radius: 30px;
height:190px;
width: 740px;
padding: 20px;
margin-bottom:30px;
}
#content{
font-family: 'Nanum Gothic', sans-serif;
width: 650px;
overflow: hidden;
display: -webkit-inline-box;
-webkit-box-orient: vertical;
-webkit-line-clamp: 3;
}
#date{
float: right;
font-family: 'Nanum Gothic', sans-serif;
font-weight: bold;
position: relative;
top: 15px;
color:lightgray
}
#page{
box-sizing: border-box;
border-bottom: 2px solid black;
border-top: 2px solid black;
margin: auto;
height: 50px;

</script>
</head>
<body>
<div class="outer">
		<br>
		<h1><span id="titleName">판매자 문의하기</span></h1>
		<br>
        <div id="line"></div>
        <div id="good"></div>
        <div id="head">
            <div id="title">판매자 닉네임</div>
            <br>
            <div id="content">문의내용문의내용문의내용문의내용문의내용문의내용문의내용문의내용문의내용문의내용문의내용문의내용문의내용문의내용문의내용문의내용문의내용문의내용문의내용문의내용문의내용문의내용문의내용문의내용문의내용문의내용문의내용문의내용문의내용문의내용문의내용문의내용문의내용문의내용문의내용문의내용</div>
            <div id="date">2시간전</div>
        </div>
        <div id="page">
            페이징 처리 공간
        </div>

	</div>

</body>
</html>