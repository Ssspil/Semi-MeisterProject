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
        margin-top: 150px;
        margin-bottom: 100px;
        height: 1000px;
        border: 1px yellow solid;
    }
    #profileImg{
    	width: 250px;
    	height: 60px;
    	margin: auto;
    }
    #profileImg>img{
    	width: 100%;
    	height: 100%;
    }
    .genderBtn{
    	background-color: gray;
    	width: 100px;
    	border-radius:50px / 100px;
    	border: none;
    }
</style>
</head>
<body>
	<%@include file="../common/header.jsp" %>
	<%
		String userId = loginUser.getUserId();
		int userNo = loginUser.getUserNo();
	%>
	
	<form action="<%=contextPath %>/expertSubmit.me" method="post" enctype="multipart/form-data">
		<div class="outer">
			<br>
			<div id="titleImg">
					<img src="<%=contextPath %>/resources/image/logo.png">
			</div>
			<br><br>
			<h4><b>&nbsp;&nbsp;전문가 인증</b></h4> 
			<br><br>
			<input type="hidden" name="userNo" value="<%=userNo %>">
			<input type="hidden" name="userId" value="<%=userId %>">
			<h6><b>&nbsp;&nbsp;* 이름</b></h6> 
			&nbsp;&nbsp;<input type="text" name="userName" size="30" placeholder="이름을 입력해 주세요" maxlength="4" required>
			<br><br>
			<h6><b>&nbsp;&nbsp;* 성별</b></h6> 
			&nbsp;&nbsp;<button type="button" class="genderBtn" id="male">남자</button>
			<button type="button" class="genderBtn" id="female">여자</button>
			<input type="hidden" name="gender" id="gender" required>
			<br><br>
			<h6><b>&nbsp;&nbsp;* 이메일</b></h6> 
			&nbsp;&nbsp;<input type="text" name="emailFront" size="10" maxlength="10" required>
			&nbsp; @ &nbsp;
			<select name="emailBack">
				<option selected>gmail.com</option>
				<option>naver.com</option>
				<option>daum.net</option>
			</select>
			<br><br>
			<h6><b>* 휴대폰 번호 : &nbsp; </b></h6> 
			&nbsp;&nbsp;
			<select>
				<option value="010" selected disabled>010</option>
			</select>
			&nbsp; - &nbsp;
			<input type="text" name="phoneMid" size="4" required>
			&nbsp; - &nbsp;
			<input type="text" name="phoneLast" size="4" required>
			
			<br><br>
			<h6><b>* 전문분야 : &nbsp;</b></h6> 
			&nbsp;&nbsp;
			<select name="speciality" id="speciality">
				<option value="영상">영상</option>
				<option value="영화">영화</option>
				<option value="게임">게임</option>
				<option value="IT">IT</option>
				<option value="운동">운동</option>
				<option value="요리">요리</option>
			</select>
			<br><br>
			<h6><b>&nbsp;첨부파일 : &nbsp;</b></h6>
			&nbsp;&nbsp;
			<input type="file" name="expertFile">
			<br><br><br><br>
			<div style="text-align:center">
				<button type="submit">제출</button>
			</div>
		</div>
	</form>
	<script>
		$(document).ready(function(){
			$(".genderBtn").on('click', function(e){
				if(e.target.id == 'male'){
					$("#male").css("background-color", "yellow");
					$("#female").css("background-color", "gray");
					$("#gender").attr("value", e.target.textContent);
				}
				else{
					$("#female").css("background-color", "yellow");
					$("#male").css("background-color", "gray");
					$("#gender").attr("value", e.target.textContent);
				}
			});
		});
	</script>
	<hr>
	<%@include file="../common/footer.jsp" %>
</body>
</html>