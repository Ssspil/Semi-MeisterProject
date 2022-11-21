<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.ArrayList, com.kh.board.model.vo.*, com.kh.common.model.vo.PageInfo"%>
    <%  
    ArrayList<Reply> list2 = (ArrayList<Reply>)request.getAttribute("list2");
  
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


				<%
					for (int i = 0; i < list2.size(); i++) {
				%>
		<div id="name2Body"  style="display:none" class="board board<%=i%> <%=i > 5 ? "hide" : ""%>">
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