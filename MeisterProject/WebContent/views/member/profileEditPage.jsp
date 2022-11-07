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
		String phone = loginUser.getPhone() == null? "" : loginUser.getPhone();
		String interest = loginUser.getInterest() == null? "" : loginUser.getInterest();
	%>
	
	<div class="outer">
		<br>
		<h2><b>&nbsp;개인정보 수정</b></h2>
		<br>
		<hr>
		<h4><b>&nbsp;프로필 변경</b></h4>
		<br>
		<div id="profileImg">
			<img src="<%=contextPath %>/resources/image/logo.png">
		</div>
		<br>
		<h6><b>닉네임</b></h6> 
		<input type="text" value="<%=nickname %>" size="80">
		<br>
		<hr>
	</div>
</body>
</html>