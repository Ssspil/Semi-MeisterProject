<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer {
        color: black;
        width: 700px;
        margin: auto;
        margin-top: 100px;
        margin-bottom: 150px;
        height: 1000px;
    }
    .statusBtn{
    	float: left;
    	background-color: gray;
    	text-align: center;
    	vertical-align: center;
    	width: 160px;
    	border: none;
    }
</style>
</head>
<body>
	<%@include file="../common/header.jsp" %>
	<div class="outer">
			<br>
			<h2><b>&nbsp;나의 거래 내역</b></h2>
			<br>
			<hr>
			<button class="statusBtn" id="current">&nbsp;진행중인 거래&nbsp;</button>
			<button class="statusBtn" id="done">&nbsp;완료된 거래&nbsp;</button>
			<button class="statusBtn" id="cancel">&nbsp;취소된 거래&nbsp;</button>
			<br>
			<hr>
			
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