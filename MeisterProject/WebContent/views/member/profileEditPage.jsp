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
    	margin-bottom: 10px;
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
		String userId = loginUser.getUserId();
		String userName = loginUser.getUserName();
		String nickname = loginUser.getNickName();
		String phone = loginUser.getPhone();
		String phoneMid = "";
		String phoneLast = "";
		if(phone != null){
			phoneMid = phone.substring(3,7);
			phoneLast = phone.substring(7);
		}
		String email = loginUser.getEmail();
		String emailFront = "";
		String emailLast = "";
		
		if(phone != null){
			int idx = email.indexOf("@");
			emailFront = email.substring(0, idx);
			emailLast = email.substring(idx+1);
		}
		
		String interests = loginUser.getInterest() == null? "" : loginUser.getInterest();
	%>
	
	<script>
		$ (function selectInterest(){
			$("#interest").val("<%=interests%>").prop("selected", true);
		});
	</script>
	
	<script>
		$(function(){			
			$('#fileUploadBtn').click(function(e){
				e.preventDefault();
				$('#profile').click();
			});
		});
		
        function changeValue(obj){
	        alert(obj.value);
        }
	</script>
	<script>
		function imgPreview(){
	        var preview = new FileReader();
	        preview.onload = function (e) {
	        	document.getElementById("profileImg").src = e.target.result;
			};
			preview.readAsDataURL(document.getElementById("profile").files[0]);
		}
	</script>
	<form action="<%=contextPath %>/update.me" method="post">	
		<div class="outer">
			<br>
			<h2><b>&nbsp;개인정보 변경</b></h2>
			<br>
			<hr>
			<h5><b>&nbsp;프로필 변경</b></h5>
			<hr>
			<div id="profileImg">
				<img id="profileImg" src="" alt="프로필">
				<input type="file" id="profile" name="profileImg" style="display:none" onchange="imgPreview();" accept="img/jpeg, img/png">
				<button id="fileUploadBtn" type="button">프로필변경</button>
			</div>
			<br><br>
			<input type="hidden" name="userId" value="<%=userId %>">
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
			<input type="text" name="emailFront" value="<%=emailFront %>" size="15">
			&nbsp; @ &nbsp;
			<select name="emailBack">
				<option selected>gmail.com</option>
				<option>naver.com</option>
				<option>daum.net</option>
			</select>
			<br><br>
			관심분야 : &nbsp;
			<select id="interest" name="interests">
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