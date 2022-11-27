<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="com.kh.common.model.vo.PageInfo, com.kh.sellboard.model.vo.*, com.kh.common.model.vo.*, java.util.ArrayList"%>
  <%
 	PageInfo pi3 = (PageInfo) request.getAttribute("pi");
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
</head>
<body>
<div id="nameBody_3">
<div id="contenthead"></div>
	<%if(!s3.isEmpty()){ %>
   		<%for(int i =0; i < s3.size(); i++) { %>
       		<%if(status3.get(i) == 3 ){%>       		
		        <div class="name3Body">
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
	   페이징 처리 3
	   </div>
</body>
</html>