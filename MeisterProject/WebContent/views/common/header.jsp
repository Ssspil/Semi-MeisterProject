<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%
    String contextPath = request.getContextPath();
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
  
/*INNER*/
.inner {
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
header > .inner {
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
header .sub-menu .search {
    position: relative;
    height: 34px;
}
header .sub-menu .search input {
    width: 36px;
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
header .sub-menu .search input:focus {
    width: 190px;
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
        <div class="inner">
    
            <a href="#" class="logo">
                <img src="/resources/image/logo.png" />
                사진이 안떠..
            </a>
        
            <div class="sub-menu">
                <ul class="menu">
                    <li>
                        <a href="#">전문가 등록</a>
                    </li>
                    <li>
                        <a href="#">로그인</a>
                    </li>
                    <li>
                        <a href="#">회원가입</a>
                    </li>
                    <li>
                        <a href="#">Find a Store</a>
                    </li>
                </ul>
                <div class="search">
                    <input type="text" placeholder="원하는 영상을 검색해 보세요.">
                </div>
            </div>
            
            
            <ul class="main-menu">
                <li class="item">
                    <a href="#">
                        <span>고수매칭</span>
                    </a>
                </li>
                <li>
                    <a href="#">고수찾기</a>
                </li>
                <li>
                    <a href="#">마켓</a>
                </li>
                <li>
                    <a href="#">커뮤니티</a>
                </li>
            </ul>
        </div>
    </header>
</body>
</html>