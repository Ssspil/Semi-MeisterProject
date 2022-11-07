<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.Member" %>
<%
    String contextPath = request.getContextPath();

	Member loginUser = (Member)session.getAttribute("loginUser");
	// 로그인 이전 or 로그인 실패 : null
	
	String alertMsg = (String)session.getAttribute("alertMsg");
	// 서비스 요청 전 : null
	// 서비스 요청 성공 후 : alert로 띄워줄 메시지 문구.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤더바</title>

<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<link href="<%= contextPath %>/resources/css/header.css" rel="stylesheet" type="text/css"  />

</head>
<body>
    <header>
    <script>
		let msg = "<%=alertMsg %>";	// let msg = 성공적으로 로그인 되었습니다.
		
		// 알람을 띄워준후 session에 담긴 해당메세지는 지워줘야한다.
		// 안그러면 menuber.jsp가 로딩될때마다 계속 알림창잉 뜬다.
		if(msg != "null"){
			alert(msg);
			
			<% session.removeAttribute("alertMsg"); %>
		} 
		
	</script>
        <div class="header-inner">

            <a href="#" class="logo">
                <img src="<%= contextPath %>/resources/image/logo.png" />
            </a>
        
            <ul class="main-menu">
                <li>
                    <a href="<%= contextPath %>/market.se">마켓</a>
                </li>
                <li>
                    <a href="<%= contextPath %>/boardlist.bo">커뮤니티</a>
                </li>
                <li>
		        	<div class="search">
		            	<input type="text" placeholder="원하는 영상을 검색해 보세요.">
		            </div>
	            </li>
            </ul>

			<!-- 로그인 안되어 있을 시 -->
			<% if  (loginUser == null ) {%>
	            <div class="sub-menu">
	                <ul class="menu">
	                    <li>
	                        <a href="<%= contextPath %>/loginForm.me">로그인</a>
	                    </li>
	                    <li>
	                        <a href="<%= contextPath %>/enrollForm.me">회원가입</a>
	                    </li>
	
	                </ul>
	            </div>
	        <!-- 로그인 했을 시 -->
            <% } else if ((loginUser != null) && (loginUser.getUserId().equals("admin")) ){ %> 

				
            	<div class="sub-menu">
	                <ul class="menu">

	                    <li>
	                        <a href="<%= contextPath %>/alert.me">알림</a>
	                    </li>
	                    <li>
	                        <a href="<%= contextPath %>/mypage.me">마이페이지</a>
	                    </li>
	                    <li>
	                        <a href="<%= contextPath %>/manager.ad">관리자 페이지</a>
	                    </li>
	                    <li>
	                    	<a href="<%=contextPath %>/logout.me">로그아웃</a>
	                    </li>
	
	                </ul>
	            </div>
            <% } else { %>
            	<div class="sub-menu">
	                <ul class="menu">

	                    <li>
	                        <a href="<%= contextPath %>/alert.me">알림</a>
	                    </li>
	                    <li>
	                        <a href="<%= contextPath %>/mypage.me">마이페이지</a>
	                    </li>
	                    <li>
	                    	<a href="<%=contextPath %>/logout.me">로그아웃</a>
	                    </li>
	
	                </ul>
	            </div>
            
            
            
            <% } %>
            

        </div>
    </header>
</body>
</html>