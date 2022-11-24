<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,
    							com.kh.board.model.vo.*,
    							com.kh.sellboard.model.vo.*"%>
<%
	ArrayList<Board> list =	(ArrayList<Board>) request.getAttribute("list");
	ArrayList<SellBoard> sellList = (ArrayList<SellBoard>) request.getAttribute("sellList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<link href="./resources/css/mainPage.css" rel="stylesheet" type="text/css"  />
<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!--  google font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet">
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

<style>
.sell-main{
	height: 100%;
}
.area {
	background-color : orange;
	height : 100%;
	width : 30%;
	float : left;
	margin-left : 2.5%;
	padding-left : 3rem;
	padding-top : 0.9rem;
}
.area:hover {
	/* 카드형식으로 해보기*/
}
#sellImg{
	width : 80%;
	border-radius : 10px;
	
}
</style>

</head>
<body>
  <%@ include file="header.jsp" %>
  <div class="outer">
    <br>
    <div class="slider-area">
      <div class="imgContainer">
      <div id="slider">
        <ul class="slides">
          <li class="slide"><!-- 첫번째와 마지막꺼 같은 사진 둬야함. -->
            <img src="./resources/image/main1.jpeg" alt="" />
            <div class="centerText">ㅋㅋdsfasdfdas</div>
          </li>
          <li class="slide">
            <img src="./resources/image/main2.jpeg" alt="" />
          </li>
          <li class="slide">
            <img src="./resources/image/main3.jpeg" alt="" />
          </li>
          <li class="slide">
          	<img src="./resources/image/main4.jpeg" alt="" />
          </li>
          <li class="slide">
          	<img src="./resources/image/main5.jpeg" alt="" />
          </li>
          
          <li class="slide"><!-- 첫번째와 마지막꺼 같은 사진 둬야함. -->
            <img src="./resources/image/main1.jpeg" alt="" />
          </li>
        </ul>
      </div>
    </div>

    </div>
    	
    	<br>
      <!-- 메인 검색창 -->
      <div>
      	<div class="smalltext-nav" style="margin-left:15%;">
      	검색창으로 바로가기↓<br><br>
      	</div>
      
      <div class="search-area">
      	
        <svg class="close-search" viewBox="0 0 800 600" xmlns="http://www.w3.org/2000/svg">
          <defs>
            
              <g id="searchGroup" fill="#FBEFF9">
                <g id="se">
                <rect id="hit" width="545" height="40" y="6" fill="transparent"/>
                  <path d="M.49,54.88a2.19,2.19,0,0,1,3.12-.28c3.12,2.3,8.07,5.23,13.76,5.23a13.58,13.58,0,0,0,8.54-2.75,6.82,6.82,0,0,0,3.39-5.51c-.09-2.11-.91-3.58-3.21-5.5C24.17,44.6,21,43.5,16.55,42.76l-.18-.09c-4-.73-7.62-1.65-10.19-3.49a9.36,9.36,0,0,1-4.86-8.07A11.13,11.13,0,0,1,6.18,22.3a19.29,19.29,0,0,1,11-3c5.78,0,9.91,2.66,13.4,4.86a2.34,2.34,0,0,1,.64,3.12,2.21,2.21,0,0,1-3,.65c-3.3-2.21-6.6-4.5-11-4.5A13.48,13.48,0,0,0,8.66,26a6.74,6.74,0,0,0-2.85,5.14c0,1.83.83,3.12,2.57,4.5a22.86,22.86,0,0,0,9.18,3.12h.18A31,31,0,0,1,28.66,42.4a11.2,11.2,0,0,1,5.05,9.17c0,3.76-2.11,6.79-5.14,9.09a18.37,18.37,0,0,1-11.2,3.58c-7.24-.1-12.93-3.49-16.61-6.43A2.07,2.07,0,0,1,.49,54.88Z"/>
                  <path d="M45.54,41.85c0-12.48,9.73-22.58,21.84-22.58C79,19.27,88.12,28.45,89,40.19v.37a2.08,2.08,0,0,1-2.2,2H50c.46,9.82,8.17,17.25,17.43,17.25a16.91,16.91,0,0,0,14.5-8.16,2.14,2.14,0,0,1,2.94-.74,2.33,2.33,0,0,1,.73,3.12A21.42,21.42,0,0,1,67.38,64.24C55.27,64.24,45.54,54.14,45.54,41.85Zm4.68-3.58H84.27A17.36,17.36,0,0,0,67.38,23.68,17.56,17.56,0,0,0,50.22,38.27Z"/>
                </g>
                <g id="rch">
                  <path d="M161.44,21.57a2.2,2.2,0,0,1,2.29-2.21,2.16,2.16,0,0,1,2.11,2.21v9.91a7.29,7.29,0,0,1,.64-1.1c3.4-5.33,9.37-11,18-11a2.18,2.18,0,0,1,2.2,2.21,2.23,2.23,0,0,1-2.2,2.2c-5.87,0-9.91,3.3-13,7.34A40.37,40.37,0,0,0,166,41.57a1.35,1.35,0,0,0-.19.73V62a2.16,2.16,0,0,1-2.11,2.21A2.2,2.2,0,0,1,161.44,62Z"/>
                  <path d="M196.22,41.66c0-12.48,10.27-22.39,23.12-22.39a23.17,23.17,0,0,1,14.32,5,2.06,2.06,0,0,1,.27,3,2.25,2.25,0,0,1-3,.37,18.44,18.44,0,0,0-11.56-4c-10.46,0-18.72,8.17-18.72,18.08,0,10.1,8.26,18.17,18.72,18.17a19,19,0,0,0,11.56-3.94,2.26,2.26,0,0,1,3,.36,2.17,2.17,0,0,1-.46,3.21,23.18,23.18,0,0,1-14.13,4.78C206.49,64.24,196.22,54.33,196.22,41.66Z"/>
                  <path d="M284.86,37c0-7.89-6.42-13.21-14.32-13.21S256.32,29.09,256.32,37V62.31c0,.18-.09.27-.09.37s-.09.27-.19.36a2.07,2.07,0,0,1-1.37,1.1.31.31,0,0,1-.19.1H254a2.51,2.51,0,0,1-1.75-.74,2.75,2.75,0,0,1-.36-.73,1.89,1.89,0,0,1-.1-.74V2.2a2.25,2.25,0,0,1,4.5,0V25.88a18.57,18.57,0,0,1,14.22-6.61c10.37,0,18.82,7.34,18.82,17.71V62a2.25,2.25,0,0,1-4.5,0Z"/>
                </g>
                <g id="letterA" stroke="#FBEFF9">
                  <rect id="field" x="102.03" y="21.49" width="41" height="41" rx="20.5" ry="20.5" fill="none"  stroke-linecap="round" stroke-linejoin="round" stroke-width="4.5"/>
                  <line id="tail" x1="143.28" y1="62.59" x2="143.28" y2="21.82" fill="none"  stroke-linecap="round" stroke-linejoin="round" stroke-width="4.5"/>
                  <g id="magnifier" opacity="0.5">
                    <circle cx="121.92" cy="41.93" r="11" fill="none"  stroke-linecap="round" stroke-linejoin="round" stroke-width="3"/>
                    <line x1="131.24" y1="48.22" x2="139.99" y2="53.95" fill="none"  stroke-miterlimit="10" stroke-width="3"/>
                  </g>
        
              </g>
                
                </g>    
              <g id="close" stroke="#FBEFF9" stroke-linecap="round" stroke-linejoin="round" stroke-width="3" opacity="0.5">
                <circle cx="12.5" cy="12.5" r="11" fill="transparent" />
                <line x1="8.78" y1="8.62" x2="16.46" y2="16.61" fill="none" />
                <line x1="16.46" y1="8.62" x2="8.78" y2="16.61" fill="none" />
              </g>  
          </defs>
          <g transform="translate(-30, 0)">
              <use class="wholeSearch" xlink:href="#searchGroup" x="300" y="270"/>
              <use class="close" xlink:href="#close" x="511" y="300"/>
          </g>
        </svg>
        <input id="search" type="text" name="search" autocomplete="off" maxlength="32" onkeypress="if( event.keyCode == 13 ){ searchData1();}" />
 
        <!-- partial -->
      </div>
     </div>
      <!-- 메인 검색창  끝-->
      <script>
         function searchData1(){
        	
        	console.log($('#search').val());
        	
        	location.href="<%= contextPath %>/market.se?search="+$('#search').val();
		}
       </script>
      
      
      <div class="icon-area">
      	<div class="icon-container" align="center">
			<div class="icon" >
				<a href="<%= contextPath %>/market.se">
					<img src="./resources/image/icon1.gif" width="80" height="90"/>
					<br><b>전체</b>
				</a>
			</div>
			<div class="icon">
				<a href="<%= contextPath %>/market.se?interest_no=10">
					<img src="./resources/image/icon2.gif" width="80" height="90"/>
					<br><b>영상</b>
				</a>
			</div>
			<div class="icon">
				<a href="<%= contextPath %>/market.se?interest_no=20">
					<img src="./resources/image/icon3.gif" width="80" height="90"/>
					<br><b>영화</b>
				</a>
			</div>
			<div class="icon">
				<a href="<%= contextPath %>/market.se?interest_no=30">
					<img src="./resources/image/icon4.gif" width="80" height="90"/>
					<br><b>게임</b>
				</a>
			</div>
			<div class="icon">
				<a href="<%= contextPath %>/market.se?interest_no=40">
					<img src="./resources/image/icon5.gif" width="80" height="90"/>
					<br><b>IT</b>
				</a>
			</div>
			<div class="icon">
				<a href="<%= contextPath %>/market.se?interest_no=50">
					<img src="./resources/image/icon6.gif" width="80" height="90"/>
					<br><b>운동</b>
				</a>
			</div>
			<div class="icon">
				<a href="<%= contextPath %>/market.se?interest_no=60">
					<img src="./resources/image/icon7.gif" width="80" height="90"/>
					<br><b>요리</b>
				</a>
			</div>
	    </div>
      </div>
      
      <div class="interest-area">
        <div class="smalltext-nav">
      		판매글로 바로가기↓ 
      	</div>
      	<br>
      	<div class="sell-main">
      		<% for (int i = 0 ; i < 3; i++) { %>
      			<% if (sellList.get(i) != null ) {%>
	      			<div class="area">
	      				<img id="sellImg" src="<%= sellList.get(i).getTitleImg() %>" width="200" height="200" />
	      				<h5> <%= sellList.get(i).getSellTitle() %></h5>
	      				<span><%= sellList.get(i).getNickname() %></span><br>
	      				<span><%= sellList.get(i).getPrice() %></span>
	      			</div>
	      		<% } else { %>
	      			등록된 게시물이 없습니다.
	      		<% } %>
      		<%  } %>

      		
      	</div>
      </div>
      
      <br><br>
      <div class="community-area">
      		<div class="smalltext-nav">
      			커뮤니티 최신글 ↓
      		</div>
      		<br>
      		<div class="area1"><a href="<%= contextPath %>/detail.bo?type=<%= list.get(0).getBoardType() %>&bno=<%= list.get(0).getBoardNo() %>">
      			<div class="community-main">
      			<% if (list != null) { %>
      				<% for(int i = 0; i < 1; i++) { %>
      					<br>
      					 <span class="headtext"><%= list.get(i).getBoardTitle() %></span>
      					 <span class="bodytext">
      					 	<% if(list.get(i).getBoardContent().length() < 21) { %>
      					 		<%= list.get(i).getBoardContent() %>
      					 		<br><br><br><br><br>
      					 	<% } else if (list.get(i).getBoardContent().length() < 42) { %>
      					 		<%= list.get(i).getBoardContent() %>
      					 		<br><br><br><br>
      					 	<% } else if (list.get(i).getBoardContent().length() < 63) { %>
      					 		<%= list.get(i).getBoardContent() %>
      					 		<br><br><br>
      					 	<% } else if(list.get(i).getBoardContent().length() < 84){%>
      					 		<br><br>
      					 		<%= list.get(i).getBoardContent() %>
      					 	<% } else { %>
      					 		<%= list.get(i).getBoardContent() %>
      					 	<% } %>
      			
      					 </span>
			      			<div id="titlefooter">
								<div>
									<i class="bi bi-eye"></i>
									<%=list.get(i).getBoardCount()%>
									<i class="bi bi-hand-thumbs-up"></i>
									<%=list.get(i).getBoardRecommend()%>
			

									<div class="foot_wrap" style="float: right">
										<span id="date"><span id="chat2">
											<i class="bi bi-chat-dots"></i> <%=list.get(i).getReplyCount()%></span>
										</span>
									</div>
								</div>
							</div>
      					 
      				<% } %>
      			<% } else { %>
      				<span class="headtext">게시글이 아직 없습니다.</span>
      					 <span class="bodytext">게시글이 없습니다.</span>
      			<% } %>
      			</div>
      			</a>
      		</div>
      		<div class="area2"><a href="<%= contextPath %>/detail.bo?type=<%= list.get(1).getBoardType() %>&bno=<%= list.get(1).getBoardNo()%>">
      			<div class="community-main">
      				<% if (list != null) { %>
	      				<% for(int i = 1; i < 2; i++) { %>
	      					<br>
	      					 <span class="headtext"><%= list.get(i).getBoardTitle() %></span>
	      					 <span class="bodytext">
	      					 	<% if(list.get(i).getBoardContent().length() < 21) { %>
	      					 		<%= list.get(i).getBoardContent() %>
	      					 		<br><br><br><br><br>
	      					 	<% } else if (list.get(i).getBoardContent().length() < 42) { %>
	      					 		<%= list.get(i).getBoardContent() %>
	      					 		<br><br><br><br>
	      					 	<% } else if (list.get(i).getBoardContent().length() < 63) { %>
	      					 		<%= list.get(i).getBoardContent() %>
	      					 		<br><br><br>
	      					 	<% } else if(list.get(i).getBoardContent().length() < 84){%>
	      					 		<br><br>
	      					 		<%= list.get(i).getBoardContent() %>
	      					 	<% } else { %>
	      					 		<%= list.get(i).getBoardContent() %>
	      					 	<% } %>
	      					 </span>
	      			
								<div>
									<i class="bi bi-eye"></i>
									<%=list.get(i).getBoardCount()%>
									<i class="bi bi-hand-thumbs-up"></i>
									<%=list.get(i).getBoardRecommend()%>
			

									<div class="foot_wrap" style="float: right">
										<span id="date"><span id="chat2">
											<i class="bi bi-chat-dots"></i> <%=list.get(i).getReplyCount()%></span>
										</span>
									</div>
								</div>
      					 
      				<% } %>
      			<% } else { %>
      				<span class="headtext">게시글이 아직 없습니다.</span>
      					 <span class="bodytext">게시글이 없습니다.</span>
      			<% } %>
      			</div>
      			</a>
      		</div>
      </div>
    </div><!-- outer 끝 -->
	
		
	

	


	
		
	<script>
		// 2) Image Slider
		
		var slider = document.querySelector("#slider");
		var slides = slider.querySelector(".slides");
		var slide = slides.querySelectorAll(".slide");
		
		
		var currentSlide = 0;
		setInterval(function () {
				
			    var from = -(1100 * currentSlide);
			    var to = from - 1100;
			    slides.animate(
			        {
			            marginLeft: [from + "px", to + "px"],
			        },
			        {
			            duration: 1000,
			            easing: "ease",
			            iterations: 1,
			            fill: "both",
			        }
			    );
			    ++currentSlide;
			    if (currentSlide === slide.length - 1) {
			        currentSlide = 0;
			        
			    }
			    
			}, 3500);
		


	</script>

	


  <script src='https://cdnjs.cloudflare.com/ajax/libs/gsap/2.0.1/TweenMax.min.js'></script>
  <script  src="<%= contextPath %>/resources/js/mainsearch.js"></script>
	<%@ include file="footer.jsp" %>
</body>
</html>