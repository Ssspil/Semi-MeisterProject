<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="com.kh.common.model.vo.PageInfo, com.kh.sellboard.model.vo.*, com.kh.common.model.vo.*, java.util.ArrayList"%>
  <%
 	PageInfo pi2 = (PageInfo) request.getAttribute("pi");
	int currentPage2 = pi2.getCurrentPage();
	int startPage2 = pi2.getStartPage();
	int endPage2 = pi2.getEndPage();
	int maxPage2 = pi2.getMaxPage(); 
	
	ArrayList<SellBoard> s2 = (ArrayList<SellBoard>) request.getAttribute("s");
	ArrayList<Attachment> at2 = (ArrayList<Attachment>) request.getAttribute("at");
	ArrayList<Integer> status2 = (ArrayList<Integer>) request.getAttribute("status");
	
	if(at2 == null){
		at2.add(new Attachment());
	}
  
  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 여긴 완료된거래 내역 페이지입니다 -->
<title>Insert title here</title>
</head>
<body>

<div id="nameBody_2">
<div id="contenthead"></div>
	<%if(!s2.isEmpty()){ %>
   		<%for(int i =0; i < s2.size(); i++) { %>
       		<%if(status2.get(i) == 2 ){%>       		
		        <div class="name2Body">
		            <div id="title">
		                <span id="title1">거래 완료</span>
		                <span id="title2"><%=s2.get(i).getSellTitle() %></span>
		            </div>
		            <br><br>
		            <input type="hidden" name="receiver" value="<%=s2.get(i).getUserNO() %>">
					<img src="<%=request.getContextPath() %>/<%=at2.get(i).getFilePath() %>/<%=at2.get(i).getChangeName() %>" id="img">
		            <span id="category">분류><%=s2.get(i).getInterestName() %></span>
		            <br>
					<span id="content"><%=s2.get(i).getSellContent() %></span>
		            <br><br>
		            <span id="price"><%=s2.get(i).getPrice() %> 원</span>
		            <br>
		            <button id="btn1" >리뷰삭제</button>
		            <button id="btn2" >리뷰수정</button>
		            <button id="btn3" >리뷰쓰기</button>
		        </div>
        	<%} %>
   		<%} %>
   	<%} %>
</div>
        
        <div id="page2">
	   페이징 처리 2
	   </div>
</body>
</html>