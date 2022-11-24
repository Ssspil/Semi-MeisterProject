<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.ArrayList, com.kh.board.model.vo.*, com.kh.common.model.vo.PageInfo"%>
    <%  
    ArrayList<Reply> list2 = (ArrayList<Reply>)request.getAttribute("list2");
    String contextPath2 = request.getContextPath();
    
    PageInfo pi2 = (PageInfo) request.getAttribute("pi2");

    int currentPage2 = pi2.getCurrentPage();
    int startPage2 = pi2.getStartPage();
    int endPage2 = pi2.getEndPage();
    int maxPage2 = pi2.getMaxPage();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#bodypost2{
float: left;
position: relative;
left:150px;
width: 470px;
display: -webkit-inline-box;
overflow: hidden;
-webkit-box-orient: vertical;
-webkit-line-clamp: 2;
}
.page_wrap2 {
	text-align: center;
	position: relative;
	top: 25px;
}

.page_wrap2 span {
	padding: 5px;
	cursor: pointer;
}

.page_wrap2 .sel {
	color: orange;
	border-bottom: 1px solid orange;
}

.page_wrap2 span:hover {
	color: orange;
	cursor: pointer;
	border-bottom: 1px solid orange;
}

</style>
</head>
<body>

		<div id="nameBody_2">
 			<% if(list2.isEmpty()){ %>
         <div id="ddddd"></div>
         <div id="nullhead">
			<div id="img"><i class="bi bi-emoji-expressionless"></i></div>
			<br><br>
			<div id="null">작성한 댓글이 없습니다.</div>
			<div id="null2">커뮤니티에서 댓글을 작성해 보세요!</div>
		</div>
		<%} else { %>	
				<%for (int i = 0; i < list2.size(); i++) { %>
		<div id="name2Body" class="name2Body board2 board2<%=i%> <%=i > 6 ? "hide" : ""%>" onclick="location.href='<%=contextPath2%>/detail.bo?&bno=<%=list2.get(i).getBoardNo() %>';">

		
            <div id="title"> 
                <div id="titlepost">게시글 제목</div>
                <div id="titlepost1"><%=list2.get(i).getBoardTitle() %></div>
            </div>
            <br><br>
            <div id="body">
                <div id="bodypost">댓글 내용</div>
                <div id="bodypost2"><%=list2.get(i).getReplyContent() %></div>
            </div>
            <br><br><br><br><br>
            <div id="footer">
                <div id="footerpost">댓글 작성 날짜</div>
                <div id="footerpost1"><%=list2.get(i).getReplyDate() %></div>
              
            </div>
        </div>
       
    
       
				<%}	}%>
				<div id="page">
            <div class="page_wrap2">
				<span onclick="pageMove2('pre')">&lt</span>
				<%
					for (int i = startPage2; i <= endPage2; i++) {
					if (i == currentPage2) {
				%>
				<span class="page2<%=i%> sel" onclick="pageMove2('<%=i%>')">[<%=i%>]
				</span>
				<%
					} else {
				%>
				<span class="page2<%=i%>" onclick="pageMove2('<%=i%>')">[<%=i%>]
				</span>
				<%
					}
				%>
				<%
					}
				%>
				
				<span onclick="pageMove2('next')">&gt</span>
				
			</div>
        </div>
				
				
		</div>
				
        <script>
         function pageMove2(currentPage) {
	      if (currentPage == "next") {
	         currentPage = Number($(".page_wrap .sel").text().substring(1, 2)) + 1;
	      }
	      if (currentPage == "pre") {
	         currentPage = Number($(".page_wrap .sel").text().substring(1, 2)) - 1;
	      }
	      var cnt = (currentPage - 1) * 7;
	      $(".board2").hide();
	      for (var i = cnt; i < cnt + 7; i++) {
	         $(".board2" + (i)).show();
	      }
	      $(".page_wrap2 span").removeClass("sel");
	      $(".page2" + currentPage).addClass("sel");
	   }
	  
   </script>
</body>
</html>