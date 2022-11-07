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


<style>
a {
    text-decoration: none;
}
img {
    display: block;
    width: 100px;
    padding-top: initial;
}
  
/*Header-INNER*/
.header-inner {
    width: 1100px;
    margin: 0 auto;
    position: relative;
}

/*HEADER*/
header {
    width: 100%;
    position: fixed;
    top: 0;
    z-index: 10;
    background-color: white;
    border-bottom: 1px solid #c8c8c8;
}
header > .header-inner {
    height: 100px;
}
header .logo {
    height: 75px;
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    margin: auto;
}


header .sub-menu {
    position: absolute;
    top: 10px;
    right: 0;
    display: flex;
}
header .sub-menu ul.menu {
    font-family: Arial, sans-serif;
    display: flex;
}
header .sub-menu ul.menu li {
    position: relative;
    list-style : none;
}
header .sub-menu ul.menu li::before {
    content: "";
    width: 1px;
    height: 12px;
    background-color: #e5e5e5;
    position: absolute;
    top: 0;
    bottom: 0;
    margin: auto;
}
header .sub-menu ul.menu li:first-child::before {
    display: none;
}
header .sub-menu ul.menu li a {
    padding: 11px 16px;
    display: block;
    font-size: 13px;
    color: #656565;
}
header .sub-menu ul.menu li a:hover {
    color: black;
}
header .main-menu .search {
    position: relative;
    height: 34px;
}
header .main-menu .search input {
    width: 100px;
    height: inherit;
    padding: 4px 10px;
    border: 1px solid white;
    box-sizing: border-box;
    border-radius: 5px;
    outline: none;
    background-color: rgba(205, 203, 203, 0.988);
    color: #777;
    font-size: 12px;
    transition: width .4s;
}
header .main-menu .search input:focus {
    width: 290px;
    border-color: #669900;
}

header .main-menu {
    font-family: Arial, sans-serif;
    display: flex;    
    justify-content: center;
    padding: 10px 500px 30px 0;
    list-style : none;
}


header .main-menu li a {
    padding: 11px 16px;
    display: block;
    font-size: 13px;
    color: #656565;
}
header .main-menu ul.item li a:hover {
    color: black;
}
</style>

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
                <img src="../resources/image/logo.png" />
                <img src="../../resources/image/logo.png" />
                여긴 로고 자리..
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
	
	                </ul>
	            </div>
            
            
            
            <% } %>
            

        </div>
    </header>
</body>
</html>