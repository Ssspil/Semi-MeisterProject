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
    #profileImg{
    	width: 100px;
    	height: 100px;
    	margin: auto;
    	border: 1px gray solid; 
    	border-radius:100px / 100px;
    }
    #profileImg>img{
    	width: 100%;
    	height: 100%;
    	object-fit:cover;
    	border-radius:100px / 100px;
    }
    input{
    	border: 1px solid gray;
    	border-radius:50px / 100px;
    	line-height:50px;
    }
</style>
</head>
<body>
	<%@include file="../common/header.jsp" %>
	
	<%
		String userName = loginUser.getUserName();
		String email = loginUser.getEmail() == null? "" : loginUser.getEmail();
		String nickname = loginUser.getNickName();
		String phone = loginUser.getPhone();
		String phoneMid = "";
		String phoneLast = "";
		if(phone != null){
			phoneMid = phone.substring(3,7);
			phoneLast = phone.substring(7);
		}
		String interests = loginUser.getInterest() == null? "" : loginUser.getInterest();
	%>
	
	<script>
		$ (function selectInterest(){
			$("#interest").val("<%=interests%>").prop("selected", true);
		})
	</script>
	<form action="<%=contextPath %>/update.me" method="post">	
		<div class="outer">
			<br>
			<h2><b>&nbsp;개인정보 수정</b></h2>
			<br>
			<hr>
			<h5><b>&nbsp;프로필 변경</b></h5>
			<hr>
			<br>
			<div id="profileImg">
				<img src="<%=contextPath %>/resources/image/logo.png">
			</div>
			<br>
			<h6><b>닉네임</b></h6> 
			<input type="text" name="nickName" value="<%=nickname %>" size="80">
			<br>
			<hr>
			<h5><b>&nbsp;개인정보 변경</b></h5>
			<hr>
			<br>
			이름 : &nbsp;&nbsp;&nbsp;
			<input type="text" name="userName" value="<%=userName %>" size="50">
			<br><br>
			휴대폰 번호 : &nbsp;
			<select>
				<option value="010" selected disabled>010</option>
			</select>
			&nbsp; - &nbsp;
			<input type="text" name="phoneMid" value="<%=phoneMid%>" size="4">
			&nbsp; - &nbsp;
			<input type="text" name="phoneLast" value="<%=phoneLast%>" size="4">
			<br><br>
			이메일 : &nbsp;
			<input type="text" name="email" value="<%=email %>" size="50">
			<br><br>
			관심분야 : &nbsp;
			<select id="interest" name="interest">
				<option value="영상">영상</option>
				<option value="영화">영화</option>
				<option value="게임">게임</option>
				<option value="IT">IT</option>
				<option value="운동">운동</option>
				<option value="요리">요리</option>
			</select>
			<br><br>
			<div style="text-align:center;">
				<button type="submit">변경</button>
			</div>
			<hr>
			<h5><b><a href="<%=contextPath %>/??" style="text-decoration:none; color:black; line-height:40px">&nbsp;비밀번호 변경</a></b></h5>
			<hr>
			<h5><b><a href="<%=contextPath %>/??" style="text-decoration:none; color:red; line-height:40px">&nbsp;회원탈퇴</a></b></h5>
		</div>
	</form>
	<hr>
	<%@include file="../common/footer.jsp" %>
</body>
</html>