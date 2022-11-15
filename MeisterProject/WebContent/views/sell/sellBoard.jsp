<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import="java.util.ArrayList, com.kh.common.model.vo.Interest, com.kh.common.model.vo.Local"%>
<%
	ArrayList<Interest> interest = (ArrayList<Interest>) request.getAttribute("interest");	
	ArrayList<Local> local = (ArrayList<Local>) request.getAttribute("local");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매게시판 메인</title>
<style>
body {
	margin : 0;
	padding : 0;
}
div{
	/*border: 1px solid chartreuse;*/
	box-sizing: border-box;
	
}
.outer{
       height: 1000px;
       /* 상 , 우 , 하, 좌  띄우기 */
	margin: 150px 200px 20px 200px;
}
/*맨 위 마켓*/
h2{
	border-bottom: 5px solid rgb(255, 212, 0);
    padding-bottom: 16px;
    margin-bottom: 8px;
	font-family: 'Nanum Gothic';
}


/*글등록 버튼*/
#sellEnrollBtn{
	width: 100px;
	height: 40px;
	font-size: 15px;
	font-weight: 900;
	background-color: white;
	color: orange;
	outline-color: rgb(248, 162, 3);
	border: solid;
	border-radius: 12px;
	font-family: 'Nanum Gothic';
	float : right;
}
#sellEnrollBtn:hover{
	background-color: orange;
	color:white;
}
	
/* =================사이드 네비게이션 바 css===================== */

.navigator{
    width: 1000px;
    height: 50px;
    transition: all 0.5s ease-in-out;

}
#navi{
    list-style-type : none;
    margin: 0;
    padding: 0;
    height: 100%;
    position: relative; /*z-index를 위한 기준 위치 */
    
}
#navi > li {
    width: 10%;
    height: 100%;
    text-align: center;
    line-height: 25px;
}
/* 현재 보이는 목록의 글자들 (전체)*/
#navi a{
    text-decoration: none;
    color: black;
    font-size: 18px;
    font-weight: 500;
    width: 100%;
    height: 100%;
    display: block;
    line-height: 34px;
}
/* 현재 보이는 목록의 글자들 (전체-마우스를 올렸을 때)*/
#navi a:hover {
    font-size: 22px;
    color: coral;
}
#navi > li > ul {
    list-style-type: none;
    display: none;
    margin: -50px;
}
/* 지역들 목록 보이게 하는 css*/
#navi > li > ul a {
    font-size: 18px;
    margin-left: 110px;
    margin-top: -1px;
    background-color: rgb(253, 215, 184);
    color: black;
    font-weight: 350;
    height: 50px;
    line-height: 50px;
   
}
#navi > li > ul a:hover {
    font-size: 18px;
    background-color: orange;
    color: white;
    
}
#navi > li > a:hover+ul {
    display: block;
}
#navi >li > ul:hover{
    display: block;
}

div.main{
	background-color :red;
	margin-left:10rem;
	z-index : 200;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	
	<div class="outer" >
		
		<h2>마켓</h2>
		
		<br>
		<div>
		<%if(loginUser !=null && loginUser.getExpert().equals("Y")) { %>					
			<a href="<%=contextPath%>/sellEnrollForm.se" id="sellEnrollBtn" class="btn btn-secondary">글 등록</a>
			<%} else{%>
			<a href="<%=contextPath%>/sellEnrollForm.se" id="sellEnrollBtn" class="btn btn-secondary" style="display:none">글 등록</a>
		<%} %>
		</div>
		
		<div class="navigator">
		
        <ul id="navi">
        	<li class="list">
                <a href="">전체</a>
                <ul>
                    <li class="list-in-list"><a href="">서울</a></li>
                    <li class="list-in-list"><a href="">인천</a></li>
                    <li class="list-in-list"><a href="">울산</a></li>
                    <li class="list-in-list"><a href="">대전</a></li>
                    <li class="list-in-list"><a href="">광주</a></li>
                    <li class="list-in-list"><a href="">경기</a></li>
                    <li class="list-in-list"><a href="">충북 / 충남</a></li>
                    <li class="list-in-list"><a href="">전북 / 전남</a></li>
                    <li class="list-in-list"><a href="">경북 / 경남</a></li>
                    <li class="list-in-list"><a href="">제주</a></li>
                </ul>
            </li>
        	<% for (Interest i : interest) { %>
        	<li class="list">		
       			<a href=""><%= i.getInterestName() %></a>
       			<ul>
       				<% for (Local l : local) { %>
       					<li class="list-in-list"><a href=""><%= l.getLocalName() %></a></li>
       				<% } %>
				</ul>
			</li>
       		<% } %>
        </ul> 
        
		</div> 
		
		<div class="main">
			<div>썸네일1</div>
			<div>썸네일2</div>
			<div>썸네일3</div>
			<div>썸네일4</div>
		</div>
	</div><!-- outer 끝 -->
	


	<%@ include file="../common/footer.jsp" %>


</body>
</html>