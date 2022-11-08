<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.Member"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 폼</title>
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
	div input, label, .invalid-feedback{
		margin-left: 20px;
	}

	.form-control input:focus {
		border-color: orange;
		border-width: 4px;      
    }

	#btn1{
		display: block;
		margin: auto;
	}

	div input[type=email]:focus {
		border:2px  solid orange;
	}
	div input[type=text]:focus {
		border:2px  solid orange;
	}


	
    
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
</head>
<body style="background-color: white;">
	<%@ include file="../common/header.jsp" %>
	<br><br><br><br><br>
	<h3 style="text-align:center"> 비밀번호 찾기 </h3>
	
    <div class="outer" style="border:2px solid gold;">
        <br><br>
        <img src="<%=contextPath %>/resources/image/logo.png" id="logo">
        
        <br><br><br>

	   	<form id="pwdfind-form" action="<%=contextPath %>/pwdFind.me" method="post">
	   		<div>
				<div style="display:block">
					<label for="input1">아이디</label><br>				
					<input id="input1" type="text" name="userId" class="text-input form-control" style= "width:90%; height: 40px; " style="text-align:center; display:block; " placeholder="아이디를 입력해주세요." autocomplete="off" required>
					 <br>
	   			</div>
	   			
	   			<label for="input2">이메일 주소</label><br>
	   			<input id="input2" type="email" name="email" class="text-input form-control"  style= "width:90%; height: 45px; " placeholder="@를 포함한 이메일 주소를 입력해주세요." autocomplete="off" required>
	   			
				<br>
				
	   			<button id="btn1" type="submit" class="btn btn-warning" onclick="sendEmail();" style="text-align:center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이메일로 전송하기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
	   			
	   		</div>
	   	</form>

	</div>
	
		<script>
			<!--넣어야되는게 맞는지?-->
			function sendEmail(){
				if($("input[name=userId]").val() != $("input[name=userId]").val()){
					alert("올바른 아이디를 입력해주세요.")

					return false;
				} else{
					alert("임시 비밀번호 전송 완료! 메일함을 확인해주세요.")
				}
				return true;
			}

		</script>
				   
	
    <%@ include file="../common/footer.jsp" %>
    
  
</body>
</html>