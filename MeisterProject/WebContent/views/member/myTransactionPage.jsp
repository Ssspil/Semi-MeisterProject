<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="com.kh.common.model.vo.PageInfo, com.kh.sellboard.model.vo.*, com.kh.common.model.vo.*, java.util.ArrayList"%>
  <%
 	PageInfo pi = (PageInfo) request.getAttribute("pi");
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage(); 
	
	ArrayList<SellBoard> s = (ArrayList<SellBoard>) request.getAttribute("s");
	ArrayList<Attachment> at = (ArrayList<Attachment>) request.getAttribute("at");
	ArrayList<Integer> status = (ArrayList<Integer>) request.getAttribute("status");
	
	if(at == null){
		at.add(new Attachment());
	}
  
  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 거래 내역</title>
<!-- 여기는 진행중인 거래페이지입니다 -->
<!--  google font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet">
</head>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
   
   <style>
   .header{
    box-sizing: border-box;
    height: 130px;
}
#main{

height:100%;

}
#titlename{
    position: relative;
    left: 295px;
    height: 80px;
}
#body1{
    box-sizing: border-box;
    border-top: 2px solid orange;
    border-bottom: 2px solid orange;
    height: 70px;
    margin: auto;
    width: 60%;
}

#contenthead{
    box-sizing: border-box;
    height: 60px;
}
.name1Body{
    box-sizing: border-box;
    border: 3px solid black;
    height:271px;
    width: 60%;
    margin: auto;
    padding: 15px;
    margin-bottom:30px;
    border-radius: 15px;
}
.name2Body{
    box-sizing: border-box;
    border: 3px solid black;
    height:271px;
    width: 60%;
    margin: auto;
    padding: 15px;
    margin-bottom:30px;
    border-radius: 15px;
}
.name3Body{
    box-sizing: border-box;
    border: 3px solid black;
    height:271px;
    width: 60%;
    margin: auto;
    padding: 15px;
    margin-bottom:30px;
    border-radius: 15px;
}
#name1Body:hover{
background-color:rgb(250, 247, 247);     
}

.statusBtn{
    box-sizing: border-box;
    height: 66px;
    width: 294px;
    float: left;
    background-color: white;
    border: 3px solid black;
    border-radius: 15px;
    font-size: 17px;
    font-family: 'Nanum Gothic', sans-serif;
    font-weight: bold; 
}
.statusBtn:hover{
    background-color:rgb(255, 200, 98);
    color: white;
}

#title{
float: left;
font-family: 'Nanum Gothic', sans-serif;
}
#img{
    width: 200px;
    height:170px;
    float: left;
    margin-right: 30px;
}
#title1{
margin-left:60px;
font-weight: bold;
font-family: 'Nanum Gothic', sans-serif;
}
#title2{
position: relative;
font-weight: bold;
left: 240px;
font-family: 'Nanum Gothic', sans-serif;
}
#price{
    float: right;
    margin-right: 30px;
    font-weight: bold;
    position: relative;
    top:15px;
    font-family: 'Nanum Gothic', sans-serif;
}
#btn1,#btn2,#btn3{
    float: right;
    margin-right: 30px;
    position: relative;
    top:35px;
    background-color: orange;
    border: 1px solid orange;
    border-radius: 5px;
    width: 90px;
    height: 30px;
    font-family: 'Nanum Gothic', sans-serif;
}
#content{
    width: 450px;
    height: 47px;
    overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-inline-box;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 2;
	 font-family: 'Nanum Gothic', sans-serif;
     position: relative;
     top:12px;
}
#category{
    color:lightgray;
    font-family: 'Nanum Gothic', sans-serif;
}
#page{
box-sizing: border-box;
border-bottom: 2px solid black;
border-top: 2px solid black;
width: 60%;
margin: auto;
height: 50px;
}
#page2{
box-sizing: border-box;
border-bottom: 2px solid black;
border-top: 2px solid black;
width: 60%;
margin: auto;
height: 50px;
}
#page3{
box-sizing: border-box;
border-bottom: 2px solid black;
border-top: 2px solid black;
width: 60%;
margin: auto;
height: 50px;
}
#nameBody_2,#nameBody_3{
	height:100%;
	display:none;
}
#page2,#page3{
	display:none;
}
.hide{
	display: none;
}
.page_wrap {
	text-align: center;
	position: relative;
	top: 10px;
}

.page_wrap span {
	padding: 5px;
	cursor: pointer;
}

.page_wrap .sel {
	color: orange;
	border-bottom: 1px solid orange;
}

.page_wrap span:hover {
	color: orange;
	cursor: pointer;
	border-bottom: 1px solid orange;
}
#null{
 text-align: center;
}
#null2{
 text-align: center;
 color:rgb(249, 172, 30);
  font-size:15px;
}
#img1{
    text-align: center; 
}
#nullhead{
height:400px;
margin:auto;
}
#ddddd{
height:100px;
}
</style>
</head>
<body>

<%@include file="../common/header.jsp" %>
  <div class="header"></div>
    <div id=main>
    <h1 id="titlename">나의 거래 내역</h1>

        <div id="body1">
            <div>
            <button class="statusBtn" id="current" onclick="menuClick('current')">진행중인 거래</button>
        </div>
        <div>
            <button class="statusBtn" id="complete" onclick="menuClick('complete')">완료된 거래</button>
        </div>
        <div>
            <button class="statusBtn" id="cancel" onclick="menuClick('cancel')">취소된 거래</button>
        </div>

        </div>
        <div id="nameBody_1">
        <div id="contenthead"></div>
        

	<%if(s.isEmpty()){ %>
	   <div id="ddddd"></div>
         <div id="nullhead">
			<div id="img1"><i class="bi bi-emoji-expressionless"></i></div>
			<br>
			<div id="null">진행중인 거래가 없습니다.</div>
			<div id="null2">쇼핑 ㄱㄱ</div>
			
		</div>
		<%}else {%>
       <%for(int i =0; i < s.size(); i++) { %>
       		<%if(status.get(i) == 1 ){%>       		
		        <div class="name1Body Tran Tran<%=i%> <%=i > 6 ? "hide" : ""%>">
		            <div id="title">
		                <span id="title1">진행중인 거래</span>
		                <span id="title2"><%=s.get(i).getSellTitle() %></span>
		            </div>
		            <br><br>
		            <input type="hidden" name="receiver" value="<%=s.get(i).getUserNO() %>">
					<img src="<%=contextPath %>/<%=at.get(i).getFilePath() %>/<%=at.get(i).getChangeName() %>" id="img">
		            <span id="category">분류><%=s.get(i).getInterestName() %></span>
		            <br>
					<span id="content"><%=s.get(i).getSellContent() %></span>
		            <br><br>
		            <span id="price"><%=s.get(i).getPrice() %> 원</span>
		            <br>
		            <button id="btn1" >구매취소</button>
		            <button id="btn2" >판매자문의</button>
		            <button id="btn3" >작업완료</button>
		        </div>
        	<%} %>
   		<%} %>
   	<%} %>
	   
	   
	   </div>
	   <%@ include file="../member/myCompletedTransactionPage.jsp"%>
	<%@ include file="../member/myCanceledTransactionPage.jsp"%>
		
	   <div id="page">
	   <div class="page_wrap">
				<span onclick="pageMove('pre')">&lt</span>
				<%
					for (int i = startPage; i <= endPage; i++) {
					if (i == currentPage) {
				%>
				<span class="page<%=i%> sel" onclick="pageMove('<%=i%>')">[<%=i%>]
				</span>
				<%
					} else {
				%>
				<span class="page<%=i%>" onclick="pageMove('<%=i%>')">[<%=i%>]
				</span>
				<%
					}
				%>
				<%
					}
				%>
				<span onclick="pageMove('next')">&gt</span>
				
			</div>
	   </div>

</div>



		<script>
	  function menuClick(type) {
      if (type == "current") {
         $("#nameBody_1").show();
         $("#nameBody_2").hide();
         $("#nameBody_3").hide();
         $("#page").show();
         $("#page2").hide();
         $("#page3").hide();
     
      } else if (type == "complete") {
         $("#nameBody_2").show();
         $("#nameBody_1").hide();
         $("#nameBody_3").hide();
         $("#page2").show();
         $("#page").hide();
         $("#page3").hide();	
      } else if(type == "cancel") {
         $("#nameBody_3").show();
         $("#nameBody_1").hide();
         $("#nameBody_2").hide();
         $("#page3").show();
         $("#page").hide();
         $("#page2").hide();
       }

      }  
	  function pageMove(currentPage) {
	      if (currentPage == "next") {
	         currentPage = Number($(".page_wrap .sel").text().substring(1, 2)) + 1;
	      }
	      if (currentPage == "pre") {
	         currentPage = Number($(".page_wrap .sel").text().substring(1, 2)) - 1;
	      }
	      var cnt = (currentPage - 1) * 7;
	      $(".Tran").hide();
	      for (var i = cnt; i < cnt + 7; i++) {
	         $(".Tran" + (i)).show();
	      }
	      $(".page_wrap span").removeClass("sel");
	      $(".page" + currentPage).addClass("sel");
	   }
	 
  
		</script>
	
	
	
	
	
	<%@include file="../common/footer.jsp" %>
</body>
</html>