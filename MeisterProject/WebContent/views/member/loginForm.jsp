<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.Member"%>
<%
    String contextPath = request.getContextPath();

	Member loginUser = (Member) session.getAttribute("loginUser");
	// 로그인전 or 로그인 실패 : null
	// 로그인 성공 후 : 로그인 한 회원의 정보가 담긴 member 객체
	
	String alertMsg = (String) session.getAttribute("alertMsg");
	// 서비스 요청 전 : null
	// 서비스 요청 성공 후 : alert로 띄어줄 메시지 문구
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인폼</title>
<style>
    .outer{
        background-color: blue;
        color: orange;
        width: 400px;
        height : 500px;
        margin: auto;
        margin-top: 100px;
    }
    #enroll-form table{
        margin:auto;
    }
    #enroll-form input{
        margin: 4px;
    }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>


    <div class="outer">
        <br>
        <h2 style="text-align: center;">로그인</h2>
   

	    <form id="login-form" action="<%=contextPath %>/login.me" method="post">
	        <table>
	            <tr>
	                <th>아이디 이메일</th>
	                <td><input type="text" name="userId" required></td>
	            </tr>
	            <tr>
	                <th>비밀번호  </th>
	                <td><input type="password" name="userPwd" required></td>
	            </tr>
	            <tr>
	                <th colspan="2">
	                	<input type="checkbox" id="saveId"><label for="saveId">아이디 저장</label>
	                    <button type="submit" onclick="submitLogin();">로그인</button>
	                    <button type="button" onclick="enrollPage();">회원가입</button>
	                </th>
	            </tr>
	
	
	        </table>
	
	  	  </form>

    </div>
    
   

   

</body>
</html>