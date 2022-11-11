<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.Member"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인폼</title>
<style>
    .outer{
        background-color: white;
        color: black;
        width: 410px;
        height : 600px;
        margin: auto;
        margin-top: 45px;
        border-radius:5px;
    }
    #login-form input{
        margin: 6px;
    }
		
	.under-under-menu li{
    	width : 270px;
    	margin : auto;
    	list-style:none;
    }
    
    #logo{
	     width : 300px;
	     height : 100px;
	     margin: auto;
    }
	#btn1{
		display: block;
		margin: auto;
	}
	.under-menu li a{
    padding: 1px 20px;
    display: block;
    font-size: 13px;
    color: #656565;
    float : left;
	
	}
	.under-menu li a:hover {
		color: black;
	}
	.inputContent{
		display: block;
		margin-left: 10%;
	}
	#logo{
		display: block;
		margin : auto;
	}
	
    
    
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
</head>
<body style="background-color: rgb(249, 247, 247);">
	<%@ include file="../common/header.jsp" %>
	<br><br><br><br><br>
	<h3 style="text-align:center"> 로그인 </h3>
	
    <div class="outer">
        <br><br>
        <img src="<%=contextPath %>/resources/image/logo.png" id="logo">
        
        <br><br><br>

	   	<form id="login-form" action="<%=contextPath %>/login.me" method="post">
	   		
	   		<div class="inputContent">
	   			
				<div style="display:block">
	   			<label for="input1"><b>아이디 & 이메일</b></label><br>				
	   			<input id="input1" type="email" name="userId" data-vv-validate-on="blur" class="text-input form-control is-invalid invalid" style= "width:85%; height: 45px;" placeholder="KH@meister.com" autocomplete="off" required>
	   				<div data-v-149435f8="" class="invalid-feedback">이메일을 입력해주세요.</div>
	   				 <br>
	   				 
	   			<label for="input2"><b>비밀번호</b></label><br>
	   			<input id="input2" type="password" name="userPwd" data-vv-validate-on="blur" class="text-input form-control is-invalid invalid" style= "width:85%; height: 45px;" placeholder="비밀번호를 입력해주세요." autocomplete="off" required>
	   				<small data-v-149435f8="" class="invalid-feedback">영문+숫자 조합 8자리 이상 입력해주세요.</small>
					<br>
	   			</div>
	   			
	   			<script>
	   				$(function(){
	   					$("#input1").blur(function(){
	   						let regExp = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
	   						
	   						if(regExp.exec($("#input1").val())){
								$("#input1").removeClass('invalid');
								$("#input1").removeClass('is-invalid');
								$("#input1").addClass('is-valid');
	   						}else{
								$("#input1").addClass('invalid');
								$("#input1").removeClass('is-valid');
								$("#input1").addClass('is-invalid');
	   						}
	   						
	   					})
	   				})
	   				
	   				$(function(){
	   					$("#input2").blur(function(){
	   						let regExp = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
	   						
	   						if(regExp.exec($("#input2").val())){
								$("#input2").removeClass('invalid');
								$("#input2").removeClass('is-invalid');
								$("#input2").addClass('is-valid');
	   						}else{
								$("#input2").addClass('invalid');
								$("#input2").removeClass('is-valid');
								$("#input2").addClass('is-invalid');
	   						}
	   						
	   					})
	   				})
	   			</script>
	   				 
	   			
	   			
	   			 			
	
	   			
			</div>
				
	   			<button id="btn1" type="submit" class="btn btn-warning" onclick="submitLogin();" style="text-align:center";>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;로그인&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
	   			
	   		
	   	</form>
	   		

	  	  <div class="under-menu">
	           	<ul class="under-under-menu">
	           		<li>
	           		<a href="<%= contextPath %>/pwdfindform.me">비밀번호 찾기</a>
	           		</li>
	           		<li>
	           		<a href="<%= contextPath %>/enrollForm.me">회원가입</a>
	           		</li>
	           	</ul>
	     </div>
	     
	     </div>
	     
  
    <%@ include file="../common/footer.jsp" %>

	
    
   

   

</body>
</html>