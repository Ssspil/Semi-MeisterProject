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
        color: gray;
        width: 450px;
        height : 500px;
        margin: auto;
        margin-top: 180px;
    }
    #login-form table{
        margin:auto;
    }
    #login-form input{
        margin: 4px;
    }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	
    <div class="outer" style="height: auto; width: 450px; border:2px solid gold;">
        <br>
        <h2 style="text-align: center;">로그인</h2>
        <br><br>
        
        <img src="resources/resources/image/meister.png" width="300px" height="150">
   

	    <form id="login-form" action="<%=contextPath %>/login.me" method="post">
	        <table>
	            <tr>
	                <th>아이디 & 이메일</th>
	                <td><input type="text" name="userId" placeholder="KH@meister.com" required></td>
	            </tr>
	            <tr>
	                <th>비밀번호  </th>
	                <td><input type="password" name="userPwd" required></td>
	            </tr>
	            <tr>
	                <th colspan="2">
	                	<input type="checkbox" id="saveId"><label for="saveId">아이디 저장</label>
	                    <button type="submit"class="btn btn-warning" onclick="submitLogin();">이메일로 로그인</button> <br><br>
	                    <button type="button" class="btn btn-primary btn-sm" onclick="findPwd();">비밀번호 찾기</button>
	                    <button type="button" class="btn btn-primary btn-sm" onclick="enrollPage();">회원가입</button>
	                </th>
	            </tr>
	
	
	        </table>
	
	  	  </form>
    </div>
    
    <br><br>
    <%@ include file="../common/footer.jsp" %>
    
   

   

</body>
</html>