<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {
		margin: auto;
	}
	#web-header {
		box-sizing: border-box;
		width: 1000px;
	    height: 20%;
		margin: auto;
		position: relative;
		border: 1px solid red;
		
	}
	#web-body {
	    height: 100%;
		box-sizing: border-box;
		height: 100%;
		width: 900px;
		margin: 0 auto;
		border: 1px solid green;
    }
	.container {
		width: 100%;
		height: 30%;
		box-sizing: border-box;
		display: block;
		margin: auto;
		border: 1px solid dimgray;
	}
	.outer3 {
		box-sizing: border-box;
		border: 1px solid darkblue;
		height: 50%;
	}
	.outer4 {
		margin: 0 auto;
		padding-top: 1.25rem;
		display: block;
		border: 1px solid black;
	}
	#img{
		box-sizing: border-box;
		float: left;
		width: 3rem;
		height: 3rem;
	}
	#btn{
		float: right;
	}
	#p1{
		position: relative;
		top: -20px;
		left: 10px;
	}
	#title{
		box-sizing: border-box;
		height: 20%;
	}
	#content{
		box-sizing: border-box;
		border: 1px solid black;
		width: 100%;
		height: 60%;
		margin: auto;
		padding: 20px;

	}
	#footer1{
		box-sizing: border-box;
		border: 1px solid black;
		width: 100%;
		height: 20%;

	}
</style>
</head>
<body>
	

	<div id="web-header">
	</div>
	<div id="web-body">
		
		<div class="container">
			<h1>제목</h1>
			<div id="title">
			<img src="boardInsertView.jsp" id="img"> 
			<p >홍금마</p>
			<p id="p1">20132399</p>
		
		</div>
		
	</div>
	<div class="outer3">	
			<div id="content">
				<p>동해물과 백두산이 마르고 닳도록</p>
			</div>
			<p>d 4 a 7</p>
		</div>	
		<div id="footer1">
		<input type="text">
	</div>
	</div>
			
	
	
	
</body>
</html>