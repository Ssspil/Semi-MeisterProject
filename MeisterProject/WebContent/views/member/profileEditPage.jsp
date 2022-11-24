<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="com.kh.member.model.vo.Member, com.kh.common.model.vo.*"%>
<%
	Member m = (Member) request.getAttribute("b");

	Attachment at = (Attachment) request.getAttribute("at");
	
	if(at == null){
		at = new Attachment();
	}
%>
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
    #ex1{
    	width:700px;
    	height:350px;
    }
    #ex2{
    	width:700px;
    	height:350px;
    }
    #warning{
    	line-height: 40px;
    }
    #newPwd>input{
    	margin-top: 30px;
    	margin-left: 15px;
    	float: left;
    }
    #newPwdText{
    	border: none;
    	background-color: inherit;
    }
    #oldPwd>input{
    	margin-top: 30px;
    	margin-left: 15px;
    	float: left;
    }
    #oldPwdText{
    	border: none;
    	background-color: inherit;
    }
    #newPwd2>input{
    	margin-top: 30px;
    	margin-bottom: 50px;
    	margin-left: 15px;
    	float: left;
    }
    #newPwdText2{
    	border: none;
    	background-color: inherit;
    }
    #btnChange{
    	width:450px;
    	height:30px;
    	text-align: center;
    }
    #btnC{
    	width:100px;
    	height:30px;
    	background-color: inherit;
    	border: 1px solid black;
    }
    #pwd>input{
    	margin-top: 5px;
    	margin-left: 15px;
    	float: left;
    }
    #pwdText{
    	border: none;
    	background-color: inherit;
    }
    h6{
    	margin-left: 18px;
    }
    #btnDelete{
    	width:100px;
    	height:30px;
    	background-color: inherit;
    	margin-left: 150px;
    	margin-top: 20px;
    	border: 1px solid black;
    }
</style>
</head>
<body>
	<%@include file="../common/header.jsp" %>
	
	<%
		int userNo = loginUser.getUserNo();
		String userId = loginUser.getUserId();
		String password = loginUser.getUserPwd();
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
       		
       		if($("#chkNick").attr("color") != "darkslateblue" && $("#chkNick").html() != ""){
       			event.preventDefault();
       			alert("닉네임을 올바르게 입력해주세요");
       			$('#chkNick').focus();
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
	    function nicknameCheck() {
	    	let regExp = /^[가-힣]+$/gmi;
	    	let nickname = $("#nickname").val();
	    	let tet = $("#chkNick");
	    
	    	if(!regExp.test(nickname)) {
	    		$(tet).html("닉네임은 한글로 입력하세요");
	    		$(tet).attr("color", "orange");
	    		return false;
	    	} 
	    	
    		if($("#nickname").val().length < 2 || $("#nickname").val().length > 6) {
	        	$(tet).html("닉네임은 2 ~ 6자 이내로 입력하세요.");
	        	$(tet).attr("color", "green");
	        	return false;
	        }
	    	
	    	$.ajax({
	    		url : "check.me",
	    		method : "post",
	    		data : {checkData : nickname, type : "nickname"},
	    		success : function(result) {
	    			console.log(result);
	    			if(result == "NNNNN") {
	    				$(tet).html("사용중인 닉네임 입니다. 다른 닉네임을 입력해주세요.");
	    				$(tet).attr("color", "red");
	    				
	    			} 

	    			else {
	    				$(tet).html("사용 가능한 닉네임 입니다.");
	    				$(tet).attr("color", "darkslateblue");
	    				
	    			}
	    		},
	    		error : function() {
	    			console.log("닉네임 중복체크용 ajax통신 실패");
	    		}
	    	})
	    }
	    function show() {
		      $("#ex1").modal({
		        fadeDuration: 1000,
		        fadeDelay: 0.25,
		      });
		}
	    function show2() {
		      $("#ex2").modal({
		        fadeDuration: 1000,
		        fadeDelay: 0.25,
		      });
		}
	    
		$(function(){	
			$("#oldPwd").keyup(function(){
				if($("#oldPwdInput").val() != "<%=password%>"){
					$("#oldPwdInput").css({"border": "2px solid crimson"});
				}
				else{
					$("#oldPwdInput").css({"border": "2px solid green"});
				}
			});
			
			$("#newPwd2").keyup(function(){
				let regExp = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
				if($("#newPwdInput").val() != $("#newPwdInput2").val()){
					console.log("Diff");
					$("#newPwdInput2").css({"border": "2px solid crimson"});
				}
				else{
					if(!regExp.test($("#newPwdInput").val())) {
					    console.log("Reg");
					    $("#newPwdInput").css({"border": "2px solid crimson"});
					}
					else{
					    console.log("Corr");
						$("#newPwdInput").css({"border": "2px solid green"});
						$("#newPwdInput2").css({"border": "2px solid green"});
					}
				}
			});
		});
		
		function submitPwdCheck(e) {  
			if($("#oldPwdInput").val() != "<%=password%>"){
				event.preventDefault();
       			alert("현재 비밀번호가 일치하지 않습니다");
       			$('#oldPwdInput').focus();
       			return false;
			}
			
			if($("#oldPwdInput").val() == $("#newPwdInput").val()){
       			event.preventDefault();
       			alert("비밀번호를 다르게 입력해주세요");
       			$('#newPwdInput2').focus();
       			return false;
       		} 
			
       		if($("#newPwdInput").val() != $("#newPwdInput2").val()){
       			event.preventDefault();
       			alert("두 비밀번호가 다릅니다");
       			$('#newPwdInput2').focus();
       			return false;
       		}       		
       		
       		if(!regExp.test($("#newPwdInput").val())){
       			event.preventDefault();
       			alert("비밀번호의 형식이 잘못되었습니다");
       			$('#newPwdInput').focus();
       		}    
       		else{
       			return true;
       		}
    	}
	</script>
	<form action="<%=contextPath %>/update.me" method="post" onsubmit="submitCheck();" enctype="multipart/form-data">
		<div class="outer">
			<br>
			<h2><b>&nbsp;개인정보 변경</b></h2>
			<br>
			<hr>
			<h5><b>&nbsp;프로필 변경</b></h5>
			<hr>
			<div id="profileImg">
				<img id="titleImage" src="<%=contextPath %>/<%=at.getFilePath() %>/<%=at.getChangeName() %>" alt="프로필">
				<input type="file" id="profile" name="profileImg" style="display:none" onchange="loadImg(this);" accept="img/jpeg, img/png">
				<br><br>
				<button id="fileUploadBtn" type="button">프로필변경</button>
			</div>
			<br><br>
			<input type="hidden" name="userNo" value="<%=userNo %>">
			<input type="hidden" name="userId" value="<%=userId %>">
			<h6><b>닉네임</b></h6> 
			<input type="text" id="nickname" name="nickName" maxlength="5" value="<%=nickname %>" size="80" onkeyup="nicknameCheck();">
			<br>
			<font id="chkNick" size="3"></font>
			<br><br>
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
				<option value="10">영상</option>
				<option value="20">영화</option>
				<option value="30">게임</option>
				<option value="40">IT</option>
				<option value="50">운동</option>
				<option value="60">요리</option>
			</select>
			<br><br>
			<div style="text-align:center;">
				<button type="submit">변경</button>
			</div>
			<hr>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
			<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
			
			<h5><b><a href="javascript:show()" style="text-decoration:none; color:black; line-height:40px">&nbsp;비밀번호 변경</a></b></h5>
			<hr>
			<h5><b><a href="javascript:show2()" style="text-decoration:none; color:red; line-height:40px">&nbsp;회원탈퇴</a></b></h5>
		</div>
	</form>
	<div id="ex1" class="modal">
		<h3>비밀번호 변경</h3>
		<hr>
		<form action="<%=contextPath %>/pwdChange.me" method="post" onsubmit="submitPwdCheck();">
			<input type="hidden" id="userNo" name="userNo" value="<%=userNo %>">
			<div id="oldPwd">
				<input id="oldPwdText" name="oldPwdText" type="text" value="현재 비밀번호 : " size="15" disabled>
				<input id="oldPwdInput" name="oldPwdInput" type="password" size="20" required>
			</div>
			<div id="newPwd">
				<input id="newPwdText" type="text" value="새로운 비밀번호 : " size="15" disabled>
				<input id="newPwdInput" name="newPwdInput" type="password" size="20" required>
			</div>
			<div id="newPwd2">
				<input id="newPwdText2" type="text" value="비밀번호 재입력 : " size="15" disabled>
				<input id="newPwdInput2" name="newPwdInput2" type="password" size="20" required>
			</div>
			<br>
			<div id="btnChange">
				<button id="btnC" type="submit">변경하기</button>
			</div>
		</form>
	</div>	

	<div id="ex2" class="modal">
		<h3>회원 탈퇴</h3>
		<hr>
		<form action="<%=contextPath %>/deleteMember.me" method="post">
			<input type="hidden" id="userNo" name="userNo" value="<%=userNo %>">
			<h4 id="warning"><b>※ 회원 탈퇴시 <font color="red">모든 정보</font>
			가 삭제되며<br> 삭제된 데이터는 복구되지 않습니다.</b></h4>
			<br><br>
			<h6>탈퇴를 원하신다면 <font color="red">비밀번호</font>를 입력해주세요</h6>
			<div id="pwd">
				<input id="pwdText" name="pwdText" type="text" value="* 비밀번호 : " size="10" disabled>
				<input id="pwdInput" name="pwdInput" type="password" size="20" required>
			</div>
			<br><br>
			<div id="btnDel">
				<button id="btnDelete" type="submit">탈퇴하기</button>
			</div>
		</form>
	</div>	
	<hr>
	<%@include file="../common/footer.jsp" %>
</body>
</html>