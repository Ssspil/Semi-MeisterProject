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
    
    
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
</head>
<body style="background-color: lightgray;">
	<%@ include file="../common/header.jsp" %>
	<br><br><br><br><br>
	<h3 style="text-align:center"> 로그인 </h3>
	
    <div class="outer" style="border:2px solid gold;">
        <br><br>
        <img src="<%=contextPath %>/resources/image/logo.png" id="logo">
        
        <br><br><br>

	   	<form id="login-form" action="<%=contextPath %>/login.me" method="post">
	   		
	   		<div>
	   			
				<div style="display:block">
	   			<label for="input1">아이디</label><br>				
	   			<input id="input1" type="text" name="userId" class="text-input form-control is-invalid invalid" style= "width:97%; height: 45px;" style="text-align:center; display:block; margin: 0 auto;" placeholder="아이디를 입력해주세요." autocomplete="off" required><div data-v-149435f8="" class="invalid-feedback">아이디를 입력해주세요.</div> <br>
	   			</div>
	   			
	   			<label for="input2">비밀번호</label><br>
	   			<input id="input2" type="password" name="userPwd" class="text-input form-control is-invalid invalid" style= "width:97%; height: 45px;" placeholder="비밀번호를 입력해주세요." autocomplete="off" required><small data-v-149435f8="" class="form-text text-invalid" style="color: red;">비밀번호를 입력해주세요.</small> <br>
	   			
	   			<button id="btn1" type="submit" class="btn btn-warning" onclick="submitLogin();" style="text-align:center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;로그인&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
	   			
	   		</div>
	   	</form>
	   		

	  	  <div class="under-menu">
	           	<ul class="under-under-menu">
	           		<li>
	           		<a href="<%= contextPath %>/alert.me">비밀번호 찾기</a>
	           		</li>
	           		<li>
	           		<a href="<%= contextPath %>/alert.me">회원가입</a>
	           		</li>
	           	</ul>
	     </div>
	     
	     </div>
  
    <%@ include file="../common/footer.jsp" %>
    
   

   

</body>
</html>