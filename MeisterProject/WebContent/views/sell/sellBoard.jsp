<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import="java.util.ArrayList, com.kh.common.model.vo.Interest, 
    		com.kh.common.model.vo.Local, com.kh.sellboard.model.vo.SellBoard,
    		com.kh.common.model.vo.PageInfo,
    		com.kh.common.model.vo.Attachment"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	ArrayList<Interest> interest = (ArrayList<Interest>) request.getAttribute("interest");	
	ArrayList<Local> local = (ArrayList<Local>) request.getAttribute("local");
	ArrayList<SellBoard> list = (ArrayList<SellBoard>) request.getAttribute("list");
	
	SellBoard s = (SellBoard) request.getAttribute("s");
	Attachment at = (Attachment) request.getAttribute("at");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	Member m = (Member) request.getAttribute("m");
 	
 	int currentPage = pi.getCurrentPage();
 	int startPage = pi.getStartPage();
 	int endPage = pi.getEndPage();
 	int maxPage = pi.getMaxPage();
	
%>

<!DOCTYPE html>
<html>
<head>
<!-- 홈페이지 아이콘 -->
<link rel="icon" href="./resources/image/mainLogo.png" />
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<!-- fontawesome icon -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" 
		integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" 
		crossorigin="anonymous" referrerpolicy="no-referrer" />
	
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
	   font-family: 'Nanum Gothic';
}
/*맨 위 마켓*/
h2{
	border-bottom: 5px solid rgb(255, 212, 0);
    padding-bottom: 16px;
    margin-bottom: 8px;
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
    z-index: 5;
    
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
    color: orange;
    font-weight: 700;
}
#navi > li > ul {
    list-style-type: none;
    display: none;
    margin: -50px;
}
/* 지역들 목록 보이게 하는 css*/
#navi > li > ul a {
    font-size: 15px;
    margin-left: 110px;
    margin-top: -1px;
    background-color: rgb(253, 215, 184);
    color: black;
    font-weight: 350;
    height: 40px;
    line-height: 40px;
   
}
#navi > li > ul a:hover {
    font-size: 15px;
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
    margin-left:10rem;
    display: inline-block;
}

/*썸네일 위치 설정*/
div.main div{
   /* border : 1px solid red; */
    height: 250px;
    width : 250px;
    margin : 10px 15px 130px 15px;
    float : left;
    flex-wrap: nowrap; /*자동 줄 바꿈 처리*/
    font-size : 13px;

}

div.thumbnail {
	margin : 25px 15px 100px 15px;
}
/*마켓글 호버시 썸네일 크기 변경*/
div.thumbnail #thumbImg{
	transform : scale(1); 
	-webkit-transform:scale(1);
	z-index : -1;
}
/*마켓글 호버시 썸네일 크기 변경*/
div.thumbnail #thumbImg:hover{
	transform : scale(1.05); 
	-webkit-transform:scale(1.05);
	z-index : -1;
}

/*금액 표시*/
div.thumbnail b {
	 color: orange;
	 font-size : 17px;
}

p.heartIcon{
	font-size: 20px; 
	text-align: right;
}

/*하트 버튼*/
p button{
  	background-color:transparent;	
  	border : 0px;
	outline: 0;
}
</style>

</head>
<body>
	<%@ include file="../common/header.jsp" %>
	
	<div class="outer" >
		
		<h2>마켓</h2>
		
		<br>
		<!------ 전문가/비전문가 글등록 버튼 유무  ------>
		<div>
		<%if(loginUser !=null && loginUser.getExpert().equals("Y")) { %>					
			<a href="<%=contextPath%>/sellEnrollForm.se" id="sellEnrollBtn" class="btn btn-secondary">글 등록</a>
			<%} else{%>
			<a href="<%=contextPath%>/sellEnrollForm.se" id="sellEnrollBtn" class="btn btn-secondary" style="display:none">글 등록</a>
		<%} %>
		</div>
		<br>
		<br>
		
		<!---- 왼쪽 카테고리 메뉴바 ---->
		<div class="navigator">		
	        <ul id="navi">
	        	<li class="list-1">
	                <a href="<%= contextPath %>/market.se" id="marketAll">전체</a>
	            </li>
	        	<% for (Interest i : interest) { %> 
	        	<li class="list-2">
	       			<a href="<%= contextPath %>/market.se?interest_no=<%=i.getInterestNo() %>" > <%= i.getInterestName() %> </a>
	       			<ul>
	       				<% for (Local l : local) { %>
	       					<li class="list-in-list">
	       						<a href="<%= contextPath %>/market.se?interest_no=<%=i.getInterestNo() %>&local_no=<%=l.getLocalNo()%>" > <%= l.getLocalName() %></a>
	       					</li>
	       				<% } %>
					</ul>
				</li>
	       		<% } %>
	        </ul> 
	        
	    </div> 
	    
		<!----- 메인 썸네일 ------>
		<div class="main">
		<% if(list.isEmpty()){ %>
			<!-- 리스트가 비어있는 경우 -->
			등록된 게시글이 없습니다.
		<% } else{ %>
		
			<%for(SellBoard sb : list ) {%>
				<div class="thumbnail" align="center">
					<input type="hidden" value="<%=sb.getSellNo() %>">
						<!-- 찜 하트 아이콘 -->
						<p class="heartIcon" > 
								<button onclick="heartAttack('<%= sb.getSellNo()%>')">
								<img src="./resources/image/sell_noZzim.png" id= "zzim" width="20" height="20" > </button>
						</p>
					<img src="<%=contextPath %>/<%=sb.getTitleImg()%>" id="thumbImg" width="230px" height="210px">
					<p id="explain">
						<img src="./resources/image/sell_title.png" width="20" height="20"> <%=sb.getSellTitle() %> <br>					
							<img src="./resources/image/sell_interest.png" width="20" height="20"> <%= sb.getInterestName() %>  //					
							<i class="fa-solid fa-location-dot"></i> <%= sb.getLocalName() %><br>					
						<img src="./resources/image/sell_price.png" width="25" height="25">
						<c:set var = "price" value="<%= sb.getPrice() %>"/>
						<b> <fmt:formatNumber value="${price }"  /> 원 </b> <br>
					</p>
				</div>
			<% } %>
		<% } %>
		
	
		</div>
		
		<script>
		//썸네일 클릭 시 이동되는 주소
		$(function(){
			$(".thumbnail").click(function(){		
			
				location.href = "<%=contextPath%>/detail.se?sno="+$(this).children().eq(0).val();					
			})	
		});
	
		 //찜버튼 관련 스크립트
		 let likeBtn = true; // 변수 likeBtn을 true로 선언
		 
		 function heartAttack(sellNo){
			 window.event.stopPropagation(); //이벤트 추가 발생 방지
			 likeBtn = false; // 변수 likeBtn을 true에서 false로 변경
			 let likeval = document.getElementById("zzim").value;
			 
				if (likeval > 0) {
				 	zzim.src = "./resources/image/sell_noZzim.png";
				}
				else {
					zzim.src = "./resources/image/sell_zzim.png";
				}
			 
				$.ajax({
					url : "sellBoardLike.se",
					type : "post",
					data : { sellNo, type : "I" },
					success : function(data) {
						if (data.result == 1) {
							$("#zzim").attr("src", "./resources/image/sell_zzim.png");
							alert("찜 등록 완료!");
						} else if (data.result == 2) {
								$.ajax({
									url : "sellBoardLike.se",
									type : "post",
									data : { sellNo, type : "D" },
									success : function(data) {
										if (data.result == 1) {
											$("#zzim").attr("src", "./resources/image/sell_noZzim.png");
											alert("찜 등록이 취소되었습니다.");
										} //if
									}, //success
									error : function() {
										console.log("ERROR > ");
									} //error
								}) //$.ajax
							} //if
						 else {
							alert("오류가 발생했습니다.");
						}
					},
					error : function() {
						console.log("ERROR>>");
					},
					done : function() {
						likeBtn = true;
				} 
			 })//$.ajax
		 }
     	</script>
		    
		    
		    
	</div><!-- outer 끝 -->
	
		<!-- 페이징처리 -->           
	     <div align="center" class="paging-area">
			<% if(currentPage != 1) {%>
				<button onclick="doPageClick(<%=currentPage-1 %>)">&lt;</button>
			<%} %>
			
			<%for(int i = startPage; i<=endPage; i++){ %>
				<% if(i != currentPage) {%>
					<button onclick="doPageClick(<%=i%>)"><%= i%></button>
				<% } else { %>
					<button disabled><%=i %></button>
				<%} %>
			<%} %>
			
			<%if(currentPage != maxPage) {%>
				<button onclick="doPageClick(<%=currentPage+1 %>)">&gt;</button>
			<%} %>
		</div>
		<script>
			function doPageClick(currentPage){
				location.href= "<%=contextPath%>/market.se?currentPage="+currentPage;
				
			}
		</script>
		
	

	<%@ include file="../common/footer.jsp" %>


</body>
</html>