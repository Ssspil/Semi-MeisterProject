<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.ArrayList, com.kh.board.model.vo.*, com.kh.common.model.vo.PageInfo"%>
    <%  
    ArrayList<Reply> list2 = (ArrayList<Reply>)request.getAttribute("list2");
    String contextPath2 = request.getContextPath();
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

</style>
</head>
<body>
  		<input type="hidden" id="boardType" value="2">
				<%for (int i = 0; i < list2.size(); i++) { %>
		<div id="name2Body" class="name2Body board<%=i%> <%=i > 5 ? "hide" : ""%>">
<!-- 		myReply 매퍼에 board_no 추가하기 -->
<%-- 		 onclick="location.href='<%=contextPath2%>/detail.bo?&bno=<%=list2.get(i).getBoardNo() %>';"  --%>
		
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
       
    
       
				<%	}%>
				
        
        
</body>
</html>