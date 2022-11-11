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
		String userName = " ";
		if(userName != null){
			userName = loginUser.getUserName();
		}
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
		String expert = loginUser.getExpert();
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
			$('#textInterest').val($('#interest').val());
		});
		
		$(function phoneSelect(){
			let value = "<%=phoneMid%>";
			if(value == ""){
				$("#phoneFront").val('').prop("selected", true);
			}
			else{
				$("#phoneFront").val('010').prop("selected", true);
			}
			$('#phoneFront').attr("disabled", true);
		});
		
		$ (function selectEmailLast(){
			let value = "<%=emailLast%>";
			
 			if (value == 'google.com' || value == 'naver.com' || value == 'daum.net'){
 				$('#emailSelect').val(value).prop("selected", true);
				$('#textEmail').val($('#emailSelect').val());
 			}
 			else{
 				if(value == ""){
 					$("#emailSelect").val('').prop("selected", true);
 					$('#textEmail').attr("disabled", true);
 				}
 				else{
	 				$("#emailSelect").val('other').prop("selected", true);
	 				$('#textEmail').val("<%=emailLast%>").val();
	 				$('#textEmail').attr("disabled", false);	
 				}
 			}
		});
		
		$(function(){			
			$('#fileUploadBtn').click(function(e){
				e.preventDefault();
				$('#profile').click();
			});
		});
		
		function loadImg(inputFile) {
			let reader = new FileReader();
			reader.readAsDataURL(inputFile.files[0]);
			reader.onload = function(e){
				$("#titleImage").attr("src", e.target.result);
			}
		}
		
		$(function(){
			$('#emailSelect').change(function(){
				if ($('#emailSelect').val() == 'other') {
	                $('#textEmail').attr("disabled", false);
	                $('#textEmail').val("");
	                $('#textEmail').focus();
	            } else {
	                $('#textEmail').val($('#emailSelect').val());
	            }
			})
		});
		
		$(function(){
			$('#interest').change(function(){
				$('#textInterest').val($('#interest').val());
			})
		});
		
		$(function(){
			if("<%=expert%>" == 'N'){
				$('#emailFront').attr("disabled", true);
				$('#userName').attr("disabled", true);
				$('#phoneMid').attr("disabled", true);
				$('#phoneLast').attr("disabled", true);
				$('#emailSelect').attr("disabled", true);
			}
		});
		
		function submitCheck(e) {
       		if($('#emailSelect').is(":disabled") == true){
       			return true;
       		}
       		
       		if($('#textEmail').val() == ""){
       			event.preventDefault();
       			alert("이메일을 끝까지 입력해주세요");
       			$('#textEmail').focus();
       			
       			return false;
       		}
       		if($('#phoneMid').val() == ""){
       			event.preventDefault();
       			alert("전화번호를 끝까지 입력해주세요");
       			$('#phoneMid').focus();
       			
       			return false;
       		}
       		
       		if($('#phoneLast').val() == ""){
       			event.preventDefault();
       			alert("전화번호를 끝까지 입력해주세요");
       			$('#phoneLast').focus();
       			
       			return false;
       		}
       		
       		
       		else{
       			return true;
       		}
    	}
	</script>
	<form action="<%=contextPath %>/update.me" method="post" onsubmit="submitCheck();">	
		<div class="outer">
			<br>
			<h2><b>&nbsp;개인정보 변경</b></h2>
			<br>
			<hr>
			<h5><b>&nbsp;프로필 변경</b></h5>
			<hr>
			<div id="profileImg">
				<img id="titleImage" alt="프로필">
				<input type="file" id="profile" name="profileImg" style="display:none" onchange="loadImg(this);" accept="img/jpeg, img/png">
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
			<input type="text" name="userName" id="userName" value="<%=userName %>" size="50">
			<br><br>
			휴대폰 번호 : &nbsp;
			<select id="phoneFront">
				<option value=""></option>
				<option value="010">010</option>
			</select>
			&nbsp; - &nbsp;
			<input type="text" name="phoneMid" id="phoneMid" value="<%=phoneMid%>" size="4">
			&nbsp; - &nbsp;
			<input type="text" name="phoneLast" id="phoneLast" value="<%=phoneLast%>" size="4">
			<br><br>
			이메일 : &nbsp;
			<input type="text" name="emailFront" id="emailFront" value="<%=emailFront %>" size="15">
			&nbsp; @ &nbsp;
			<input id="textEmail" name="emailBackOther" placeholder="이메일을 선택하세요." disabled> 
			<select id="emailSelect" name="emailBack">
				<option value="" selected>선택</option>
				<option value="google.com">gmail.com</option>
				<option value="naver.com">naver.com</option>
				<option value="daum.net">daum.net</option>
				<option value="other">직접 입력하기</option>
			</select>
			<br><br>
			관심분야 : &nbsp;
			<input id="textInterest" disabled>
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