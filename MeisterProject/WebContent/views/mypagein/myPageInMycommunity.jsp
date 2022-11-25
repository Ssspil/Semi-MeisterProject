<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.board.model.vo.*, com.kh.common.model.vo.PageInfo"%>
    <%  ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
   
    PageInfo pi = (PageInfo) request.getAttribute("pi");
     int currentPage = pi.getCurrentPage();
    int startPage = pi.getStartPage();
    int endPage = pi.getEndPage();
    int maxPage = pi.getMaxPage(); 
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    border-top: 3px solid yellow;
    border-bottom: 3px solid yellow;
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
    border: 3px solid orange;
    border-radius: 30px;
    height:210px;
    width: 60%;
    margin: auto;
    padding: 15px;
    margin-bottom:30px;
}
#name1Body:hover{
background-color:rgb(250, 247, 247);
         

}
#name2Body:hover{
background-color:rgb(250, 247, 247);
         

}
#name2Body{
    box-sizing: border-box;
    border: 3px solid orange;
    border-radius: 30px;
    height:210px;
    width: 60%;
    margin: auto;
    padding: 15px;
 
}
#name1{
    box-sizing: border-box;
    height: 67px;
    width: 170px;
    float: left;
    background-color: white;
    border: 5px solid orange;
    color:orange;
    border-radius: 25px;
    font-size: 17px;
    font-family: 'Nanum Gothic', sans-serif;
    font-weight: bold;
   
}
#name1:hover{
    background-color:rgb(255, 200, 98);
    
    color: white;
}
#name2{
    box-sizing: border-box;
    height: 67px;
    width: 170px;
    float: left;
    background-color: white;
    border: 5px solid orange;
    color:orange;
    border-radius: 25px;
    font-size: 17px;
    font-family: 'Nanum Gothic', sans-serif;
    font-weight: bold;
}
#name2:hover{
    background-color:rgb(255, 200, 98);
 
    color: white;
}
#title{
float: left;
}
#titlepost{
float: left;
}
#titlepost1{
float: left;
position: relative;
left:100px;
width: 470px;
display: -webkit-inline-box;
overflow: hidden;
-webkit-box-orient: vertical;
-webkit-line-clamp: 1;

}
#body{
float: left;
}
#bodypost{
float: left;
}
#bodypost1{
float: left;
position: relative;
left:100px;
width: 470px;
display: -webkit-inline-box;
overflow: hidden;
-webkit-box-orient: vertical;
-webkit-line-clamp: 2;

}
#footer{
float: left;
width: 820px;
position: relative;
top: -15px;
}
#footerpost{
float: left;
}
#footerpost1{
float: left;
position: relative;
left:115px;
}
#footerpost2{
float: right;
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
#bodyClick1{
color: black;
}
#bodyClick2{
color: blue;
}
#null{
 text-align: center;
}
#null2{
 text-align: center;
 color:rgb(249, 172, 30);
  font-size:15px;
}
#img{
    text-align: center; 
}
#nullhead{
height:400px;
margin:auto;
}
#ddddd{
height:100px;
}
#nameBody_1, #nameBody_2{
	height:100%;
	display:none;
}
.hide{
	display: none;
}


</style>
</head>
<body>

<%@include file="../common/header.jsp" %>
  <div class="header"></div>
    <div id=main>
    <h1 id="titlename">나의 커뮤니티</h1>

        <div id="body1">
            <div>
            <button class="bodyClick1" id="name1" onclick="menuClick('name1')">내가 쓴 게시물</button>
        </div>
        <div>
            <button class="bodyClick2" id="name2"  onclick="menuClick('name2')">내가 쓴 댓글</button>
            
        </div>

        </div>
        <div id="contenthead"></div>
        
        <div id="nameBody_1">
         <% if(list.isEmpty()){ %>
         <div id="ddddd"></div>
         <div id="nullhead">
			<div id="img"><i class="bi bi-emoji-expressionless"></i></div>
			<br><br>
			<div id="null">등록된 게시글이 없습니다.</div>
			<div id="null2">커뮤니티에서 게시글을 작성해 보세요!</div>
			
		</div>
		<%} else { %>	
				<% for (int i = 0; i < list.size(); i++) {%>
					
						
						
        <div class="name1Body board board<%=i%> <%=i > 6 ? "hide" : ""%>" onclick="location.href='<%=contextPath%>/detail.bo?&bno=<%=list.get(i).getBoardNo() %>';">
			
			<div id="title"> 
                <div id="titlepost">커뮤니티 게시글 제목</div> 
                <div id="titlepost1"><%=list.get(i).getBoardTitle() %></div>
            </div>
            <br><br>
            <div id="body">
                <div id="bodypost">커뮤니티 게시글 내용</div>
                <div id="bodypost1"><%=list.get(i).getBoardContent() %></div>
            </div>
            <br><br><br><br><br>
            <div id="footer">
                <div id="footerpost">커뮤니티 작성 날짜</div>
                <div id="footerpost1"><%=list.get(i).getBoardDate() %></div>
                <div id="footerpost2"><i class="bi bi-chat-dots"></i> <%=list.get(i).getReplyCount() %>
                 <i class="bi bi-hand-thumbs-up"></i> <%=list.get(i).getBoardRecommend()%> </div>
            </div>
   
       		<br>
        </div>
       <% } 
	   }%>
	   
	   </div>

       
         
<!--        여기부턴 댓글 -->
        
<%@ include file="../mypagein/myPageInMyReply.jsp"%>
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











<%@ include file="../common/footer.jsp"%>
<script>

	$(function() {
		   
		menuClick('name1');
		  
	})

   function menuClick(type) {
      /* body2 : 게시판 , */
      if (type == "name1") {
         $("#nameBody_1").show();
         $("#nameBody_2").hide();
         $("#page").show();
         $("#name1").addClass("bodyClick1");
         $("#name2").removeClass("bodyClick1");
		 $("#type").val("1"); 
		 $("#boardType").val("name1"); 
		 
      } else if (type == "name2") {
         $("#nameBody_2").show();
         $("#nameBody_1").hide();
         $("#page").hide();
         $("#name2").addClass("bodyClick1");
         $("#name1").removeClass("bodyClick1");
         $("#type").val("2");
		 $("#boardType").val("name2");

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
	      $(".board").hide();
	      for (var i = cnt; i < cnt + 7; i++) {
	         $(".board" + (i)).show();
	      }
	      $(".page_wrap span").removeClass("sel");
	      $(".page" + currentPage).addClass("sel");
	   }
	  
   </script>
</body>
</html>