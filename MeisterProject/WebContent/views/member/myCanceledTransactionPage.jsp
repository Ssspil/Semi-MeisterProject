<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="com.kh.common.model.vo.PageInfo, com.kh.sellboard.model.vo.*, com.kh.common.model.vo.*, java.util.ArrayList"%>
  <%
 	PageInfo pi3 = (PageInfo) request.getAttribute("pi3");
	int currentPage3 = pi3.getCurrentPage();
	int startPage3 = pi3.getStartPage();
	int endPage3 = pi3.getEndPage();
	int maxPage3 = pi3.getMaxPage(); 
	
	ArrayList<SellBoard> s3 = (ArrayList<SellBoard>) request.getAttribute("s");
	ArrayList<Attachment> at3 = (ArrayList<Attachment>) request.getAttribute("at");
	ArrayList<Integer> status3 = (ArrayList<Integer>) request.getAttribute("status");
	
	if(at3 == null){
	}
  
  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 취소된 거래 내역 페이지 입니다 -->
<title>Insert title here</title>
<style>
.page_wrap3 {
	text-align: center;
	position: relative;
	top: 10px;
}

.page_wrap3 span {
	padding: 5px;
	cursor: pointer;
}

.page_wrap3 .sel {
	color: orange;
	border-bottom: 1px solid orange;
}

.page_wrap3 span:hover {
	color: orange;
	cursor: pointer;
	border-bottom: 1px solid orange;
</style>
</head>
<body>
<div id="nameBody_3">
<div id="contenthead"></div>
	<%if(s3.isEmpty()){ %>
	   <div id="ddddd"></div>
         <div id="nullhead">
			<div id="img1"><i class="bi bi-emoji-expressionless"></i></div>
			<br>
			<div id="null">취소된 거래가 없습니다.</div>
			<div id="null2">마켓을 방문해주세요!</div>
			
		</div>
		<%}else {%>
   		<%for(int i =0; i < s3.size(); i++) { %>
       		<%if(status3.get(i) == 3 ){%>       		
		        <div class="name3Body Tran3 Tran3<%=i%> <%=i > 5 ? "hide" : ""%>">
		            <div id="title">
		                <span id="title1">취소된 거래</span>
		                <span id="title2"><%=s3.get(i).getSellTitle() %></span>
		            </div>
		            <br><br>
		            <input type="hidden" name="receiver" value="<%=s3.get(i).getUserNO() %>">
					<img src="<%=request.getContextPath() %>/<%=at3.get(i).getFilePath() %>/<%=at3.get(i).getChangeName() %>" id="img">
		            <span id="category">분류><%=s3.get(i).getInterestName() %></span>
		            <br>
					<span id="content"><%=s3.get(i).getSellContent() %></span>
		            <br><br>
		            <span id="price"><%=s3.get(i).getPrice() %> 원</span>
		            <br>
		            <button id="btn1" >리뷰삭제</button>
		            <button id="btn2" >리뷰수정</button>
		            <button id="btn3" >리뷰쓰기</button>
		        </div>
        	<%} %>
   		<%} %>
   	<%} %>
</div>
        <div id="page3">
	     <div class="page_wrap3">
				<span onclick="pageMove3('pre')">&lt</span>
				<%
					for (int i = startPage3; i <= endPage3; i++) {
					if (i == currentPage3) {
				%>
				<span class="page3<%=i%> sel" onclick="pageMove3('<%=i%>')">[<%=i%>]
				</span>
				<%
					} else {
				%>
				<span class="page3<%=i%>" onclick="pageMove3('<%=i%>')">[<%=i%>]
				</span>
				<%
					}
				%>
				<%
					}
				%>				
				<span onclick="pageMove3('next')">&gt</span>
				
			</div>
	   </div>
	   
	      <script>
	   function pageMove3(currentPage) {
		      if (currentPage == "next") {
		         currentPage = Number($(".page_wrap .sel").text().substring(1, 2)) + 1;
		      }
		      if (currentPage == "pre") {
		         currentPage = Number($(".page_wrap .sel").text().substring(1, 2)) - 1;
		      }
		      var cnt = (currentPage - 1) * 6;
		      $(".Tran3").hide();
		      for (var i = cnt; i < cnt + 6; i++) {
		         $(".Tran3" + (i)).show();
		      }
		      $(".page_wrap3 span").removeClass("sel");
		      $(".page3" + currentPage3).addClass("sel");
		   }
		 
	   
	   </script>
</body>
</html>