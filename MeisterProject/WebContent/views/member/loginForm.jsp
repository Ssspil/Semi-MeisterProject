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
        height : auto;
        margin: auto;
        margin-top: 180px;
    }
    #login-form table{
        margin:auto;
    }
    #login-form input{
        margin: 4px;
    }
    .under-menu ul.menu li a:hover {
    color: pink;
    text-decoration-line: none;
	}
	a:link {
 	 color : gray;
	}
	ul{
	 list-style:none;
	}
	li{
     float:left;
     margin-right : 30px;
     
	}
	div{
	border-radius:5px;
	}
    .outer .under-menu{
    	width : 300px;
    	margin : auto;
    	background-color :red;
    }
    
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
</head>
<body style="background-color: lightgray;">
	<%@ include file="../common/header.jsp" %>
	
    <div class="outer" style="height: 600px; width: 450px; border:2px solid gold;">
        <br>
        <h2 style="text-align: center;">로그인</h2> <br><br>
        <br><br>
   

	   	<form id="login-form" action="<%=contextPath %>/login.me" method="post">
	        <table>
	            <tr>
	                <th>아이디</th>
	                <td><input type="text" name="userId" placeholder="KH@meister.com" required></td>
	            </tr>
	            <tr>
	                <th>비밀번호  </th>
	                <td><input type="password" name="userPwd" required></td>
	            </tr>
	            <tr>
	                <td colspan="2">
	                	<!-- <input type="checkbox" id="saveId"><label for="saveId">아이디 저장</label> -->
	                    <button type="submit"class="btn btn-warning" onclick="submitLogin();">로그인</button> <br><br>
	                    
	                </td>
	            </tr>
	        </table> 
	  	  </form>
	  	  <div class="under-menu">
	           	<ul class="menu">
	           		<li>
	           		<a href="<%= contextPath %>/alert.me">비밀번호 찾기</a>
	           		</li>
	           		<li>
	           		|
	           		</li>
	           		<li>
	           		<a href="<%= contextPath %>/alert.me">회원가입</a>
	           		</li>
	           	</ul>
	     </div>
    </div>
    
    
    <br><br>
    <%@ include file="../common/footer.jsp" %>
    
   

   

</body>
</html>